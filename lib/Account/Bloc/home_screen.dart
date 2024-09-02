import 'package:flutter/material.dart';
import 'package:your_project_name/Account/login.dart';

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text("Welcome"),
              ElevatedButton(onPressed: (){
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage(),));
              }, child: Text('Logout'))
            ],
          ),
        
        ),
      ),
    );
  }
}
