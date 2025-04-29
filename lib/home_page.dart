import 'package:flutter/material.dart';
import 'package:ucp1_081/daftarcust.dart';
import 'package:ucp1_081/data_piket.dart';
import 'package:ucp1_081/order_page.dart';

class HomePage extends StatefulWidget {
  final String email;

  const HomePage({super.key,
  required this.email});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController emailController = TextEditingController();
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
              color: Colors.indigo.shade300,
              child: 
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundImage: AssetImage('assets/images/cinamonroll2.png'),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Selamat datang,', style: TextStyle(color: Colors.white, fontSize: 15),),
                      Text('${widget.email}', style: TextStyle(color: Colors.white, fontSize: 15),)
                    ],
                  ),
                  
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
            const SizedBox(height: 40),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink.shade100,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    iconSize: 70,
                    minimumSize: Size(175, 175),
                  ),
                  onPressed: (){
                    Navigator.push(context, 
                    MaterialPageRoute(builder:(context) => 
                    DataPiket(email: widget.email)));
                  }, 
                  child: Column(
                    children: [
                      Icon(Icons.list_alt_outlined),
                      Text('Data Piket')
                    ],
                  )
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink.shade100,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    iconSize: 70,
                    minimumSize: Size(175, 175),
                  ),
                  onPressed: (){
                    Navigator.push(context, 
                    MaterialPageRoute(builder:(context) => DataCustomer(
                      email :widget.email,
                    )));
                  }, 
                  child: Column(
                    children: [
                      Icon(Icons.group_add_rounded),
                      Text('Data Pelanggan')
                    ],
                  ))  
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.pink.shade100,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    iconSize: 75,
                    minimumSize: Size(375, 175),
                  ),
                  onPressed: (){
                    Navigator.push(context, 
                    MaterialPageRoute(builder:(context) => OrderPage()));
                  }, 
                  child: Column(
                    children: [
                      Icon(Icons.receipt_long_outlined),
                      Text('Barang Masuk/Keluar')
                    ],
                  ))
                ],
              )
          ],
        ),),
      
    );
  }
}