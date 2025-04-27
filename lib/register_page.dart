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

  void KonfirmasiPassword(){
    setState(() {
      if (_password != _confirmPassword){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Password tidak sama!', style: TextStyle(color: Colors.black),),
          duration: Duration(seconds: 3),
          backgroundColor: Colors.red.shade200,
          )
        );
      } else {
        Navigator.pushReplacement(
        context, 
        MaterialPageRoute(
        builder: (context) => 
        HomePage(email: emailController.text)));
      }
    });
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
              const SizedBox(height: 40),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Nama Lengkap'),
                  const SizedBox(height: 10),
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
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Email'),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: emailController,
                            decoration: InputDecoration(
                              hintText: 'Email',
                              constraints: BoxConstraints.tightFor(width: 180),
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
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('No Hp'),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: nomorController,
                            decoration: InputDecoration(
                            hintText: 'No Hp',
                            constraints: BoxConstraints.tightFor(width: 180),
                            prefixIcon: Icon(Icons.phone),
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
                        ],
                      ),
                    ]
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Password'),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: passwordController,
                            decoration: InputDecoration(
                              hintText: 'Password',
                              constraints: BoxConstraints.tightFor(width: 180),
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
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Konfirmasi Password'),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: confirmpasswordController,
                            decoration: InputDecoration(
                              hintText: 'Konfirmasi Password',
                              constraints: BoxConstraints.tightFor(width: 180),
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
                      )
                    ],
                  ),                  
                ],
              ),
              const SizedBox(height: 80,),
              Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade100,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      fixedSize: Size(400, 50)
                    ),
                    onPressed: (
                    ){
                      if(_formkey.currentState!.validate()){
                        KonfirmasiPassword();
                      } 
                    }, child: Text('Daftar')),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text('Sudah memiliki akun? Silahkan'),
                      TextButton(
                      onPressed: (){
                        Navigator.pushNamed(context, '/login');
                      }, child: Text('Login disini'))
                    ],
                  ),
                  
                ],
              ),
            ],
          ),
        )
      ),
    );
  }
}