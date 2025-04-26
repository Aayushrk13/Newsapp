import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:newsapp/features/home/model/articlemodel.dart';
import 'package:newsapp/features/splashscreen/splashscreen.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final dir = await getApplicationDocumentsDirectory();
  Hive.init(dir.path);
  Hive.registerAdapter(ArticlemodelAdapter());
  await Hive.openBox('newsbox');
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'TimesNewRoman',
        scaffoldBackgroundColor: Colors.white,
        appBarTheme: AppBarTheme(backgroundColor: Colors.black),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            foregroundColor: Colors.white,
            textStyle: TextStyle(fontSize: 16),
            elevation: 10,
            fixedSize: Size(350, 50),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8),
            ),
          ),
        ),
      ),
      home: SplashScreen(),
    );
  }
}
