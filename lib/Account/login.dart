
import 'package:flutter/material.dart';
import 'package:your_project_name/Account/Bloc/home_screen.dart';
import 'package:your_project_name/Account/sigin.dart';

import '../HiveDataBase/boxes.dart';
import '../HiveDataBase/user_account_model.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // Define controllers for email and password fields
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  Future<void> _login() async {
    final email = emailController.text;
    final password = passwordController.text;

    if (email.isEmpty || password.isEmpty) {
      UserAccountModel.handleErrorState(
          context, "Please Fill the Necessary Requirement", false);
      return;
    }

    final box = Boxes.getAccountRegiersterion();
    bool found = false;

    // Debug print to check what is being retrieved
    print("Retrieved accounts from Hive:");

    for (var transaction in box.values) {
      print("Transaction: ${transaction}");
      for (var account in transaction.userAccount) {
        print("Checking account: ${account.email}, ${account.password}");
        if (account.email == email && account.password == password) {
          setState(() {
            found = true;
          });
          break;
        }
      }
      if (found) break;
    }

    if (found) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) => MyHomePage(),
        ),
      );
    } else {
      UserAccountModel.handleErrorState(
          context, "Your Email or Password is Incorrect", false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Email text field
            Center(
                child: Text(
              'Welcome to NEC Learning Management System',
              style: TextStyle(color: Colors.blue, fontSize: 30),
            )),
            SizedBox(height: 20,),
            TextField(
              controller: emailController,
              decoration: InputDecoration(
                labelText: 'Enter your email',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.emailAddress,
            ),
            SizedBox(height: 16.0),

            // Password text field
            TextField(
              controller: passwordController,
              decoration: InputDecoration(
                labelText: 'Enter your password',
                border: OutlineInputBorder(),
              ),
              obscureText: true,
            ),
            SizedBox(height: 16.0),

            // Login button
            ElevatedButton(
              onPressed: () {
                // Logic for login button
                _login();
              },
              child: Text('Login'),
            ),
            SizedBox(height: 16.0),

            // Signup text
            Center(
              child: Text(
                "If you don't have an account, please sign up.",
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            SizedBox(height: 8.0),

            // Signup button
            TextButton(
              onPressed: () {
                // Logic to navigate to the signup page
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => SignUpPage(),));
              },
              child: Text(
                'Sign Up',
                style: TextStyle(color: Colors.blue, fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
