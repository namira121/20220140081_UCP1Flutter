import 'package:flutter/material.dart';

class DataPiket extends StatefulWidget {
  const DataPiket({super.key});

  @override
  State<DataPiket> createState() => _DataPiketState();
}

class _DataPiketState extends State<DataPiket> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Piket Gudang', style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.blue.shade100,
      ),
      
    );
  }
}