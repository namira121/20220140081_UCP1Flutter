import 'package:flutter/material.dart';
import 'package:ucp1_081/home_page.dart';

class Detailcust extends StatefulWidget {
  final String namaCust;
  final String emailCust;
  final String noHpCust;
  final String alamatCust;
  final String provinsiCust;
  final String kodeposCust;
  final String email;
  
  const Detailcust({super.key,
  required this.namaCust,
  required this.emailCust,
  required this.noHpCust,
  required this.alamatCust,
  required this.provinsiCust,
  required this.kodeposCust,
  required this.email,
  });

  @override
  State<Detailcust> createState() => _DetailcustState();
}

class _DetailcustState extends State<Detailcust> {
  late TextEditingController alamatCustController;
  late TextEditingController provinsiCustController;
  late TextEditingController kodeposCustController;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    alamatCustController = TextEditingController(text: widget.alamatCust);
    provinsiCustController = TextEditingController(text: widget.provinsiCust);
    kodeposCustController = TextEditingController(text: widget.kodeposCust);
  }
  final _formkey =GlobalKey <FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Detail ${widget.namaCust}'),
        centerTitle: true,
        backgroundColor: Colors.blue.shade100,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: [
            Center(
              child: 
                Column(
                  children: [
                    CircleAvatar(
                      radius: 60,
                      backgroundImage: AssetImage('assets/images/pompompurin.png'),
                    ),
                    SizedBox(height: 35,),
                    Text(widget.namaCust, style: TextStyle(fontSize: 28),),
                    Text(widget.emailCust,),
                    Text(widget.noHpCust),

                    const SizedBox(height: 20,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
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
                      ],
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
                    ElevatedButton(
                      onPressed: (){
                        Navigator.push(context, 
                        MaterialPageRoute(builder: (context)=>HomePage(
                          email: widget.email)));
                      }, 
                      child: Text('Selesai'))
                  ],
                ),
            ),
            
          ],
        ),),
    );
  }
}