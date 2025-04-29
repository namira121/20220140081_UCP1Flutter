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
                      Text('Data Berhasil Disimpan')
                    ],
                  ),
                )
              ],
            ),
            const SizedBox(height: 20,),
            Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Tanggal'),
                    Text(widget.tgltransaksi)
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Jenis Transaksi'),
                    Text(widget.jenistransaksi)
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Jenis Barang'),
                    Text(widget.jenisbarang)
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Jumlah Barang'),
                    Text(widget.jumlahbarang)
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Jenis Harga Satuan'),
                    Text(widget.harga)
                  ],
                ),
                Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('Total Harga'),
                    Text('Rp. ${widget.totalHarga}')
                  ],
                ),
                Divider(),
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