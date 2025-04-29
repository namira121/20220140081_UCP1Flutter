import 'package:flutter/material.dart';

class OrderPage extends StatefulWidget {
  const OrderPage({super.key});

  @override
  State<OrderPage> createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final TextEditingController tgltransaksiController = TextEditingController();
  late TextEditingController jenistransaksiController;
  late TextEditingController jenisbarangController;
  final TextEditingController jumlahbarangController = TextEditingController();
  final TextEditingController hargaController = TextEditingController();
  int totalHarga = 0;
  final Map<String, int> hargaSatuan = {
    'Carrier' :20000, 
    'Sleeping Bag': 30000,
    'Tenda': 50000,
    'Sepatu': 20000,
  };
  @override
  void initState(){
    super.initState();
    jenisbarangController = TextEditingController();
    jenistransaksiController = TextEditingController();
  }
  void calculateTotalPrice(){
    int jumlah = int.tryParse(jumlahbarangController.text) ?? 0;
    int Harga = int.tryParse(hargaController.text) ?? 0;

    setState(() {
      totalHarga = jumlah * Harga;
    });
  }
  

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
    // String? _dropdownjenis;
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
                  DropdownButtonFormField<String>(
                    value: jenistransaksiController.text.isEmpty ? null: jenistransaksiController.text,
                    validator: (value) {
                      if (value == null || value.isEmpty){
                        return 'Jenis Transaksi tidak boleh kosong';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Jenis Transaksi',
                      border: OutlineInputBorder()
                    ),
                    items: [
                      'Barang Masuk', 'Barang Keluar'
                    ].map((option) => DropdownMenuItem(
                      value: option,
                      child: Text(option),
                      ))
                      .toList(),
                      onChanged: (value) {
                        setState(() {
                          jenistransaksiController.text = value!;
                        });
                      },
                   ),
                   DropdownButtonFormField<String>(
                    value: jenisbarangController.text.isEmpty ? null: jenisbarangController.text,
                    validator: (value) {
                      if (value == null || value.isEmpty){
                        return 'Jenis Barang tidak boleh kosong';
                      }
                      return null;
                    },
                    decoration: InputDecoration(
                      labelText: 'Jenis Barang',
                      border: OutlineInputBorder()
                    ),
                    items: [
                      'Carrier', 
                      'Sleeping Bag',
                      'Tenda',
                      'Sepatu'
                    ].map((option) => DropdownMenuItem(
                      value: option,
                      child: Text(option),
                      ))
                      .toList(),
                      onChanged: (value) {
                        setState(() {
                          jenisbarangController.text = value!;
                          hargaController.text = hargaSatuan[value].toString();
                        });
                      },
                   ),
                   Row(
                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Jumlah Barang'),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: jumlahbarangController,
                            decoration: InputDecoration(
                              hintText: 'Jumlah Barang',
                              constraints: BoxConstraints.tightFor(width: 180),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)
                            )),
                            validator: (value) {
                              if (value == null || value.isEmpty){
                                return 'Jumlah Barang tidak boleh kosong';
                              }
                                return null;
                              },
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Harga Satuan'),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: hargaController,
                            readOnly: true,
                            decoration: InputDecoration(
                              hintText: 'Harga Satuan',
                              constraints: BoxConstraints.tightFor(width: 180),                            
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)
                            )),
                            validator: (value) {
                            if (value == null || value.isEmpty){
                                return 'Harga Satuan tidak boleh kosong';
                            }
                              return null;
                            },
                        ),
                        ],
                      ),
                    ]
                  ),

            ],
          )),),
    );
  }
}