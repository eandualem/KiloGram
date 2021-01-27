import 'package:flutter/material.dart';
import 'package:kilogram/services/locator.dart';
import 'package:kilogram/services/telegram_service.dart';
import 'package:kilogram/utils/const.dart';
import 'package:provider/provider.dart';
import 'package:kilogram/utils/router.dart' as utilrouter;


void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Provider.debugCheckInvalidValueType = null;
  setupLocator();
  runApp(
    MultiProvider(
      providers: [
        Provider<TelegramService>(
          create: (_) => TelegramService(lastRouteName: initRoute),
          lazy: false,
        ),
      ],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  MyApp();
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      navigatorKey: locator<NavigationService>().navigatorKey,
      title: 'Flutter Demo',
      theme: ThemeData.dark(),
      onGenerateRoute: utilrouter.Router.generateRoute,
      initialRoute: initRoute,
    );
  }
}
