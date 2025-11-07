import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:pra_login/models/user_model.dart';

class MyHome extends StatefulWidget {
  const MyHome({super.key});

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    var userBox = Hive.box<User>('usersBox');
    var currentUserBox = Hive.box<String>('currentUserBox');

    String? email = currentUserBox.get('current_user');

    User? user = email != null ? userBox.get(email) : null;

    if(user == null){
      return Scaffold(
        body: Center(child: Text('No user logged In'))
      );
    }

    return Scaffold(
      backgroundColor: Colors.blue.shade100,
      appBar: AppBar(
        title: Text('Home', style: TextStyle(color: Colors.white, fontSize: 20, fontWeight: FontWeight.w700),),
        backgroundColor: Colors.blue.shade700,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                  child: CircleAvatar(
                    radius: 75,
                    backgroundImage: AssetImage('assets/image/login.jpeg',),
                  ),
                onHover: (value) => AnimatedIcons.add_event,
                onTap: () {},
              ),
              Text('Welcome ${user.name},\n ${user.email} ', style: TextStyle(fontSize: 20),),
              ElevatedButton(onPressed: () {
                var currentUserBox = Hive.box<String>('currentUserBox');
                currentUserBox.delete('current_user');
                Navigator.pushReplacementNamed(context, 'login');
              }, child: Text('Logout'))
            ],
          ),
        ),
      ),
    );
  }
}
