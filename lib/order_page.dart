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

  DateTime selectedDate = DateTime.now();

   Future<void> _selectedDate(BuildContext context) async{
      final DateTime? picked = await showDatePicker(
        context: context, 
        initialDate: selectedDate,
        firstDate: DateTime(2016,8), 
        lastDate: DateTime(2200));
      if (picked != null && picked != selectedDate){
        setState(() {
          tgltransaksiController.text = "${picked.toLocal()}".split(' ')[0];
        });
      }
   }
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
              Text('Tanggal Transaksi'),
              const SizedBox(height: 15),
                  TextFormField(
                    controller: tgltransaksiController,
                    decoration: InputDecoration(
                      hintText: 'Tanggal Transaksi',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)
                      ),
                      prefixIcon: IconButton(
                        onPressed: () =>
                          _selectedDate(context)
                        , icon: Icon(Icons.calendar_month_sharp))
                    ),
                    readOnly: true,
                    validator: (value) {
                      if(value == null|| value.isEmpty){
                        return 'Tanggal tidak boleh kosong';
                      }
                      return null;
                    },
                  ),
            ],
          )),),
    );
  }
}