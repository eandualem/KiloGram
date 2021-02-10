import 'package:kilogram/models/kilogram_chat.dart';
import 'package:kilogram/models/kilogram_chats.dart';
import 'package:tdlib/td_api.dart';

class ChatService
{
  KilogramChats chats;
  ChatService({this.chats});

  void onEvent(TdObject event) async {
    try {
      print('res =>>>> ${event.toJson()}');
    } catch (NoSuchMethodError) {
      print('res =>>>> ${event.getConstructor()}');
    }

    print('size ==>>> ${chats.getSize()}');

    switch (event.getConstructor()) {
      case UpdateNewChat.CONSTRUCTOR:
        chats.addChat(KilogramChat(event.toJson()["chat"]));
        print(KilogramChat(event.toJson()["chat"]));
        print("\n" + "-----" * 16);
        print('res // UpdateNewChat // =>>>> ${event.toJson()}');
        print("-----" * 16 + "\n");
        break;

      case UpdateChatLastMessage.CONSTRUCTOR:
        chats.updateLastMessage(event.toJson());
        print("\n" + "-----"*16);
        print('res // UpdateChatLastMessage // =>>>> ${event.toJson()}');
        print("-----"*16 + "\n");
        break;

    // case UpdateChatReadInbox.CONSTRUCTOR:
    //   kilogramChats.updateChatReadInbox(event);
    //   print('\n\nres // UpdateChatReadInbox // =>>>> ${event.toJson()}');
    //   break;

      default:
        return;
    }
  }
}