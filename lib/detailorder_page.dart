import 'package:flutter/material.dart';
import 'package:ucp1_081/home_page.dart';

class DetailorderPage extends StatefulWidget {

  final String tgltransaksi;
  final String jenistransaksi;
  final String jenisbarang;
  final String jumlahbarang;
  final String harga;
  final String email;
  final int totalHarga;

  const DetailorderPage({super.key,
  required this.tgltransaksi,
  required this.jenistransaksi,
  required this.jenisbarang,
  required this.jumlahbarang,
  required this.harga,
  required this.totalHarga,
  required this.email});

  @override
  State<DetailorderPage> createState() => _DetailorderPageState();
}

class _DetailorderPageState extends State<DetailorderPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: 20, right: 20, bottom: 20, top: 75),
        child: Column(
          children: [
            Column(
              children: [
                Center(
                  child: 
                  Column(
                    children: [
                      CircleAvatar(
                      radius: 75,
                      backgroundImage: AssetImage('assets/images/check2.png'),
                      ),
                      const SizedBox(height: 10,),
                      Text('Data Berhasil Disimpan',style: TextStyle(fontSize: 18),)
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 50,),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Tanggal', style: TextStyle(fontSize: 14),),
                    Text(widget.tgltransaksi, style: TextStyle(fontSize: 14),)
                  ],
                ),
                Divider(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Jenis Transaksi', style: TextStyle(fontSize: 14),),
                    Text(widget.jenistransaksi, style: TextStyle(fontSize: 14),)
                  ],
                ),
                Divider(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Jenis Barang', style: TextStyle(fontSize: 14),),
                    Text(widget.jenisbarang, style: TextStyle(fontSize: 14),)
                  ],
                ),
                Divider(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Jumlah Barang', style: TextStyle(fontSize: 14),),
                    Text(widget.jumlahbarang, style: TextStyle(fontSize: 14),)
                  ],
                ),
                Divider(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Jenis Harga Satuan', style: TextStyle(fontSize: 14),),
                    Text(widget.harga, style: TextStyle(fontSize: 14),)
                  ],
                ),
                Divider(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total Harga', style: TextStyle(fontSize: 14),),
                    Text('Rp. ${widget.totalHarga}', style: TextStyle(fontSize: 14),)
                  ],
                ),
                Divider(height: 30,),
                const SizedBox(height: 30,),
                 ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade100,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      fixedSize: Size(400, 50)
                    ),
                      onPressed: (){
                        Navigator.push(context, 
                        MaterialPageRoute(builder: (context)=>HomePage(
                          email: widget.email)));
                      }, 
                      child: Text('Selesai'))
              ],
            )
          ],
        ),),
    );
  }
}