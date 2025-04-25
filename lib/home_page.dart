import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  final String email;

  const HomePage({super.key,
  required this.email});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.all(0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.only(top: 70),
              color: Colors.blue.shade100,
              child: 
              Row(
                children: [
                  const SizedBox(width: 20,),
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/cinamonroll2.png'),
                  ),
                  const SizedBox(width: 15),
                  Column(
                    children: [
                      Text('Selamat datang,'),
                      Text('${widget.email}')
                    ],
                  ),
                  const SizedBox(width: 100),
                  IconButton(onPressed: (){
                    Navigator.pushNamed(context, '/login');
                  }, icon: Icon(Icons.logout))
                  
                ],
              ),
            ),
            const SizedBox(height: 25,),
            Column(
              children: [
                Image(image: AssetImage('assets/images/images.jpg'))
              ],
            ),
            Row(
              children: [
                Container(
                  
                  child: IconButton(
                    onPressed: (){}, icon: Icon(Icons.abc_sharp)),
                )
              ],
            )
          ],
        ),),
      
    );
  }
}