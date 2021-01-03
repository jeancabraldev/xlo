import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:xlo/screens/base/base_screen.dart';
import 'package:xlo/stores/category_store.dart';
import 'package:xlo/stores/page_store.dart';
import 'package:xlo/stores/user_manager_store.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initializeParse();
  setupLocators();
  runApp(MyApp());
}

//Localizando serviços do aplicativo
void setupLocators() {
  GetIt.I.registerSingleton(PageStore());
  GetIt.I.registerSingleton(UserManagerStore());
  GetIt.I.registerSingleton(CategoryStore());
}

//Inicializando servidor de banco de dados
Future<void> initializeParse() async {
  await Parse().initialize(
    'QFD9R2TK7xCvjjE9a6c997XipqJZJmieREAL7Vrb',
    'https://parseapi.back4app.com/',
    clientKey: 'r1W9tWeKOD3KLngylvZnz874mJSpcMB05ree9Llf',
    autoSendSessionId: true,
    debug: true,
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'XLO',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepPurpleAccent,
        scaffoldBackgroundColor: Colors.deepPurpleAccent,
        cursorColor: Colors.deepOrangeAccent,
        visualDensity: VisualDensity.adaptivePlatformDensity,
        accentColor: Colors.deepPurpleAccent,
        textTheme: GoogleFonts.montserratTextTheme(
          Theme.of(context).textTheme,
        ),
        appBarTheme: const AppBarTheme(
          elevation: 0,
        ),
      ),
      home: BaseScreen(),
    );
  }
}
