import 'dart:async';

import 'package:admin/helpers/initController.dart';
import 'package:admin/views/Auth/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await GetStorage.init();
  init();
  runApp(const MyApp());

  // Add more routes as needed
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
        debugShowCheckedModeBanner: false,
        onInit: () {
          // Get.find<DbController>().init();
        },
        localizationsDelegates: const [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
        ],
        supportedLocales: const [
          Locale('en', 'US'), // English
        ],
        title: 'My App',
        theme: ThemeData(
          useMaterial3: true,
          primaryColor: Colors.red,

          colorScheme: const ColorScheme(
            brightness: Brightness.light,
            primary: Colors.black,
            onPrimary: Color(0xFFF6F6F6),
            primaryContainer: Color(0xFFF6F6F6),
            onPrimaryContainer: Color(0xFFF6F6F6),
            secondary: Color(0xFFF6F6F6),
            onSecondary: Color(0xFFF6F6F6),
            secondaryContainer: Color(0xFFF6F6F6),
            onSecondaryContainer: Color(0xFFF6F6F6),
            tertiary: Color(0xFFF6F6F6),
            onTertiary: Color(0xFFF6F6F6),
            tertiaryContainer: Color(0xFFF6F6F6),
            onTertiaryContainer: Color(0xFFF6F6F6),
            error: Color(0xFFF6F6F6),
            errorContainer: Color(0xFFF6F6F6),
            onError: Color(0xFFF6F6F6),
            onErrorContainer: Color(0xFFF6F6F6),
            background: Color(0xFFF6F6F6),
            onBackground: Color(0xFFF6F6F6),
            surface: Color(0xFFF6F6F6),
            onSurface: Colors.black,
            surfaceVariant: Color(0xFFF6F6F6),
            onSurfaceVariant: Color(0xFFF6F6F6),
            outline: Color(0xFFF6F6F6),
            onInverseSurface: Color(0xFFF6F6F6),
            inverseSurface: Color(0xFFF6F6F6),
            inversePrimary: Color(0xFFF6F6F6),
            shadow: Color(0xFF000000),
            surfaceTint: Color(0xFFF6F6F6),
          ),
          // accentColor: Colors.blue,
        ),
        home:
            // const SplashScreen()
            const Login()
        // const Menu()
        // const TableOrder()
        // const Home(),
        );
  }
}

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text('My Home Page'),
//       ),
//       body: Center(
//         child: Text(
//           'Hello, world!',
//         ),
//       ),
//     );
//   }
// }