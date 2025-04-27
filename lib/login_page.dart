import 'package:flutter/material.dart';
import 'package:ucp1_081/home_page.dart';
import 'package:ucp1_081/register_page.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool _obscuretext = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

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
                Text('Selamat Datang Kembali!', style: TextStyle(fontSize: 20),),
              ],
            ),
            const SizedBox(height: 50,),
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Email'),
                const SizedBox(height: 15,),
                TextFormField(
                  controller: emailController,
                  decoration: InputDecoration(
                    hintText: 'Enter your email',
                    prefixIcon: Icon(Icons.email),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15))),
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },              
                ),
                const SizedBox(height: 30,),
                Text('Password'),
                const SizedBox(height: 15,),
                TextFormField(
                  controller: passwordController,
                  obscureText: _obscuretext,
                  decoration: InputDecoration(
                    labelText: 'Enter your password',
                    prefixIcon: Icon(Icons.lock),
                    suffixIcon: GestureDetector(onTap: () {
                      setState(() {
                        _obscuretext=!_obscuretext;
                      });
                    },
                      child: Icon(_obscuretext 
                      ? Icons.visibility_off
                      : Icons.visibility),
                    ),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(15))),
                  validator: (value){
                    if (value == null || value.isEmpty) {
                      return 'Please enter your email';
                    }
                    return null;
                  },              
                ),
                
              ],
            ),
            const SizedBox(height: 80,),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade100,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    fixedSize: Size(400, 50)
                  ),
                    onPressed: (){
                  if(_formkey.currentState!.validate()){
                    Navigator.pushReplacement(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => 
                        HomePage(email: emailController.text)));
                  }
                }, child: Text('Masuk')),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('Belum memiliki akun? Silahkan'),
                    TextButton(onPressed: (){
                      Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const RegisterPage()));
                    }, child: Text('Daftar disini'))
                  ],
                ),
                
              ],
            )
            
          ],
        ),
        )
      ),
    );
  }
}