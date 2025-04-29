import 'package:flutter/material.dart';
import 'package:ucp1_081/detailcust.dart';

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
        child: Form(
          key: _formkey,
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
            Row(
                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Email'),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: emailCustController,
                            decoration: InputDecoration(
                              hintText: 'Email',
                              constraints: BoxConstraints.tightFor(width: 180),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)
                            )),
                            validator: (value) {
                              if (value == null || value.isEmpty){
                                return 'Email tidak boleh kosong';
                              }
                                return null;
                              },
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('No Hp'),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: noHpCustController,
                            decoration: InputDecoration(
                            hintText: 'No Hp',
                            constraints: BoxConstraints.tightFor(width: 180),                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)
                            )),
                            validator: (value) {
                            if (value == null || value.isEmpty){
                                return 'No Hp tidak boleh kosong';
                            }
                              return null;
                            },
                        ),
                        ],
                      ),
                    ]
                  ),
            const SizedBox(height: 15),
            Text('Alamat'),
            const SizedBox(height: 10),
            TextFormField(
              controller: alamatCustController,
              decoration: InputDecoration(
                hintText: 'Alamat Cust',
                border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15)
              )),
              validator: (value) {
                if (value == null || value.isEmpty){
                  return 'Alamat tidak boleh kosong';
                }
                return null;
              },
            ),
            const SizedBox(height: 15,),
            Row(
                    mainAxisAlignment:MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Provinsi'),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: provinsiCustController,
                            decoration: InputDecoration(
                              hintText: 'Provinsi',
                              constraints: BoxConstraints.tightFor(width: 180),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)
                            )),
                            validator: (value) {
                              if (value == null || value.isEmpty){
                                return 'Provinsi tidak boleh kosong';
                              }
                                return null;
                              },
                          )
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('Kode Pos'),
                          const SizedBox(height: 10),
                          TextFormField(
                            controller: kodeposCustController,
                            decoration: InputDecoration(
                            hintText: 'Kode Pos',
                            constraints: BoxConstraints.tightFor(width: 180),                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15)
                            )),
                            validator: (value) {
                            if (value == null || value.isEmpty){
                                return 'Kode Pos tidak boleh kosong';
                            }
                              return null;
                            },
                        ),
                        ],
                      ),
                    ]
                  ),
            const SizedBox(height: 50,),
              Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade100,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      fixedSize: Size(400, 50)
                    ),
                    onPressed: (
                    ){
                      if(_formkey.currentState!.validate()){
                    Navigator.pushReplacement(
                      context, 
                      MaterialPageRoute(
                        builder: (context) => 
                        Detailcust(
                          namaCust :namaCustController.text,
                          emailCust : emailCustController.text,
                          noHpCust : noHpCustController.text,
                        )));
                  }
                    }, child: Text('Simpan')),
                    const SizedBox(height: 15,),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      fixedSize: Size(400, 50)
                    ),
                    onPressed: (
                    ) {
                      namaCustController.clear();
                      emailCustController.clear();
                      noHpCustController.clear();
                      alamatCustController.clear();
                      provinsiCustController.clear();
                      kodeposCustController.clear();
                    }, 
                    child: Text('Reset')),
                  
                ],
              ),
          ],
        ),
        ),),
    );
  }
}