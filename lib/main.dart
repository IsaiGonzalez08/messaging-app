import 'package:app_mensajeria/firebase_options.dart';
import 'package:app_mensajeria/presentation/providers/user_provider.dart';
import 'package:app_mensajeria/presentation/screens/login_screen.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider<UserProvider>(create: (context) => UserProvider())
    ],
    child: MyLoginScreen(),
  ));
}
