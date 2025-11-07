import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:pra_login/screens/home_screen.dart';
import 'package:pra_login/screens/login_screen.dart';
import 'package:pra_login/screens/password_reset_screen.dart';
import 'package:pra_login/screens/register_screen.dart';
import 'package:pra_login/screens/setting_screen.dart';
import 'package:pra_login/screens/splash_screen.dart';
import 'package:pra_login/models/user_model.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Hive.initFlutter();

  Hive.registerAdapter(UserAdapter());
  await Hive.openBox<User>('usersBox');
  await Hive.openBox<String>('currentUserBox');

  var currentUserBox = Hive.box<String>('currentUserBox');
  String? email = currentUserBox.get('current_user');

  runApp(MyApp(isLoggedIn: email != null));
}

class MyApp extends StatelessWidget {
  final bool isLoggedIn;
  const MyApp({super.key, required this.isLoggedIn});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      debugShowCheckedModeBanner: false,
      title: 'Authentication',
      home: SplashScreen(),
      routes: {
        'login': (context) => MyLogin(),
        'register': (context) => MyRegister(),
        'home': (context) => MyHome(),
        'settings': (context) => MySetting(),
        'resetPass': (context) => MyPassReset()
      },
    );
  }
}