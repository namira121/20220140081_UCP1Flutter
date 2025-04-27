import 'package:flutter/material.dart';
import 'package:ucp1_081/home_page.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool _obscuretext = true;
  final TextEditingController namaController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController = TextEditingController();
  final TextEditingController nomorController = TextEditingController();
  
  var _password = '';
  var _confirmPassword = '';

  void KonfirmasiPassword() async{
    if (_password != _confirmPassword){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Password tidak sama!')
          )
        );
    }
  }

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
              const SizedBox(height: 15),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nama Lengkap'),
                  TextFormField(
                    controller: namaController,
                    decoration: InputDecoration(
                      hintText: 'Nama Lengkap',
                      prefixIcon: Icon(Icons.person),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)
                      )),
                    validator: (value) {
                      if (value == null || value.isEmpty){
                        return 'Nama tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  Text('Email'),
                  TextFormField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: 'Email',
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)
                      )),
                    validator: (value) {
                      if (value == null || value.isEmpty){
                        return 'Email tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  Text('Nomor Hp'),
                  TextFormField(
                    controller: nomorController,
                    decoration: InputDecoration(
                      labelText: 'Nomor Hp',
                      prefixIcon: Icon(Icons.phone),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)
                      )),
                    validator: (value) {
                      if (value == null || value.isEmpty){
                        return 'No Hp tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  Text('Password'),
                  TextFormField(
                    controller: passwordController,
                    decoration: InputDecoration(
                      hintText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)
                      ),
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: GestureDetector(onTap: () {
                        setState(() {
                          _obscuretext=!_obscuretext;
                        });
                      },
                      child: Icon(_obscuretext 
                      ? Icons.visibility_off
                      : Icons.visibility),)),
                    obscureText: _obscuretext,
                    onChanged: (value) {
                      _password = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty){
                        return 'Password tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                  Text('Konfirmasi Password'),
                  TextFormField(
                    controller: confirmpasswordController,
                    decoration: InputDecoration(
                      hintText: 'Konfirmasi Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)),
                      prefixIcon: Icon(Icons.lock),
                      suffixIcon: GestureDetector(onTap: () {
                        setState(() {
                          _obscuretext=!_obscuretext;
                        });
                      },
                      child: Icon(_obscuretext 
                      ? Icons.visibility_off
                      : Icons.visibility),)),
                    obscureText: _obscuretext,
                    onChanged: (value) {
                      _confirmPassword = value;
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty){
                        return 'Konfirmasi password tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
                ],
              ),
              Column(
                children: [
                  ElevatedButton(
                    onPressed: (){
                      Navigator.pushReplacement(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => 
                        HomePage(email: emailController.text)));
                    }, child: Text('Daftar')),
                  TextButton(
                    onPressed: (){
                      Navigator.pushNamed(context, '/login');
                    }, child: Text('Sudah memiliki akun? Silahkan login disini'))
                ],
              ),
            ],
          ),
        )
      ),
    );
  }
}