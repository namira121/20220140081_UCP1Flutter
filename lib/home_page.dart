import 'package:flutter/material.dart';
import 'package:ucp1_081/data_piket.dart';

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
              padding: EdgeInsets.only(top: 70, right: 16, bottom: 16),
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
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Selamat datang,'),
                      Text('${widget.email}')
                    ],
                  ),
                  const SizedBox(width: 100),
                  IconButton(onPressed: (){
                    Navigator.pushReplacementNamed(context, '/login');
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
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Container(
                      width: 150,
                      height: 150,
                      child: 
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.pink.shade100,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          iconSize: 50,
                        ),
                        onPressed: (){
                          Navigator.push(context, 
                          MaterialPageRoute(builder:(context) => DataPiket()));
                        }, 
                        child: Icon(Icons.list_alt_outlined))
                    ),
                    
                  ],
                ),
              ],
            )
          ],
        ),),
      
    );
  }
}