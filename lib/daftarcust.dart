import 'package:flutter/material.dart';

class DataCustomer extends StatefulWidget {
  const DataCustomer({super.key});

  @override
  State<DataCustomer> createState() => _DataCustomerState();
}

class _DataCustomerState extends State<DataCustomer> {
  final TextEditingController namaCustController = TextEditingController();
  final TextEditingController emailCustController = TextEditingController();
  final TextEditingController noHpCustController = TextEditingController();
  final TextEditingController alamatCustController = TextEditingController();
  final TextEditingController provinsiCustController = TextEditingController();
  final TextEditingController kodeposCustController = TextEditingController();
  
  @override
  Widget build(BuildContext context) {
    final _formkey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Pelanggan'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade100,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nama Cust'),
            const SizedBox(height: 10),
            TextFormField(
              controller: namaCustController,
              decoration: InputDecoration(
                hintText: 'Nama Cust',
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
          ],
        ),),
    );
  }
}