import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:your_project_name/Account/Bloc/bloc.dart';
import 'package:your_project_name/Account/Bloc/home_screen.dart';
import 'package:your_project_name/Account/login.dart';

import '../HiveDataBase/user_account_model.dart';

class SignUpPage extends StatefulWidget {
  @override
  _SignUpPageState createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  // Define controllers for username, email, and password fields
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Sign Up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Username text field
            Center(
                child: Text(
                  'Welcome to NEC Learning Management System',
                  style: TextStyle(color: Colors.blue, fontSize: 30),
                ),),
            TextField(
              controller: usernameController,
              decoration: InputDecoration(
                labelText: 'Enter your username',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),

            // Email text field
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

            // Sign Up button
            ElevatedButton(
              onPressed: () {
                userAccountRegiestor();
              },
              child: Text('Sign Up'),
            ),
            SizedBox(height: 16.0),

            // Login text
            Center(
              child: Text(
                "Already have an account? Login here.",
                style: TextStyle(fontSize: 16.0),
              ),
            ),
            SizedBox(height: 8.0),

            // Login button
            TextButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage(),));

              },
              child: Text(
                'Login',
                style: TextStyle(color: Colors.blue, fontSize: 16.0),
              ),
            ),
          ],
        ),
      ),
    );
  }
  void userAccountRegiestor (){
    List <UserAccountModel> userAccounts =[];
    final String userName = usernameController.text;
    final String email   = emailController.text;
    final String password = passwordController.text;


    if(userName.isNotEmpty && email.isNotEmpty  && password.isNotEmpty ){
      final userAccount = UserAccountModel(
        userName :userName,
        email : email,
        password: password,
      );
      setState(() {
        userAccounts = [userAccount];
      });
      final coureBloc = context.read<AccountBloc>();

      coureBloc.addAccountRegiseristion( userAccounts);
      UserAccountModel.handleErrorState(context, "Created Successfully Welcome ${userAccount.userName}",
          true);
      usernameController.clear();
      emailController.clear();
      passwordController.clear();
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => MyHomePage(),));

    }
    else{
      UserAccountModel.handleErrorState(context, "Pleas Fill in all field Correctly",
          false);
    }

  }

}
