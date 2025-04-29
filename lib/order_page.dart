import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final TextEditingController tgltransaksiController = TextEditingController();
  final TextEditingController jenistransaksiController = TextEditingController();
  final TextEditingController jenisbarangController = TextEditingController();
  final TextEditingController jumlahbarangController = TextEditingController();
  final TextEditingController hargaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final _formkey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Pendataan Barang'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade100,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Form(
          key: _formkey,
          child: Column(
            children: [
              
            ],
          )),),
    );
  }
}