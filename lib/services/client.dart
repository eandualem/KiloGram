import 'dart:async';
import 'dart:io';
import 'dart:math';
import 'package:flutter/material.dart' show ChangeNotifier;
import 'package:kilogram/utils/const.dart';
import 'package:path_provider/path_provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:tdlib/td_api.dart';
import 'package:tdlib/td_client.dart';
import 'package:kilogram/services/locator.dart';

int _random() => Random().nextInt(10000000);

class Client extends ChangeNotifier {
  int _clientId;
  StreamController<TdObject> eventController;
  StreamSubscription<TdObject> _eventReceiver;
  Map results = <int, Completer>{};
  Map callbackResults = <int, Future<void>>{};
  Directory appDocDir;
  Directory appExtDir;
  String lastRouteName;

  Client({this.lastRouteName}) {
    eventController = StreamController.broadcast();
    eventController.stream.listen(_onEvent);
    initClient();
  }

  void initClient() async {
    if (_clientId != null) {
      return;
    }

    _clientId = await TdClient.createClient();

    PermissionStatus storagePermission = await Permission.storage.request(); // todo : handel storage permission

    appDocDir = await getApplicationDocumentsDirectory();
    appExtDir = await getTemporaryDirectory();

    await execute(SetLogVerbosityLevel(newVerbosityLevel: 1));
    _eventReceiver = TdClient.clientEvents(_clientId).listen(_receiver);
  }

  void getMainChatList({ void Function(TdError) onError, }) async
  {
    int offsetChatId = 0;
    int offsetOrder = (pow(2, 63) - 1);
    final result = await send( GetChats(chatList: new ChatList(), offsetOrder: offsetOrder, offsetChatId: offsetChatId, limit: 100));
    print("res ///=>>> ${results.toString()}");
    if (result is TdError && onError != null) {
      onError(result);
    }
  }

  void _receiver(TdObject newEvent) async {
    if (newEvent != null) {
      if (newEvent is Updates) {
        newEvent.updates.forEach((Update event) => eventController.add(event));
      } else {
        eventController.add(newEvent);
      }
      await _resolveEvent(newEvent);
    }
  }

  Future _resolveEvent(event) async {
    final int extraId = event.extra;
    if (results.containsKey(extraId)) {
      results.remove(extraId).complete(event);
    } else if (callbackResults.containsKey(extraId)) {
      await callbackResults.remove(extraId);
    }
  }

  void stop() {
    eventController.close();
    _eventReceiver.cancel();
  }

  void _onEvent(TdObject event) async {
    // try {
    //   print('res =>>>> ${event.toJson()}');
    // } catch (NoSuchMethodError) {
    //   print('res =>>>> ${event.getConstructor()}');
    // }

    switch (event.getConstructor()) {
      case UpdateAuthorizationState.CONSTRUCTOR:
        await _authorizationController(
          (event as UpdateAuthorizationState).authorizationState,
          isOffline: true,
        );
        break;
      default:
        return;
    }
  }

  Future _authorizationController(
    AuthorizationState authState, {
    bool isOffline = false,
  }) async {
    String route;
    switch (authState.getConstructor()) {
      case AuthorizationStateWaitTdlibParameters.CONSTRUCTOR:
        await send(
          SetTdlibParameters(
            parameters: TdlibParameters(
              useTestDc: false,
              useSecretChats: false,
              useMessageDatabase: true,
              useFileDatabase: true,
              useChatInfoDatabase: true,
              ignoreFileNames: true,
              enableStorageOptimizer: true,
              systemLanguageCode: 'EN',
              filesDirectory: appExtDir.path + '/tdlib',
              databaseDirectory: appDocDir.path,
              applicationVersion: '0.0.1',
              deviceModel: 'Unknown',
              systemVersion: 'Unknonw',
              apiId: 1311145,
              apiHash: '634c7b54b8b710ad6a36428b095e2b60',
            ),
          ),
        );
        return;
      case AuthorizationStateWaitEncryptionKey.CONSTRUCTOR:
        if ((authState as AuthorizationStateWaitEncryptionKey).isEncrypted) {
          await send(
            CheckDatabaseEncryptionKey(
              encryptionKey: 'mostrandomencryption',
            ),
          );
        } else {
          await send(
            SetDatabaseEncryptionKey(
              newEncryptionKey: 'mostrandomencryption',
            ),
          );
        }
        return;
      case AuthorizationStateWaitPhoneNumber.CONSTRUCTOR:
      case AuthorizationStateClosed.CONSTRUCTOR:
        route = loginRoute;
        break;
      case AuthorizationStateReady.CONSTRUCTOR:
        route = homeRoute;
        break;
      case AuthorizationStateWaitCode.CONSTRUCTOR:
        route = otpRoute;
        break;
      case AuthorizationStateWaitOtherDeviceConfirmation.CONSTRUCTOR:
      case AuthorizationStateWaitRegistration.CONSTRUCTOR:
      case AuthorizationStateWaitPassword.CONSTRUCTOR:
      case AuthorizationStateLoggingOut.CONSTRUCTOR:
      case AuthorizationStateClosing.CONSTRUCTOR:
        return;
      default:
        return;
    }

    if (route == lastRouteName) return;
    lastRouteName = route;
    locator<NavigationService>().navigateTo(route);
  }

  void destroyClient() async {
    await TdClient.destroyClient(_clientId);
  }

  Future<TdObject> send(event, {Future<void> callback}) async {
    print("\n" + "-----"*16);
    print('event // =>>>> ${event.toJson()}');
    print("-----"*16 + "\n");
    // ignore: missing_return
    final rndId = _random();
    event.extra = rndId;
    if (callback != null) {
      callbackResults[rndId] = callback;
      try {
        await TdClient.clientSend(_clientId, event);
      } catch (e) {
        print(e);
      }
    } else {
      final completer = Completer<TdObject>();
      results[rndId] = completer;
      await TdClient.clientSend(_clientId, event);
      return completer.future;
    }

    return null;
  }

  Future<TdObject> execute(TdFunction event) async =>
      await TdClient.clientExecute(_clientId, event);

  Future setAuthenticationPhoneNumber( String phoneNumber, { void Function(TdError) onError, }) async {
    final result = await send(
      SetAuthenticationPhoneNumber(
        phoneNumber: phoneNumber,
        settings: PhoneNumberAuthenticationSettings(
          allowFlashCall: false,
          isCurrentPhoneNumber: false,
          allowSmsRetrieverApi: false,
        ),
      ),
    );
    if (result is TdError && onError != null) {
      onError(result);
    }
  }

  Future checkAuthenticationCode(
    String code, {
    void Function(TdError) onError,
  }) async {
    final result = await send(
      CheckAuthenticationCode(
        code: code,
      ),
    );
    if (result is TdError && onError != null) {
      onError(result);
    }
  }
}
