import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  TextEditingController namaController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController nomorController = TextEditingController();
  
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
              Column(
                children: [
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/pompompurin.png'),
                ),
                const SizedBox(height: 10),
                Text('Daftar Akun Baru', style: TextStyle(fontSize: 20),),
              ],
              ),
              Column(
                children: [
                  Text('Nama Lengkap'),
                  TextFormField(

                  )
                ],
              )
            ],
          ),
        )
      ),
    );
  }
}