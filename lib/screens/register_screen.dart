import 'package:flutter/material.dart';
import 'package:hive/hive.dart';
import 'package:pra_login/models/user_model.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({super.key});

  @override
  State<MyRegister> createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  final formKey = GlobalKey<FormState>();

  final emailController = TextEditingController();
  final nameController = TextEditingController();
  final passwordController = TextEditingController();

  bool obscureText = true;
  String _errorMessage = '';

  void RegisterUser() async{
    if (formKey.currentState!.validate()) {
      var box = Hive.box<User>('usersBox');
      final newEmail = emailController.text.trim();

      if (box.values.any((user) => user.email == newEmail)) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
          content: Text('Email Already Exist '),
          ),
        );
        return;
      }
    var newUser = User(
      name: nameController.text.trim(),
      email: emailController.text.trim(),
      password: passwordController.text.trim()
    );

    box.put(newEmail, newUser);
    print(newUser);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Registration successful!'),
      ),
    );
    Navigator.pushReplacementNamed(context, 'login');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue.shade700,
        title: Text('Create A New Account'),
        titleTextStyle: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
      ),
      backgroundColor: Colors.blue.shade100,

      body: Center(
        child: SingleChildScrollView(
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: CircleAvatar(
                    radius: 75,
                    backgroundImage: AssetImage('assets/image/login.jpeg'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextField(
                    controller: nameController,
                    keyboardType: TextInputType.name,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                      ),
                      labelText: 'Username',
                      prefixIcon: Icon(Icons.account_box),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    validator: (email){
                      _errorMessage = '';
          
                      if (email!.contains(RegExp(r'[A-Z]'))) {
                        _errorMessage += 'Email Can not have Uppercase Letter.\n';
                      }
                      if (!email.contains(RegExp(r'[a-z0-9.]'))) {
                        _errorMessage += ' Lowercase Letter is Missing.\n';
                      }
                      if (!email.contains(RegExp(r'[@]'))) {
                        _errorMessage += ' Special Character is Missing.\n';
                      }
                      if (!email.contains(RegExp(r'[a-z]'))) {
                        _errorMessage += ' Lowercase Letter is Missing.\n';
                      }
                      if (!email.contains(RegExp(r'[.com]'))) {
                        _errorMessage += ' Special Character is Missing.\n';
                      }
                      return;
                    },
                    controller: emailController,
                    keyboardType: TextInputType.emailAddress,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                      ),
                      labelText: 'Email',
                      prefixIcon: Icon(Icons.email),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: TextFormField(
                    controller: passwordController,
                    keyboardType: TextInputType.visiblePassword,
                    validator: (password){
                      _errorMessage = '';
          
                      if (password!.length < 6) {
                        _errorMessage += 'Password Must be AtLeast 6 Character\n';
                      }
                      if (!password.contains(RegExp(r'[A-Z]'))) {
                        _errorMessage += ' Uppercase Letter is Missing.\n';
                      }
                      if (!password.contains(RegExp(r'[a-z]'))) {
                        _errorMessage += ' Lowercase Letter is Missing.\n';
                      }
                      if (!password.contains(RegExp(r'[0-9]'))) {
                        _errorMessage += ' Digit is Missing.\n';
                      }
                      if (!password.contains(RegExp(r'[!@#%^&*(),.?":{}|<>]'))) {
                        _errorMessage += ' Special Character is Missing.\n';
                      }
          
                      return;
                    },
                    obscureText: obscureText,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(11),
                      ),
                      labelText: 'Password',
                      prefixIcon: Icon(Icons.password),
                      suffixIcon: IconButton(
                        icon: Icon(
                          obscureText ? Icons.visibility_off : Icons.visibility,
                        ),
                        onPressed: () =>
                            setState(() => obscureText = !obscureText),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 11),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushReplacementNamed(context, 'login');
                      },
                      child: Text(
                        'Already have An Account',
                        style: TextStyle(color: Colors.deepPurple),
                      ),
                    ),
                    ElevatedButton(
                      onPressed: RegisterUser, child: Text('Sign In'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }


}
