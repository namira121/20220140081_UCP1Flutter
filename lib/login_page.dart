import 'package:flutter/material.dart';
import 'package:ucp1_081/home_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _formkey = GlobalKey<FormState>();
    return Scaffold(
      body: Form(
        key: _formkey,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: 
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image(image: AssetImage('assets/images/pompompurin.png')),
            Text('Selamat Datang Kembali'),
            Text('Email'),
            TextFormField(
              controller: emailController,
              decoration: const InputDecoration(labelText: 'Enter your email'),
              validator: (value){
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },              
            ),
            Text('Password'),
            TextFormField(
              controller: passwordController,
              decoration: const InputDecoration(labelText: 'Enter your password'),
              validator: (value){
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                return null;
              },              
            ),
            ElevatedButton(onPressed: (){
              if(_formkey.currentState!.validate()){
                Navigator.pushReplacement(
                  context, 
                  MaterialPageRoute(
                    builder: (context) => 
                    HomePage(email: emailController.text)));
              }
            }, child: Text('Masuk')),
            
          ],
        ),
        )
      ),
    );
  }
}