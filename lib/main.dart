import 'package:flutter/material.dart';
import 'package:kilogram/services/locator.dart';
import 'package:kilogram/services/client.dart';
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
        Provider<Client>( create: (_) => Client(lastRouteName: initRoute), lazy: false,),
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
      title: 'KiloGram',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Color(0xff585CE5),
        accentColor: Color(0xFFF2F6FE),
      ),
      onGenerateRoute: utilrouter.Router.generateRoute,
      initialRoute: initRoute,
    );
  }
}
