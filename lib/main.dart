import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:project_3_5/provider/auth_provider.dart';
import 'package:project_3_5/provider/product_provider.dart';
import 'package:project_3_5/view/auth/login_screen.dart';
import 'package:project_3_5/view/home/home_screen.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
          ChangeNotifierProvider(create: (context)=>AuthProviderr()),
          ChangeNotifierProvider(create: (context)=>ProductProvider())
      ],
      child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color.fromARGB(255, 183, 93, 58),
            ),
            fontFamily: 'Iosevka_Charon',
          ),
          home: HomeScreen(),
        ),
    );
  }
}
