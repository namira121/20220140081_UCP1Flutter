import 'package:flutter/material.dart';

class DataPiket extends StatefulWidget {
  final String email;

  const DataPiket({super.key,
  required this.email});

  @override
  State<DataPiket> createState() => _DataPiketState();
}

class _DataPiketState extends State<DataPiket> {
  // late TextEditingController emailController;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController tanggalController = TextEditingController();
  final TextEditingController tugasController = TextEditingController();
  List<Map<String,String>> listTugas = [];


  // @override
  // void initState() {
  //   // TODO: implement initState
  //   super.initState();
  //   emailController = TextEditingController(text: widget.email);
  // }
  void addData(){
    setState(() {
      listTugas.add({
        "task" : tugasController.text,
        "date" : tanggalController.text,
      });
      tugasController.clear();
      tanggalController.clear();
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
          tanggalController.text = "${picked.toLocal()}".split(' ')[0];
        });
      }
   }

  @override
  Widget build(BuildContext context) {
    final _formkey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Text('Piket Gudang', style: TextStyle(fontWeight: FontWeight.bold),),
        centerTitle: true,
        backgroundColor: Colors.blue.shade100,
      ),
      body: Form(
        key: _formkey,
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Nama Anggota'),
              const SizedBox(height: 15),
              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  hintText: 'Nama Anggota',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15)
                  )
                ),
                validator: (value) {
                  if (value == null || value.isEmpty){
                    return 'Nama tidak boleh kosong';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 18),
              Text('Pilih Tanggal'),
              const SizedBox(height: 15),
              TextFormField(
                controller: tanggalController,
                decoration: InputDecoration(
                  hintText: 'Pilih Tanggal',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(15)
                  ),
                  prefixIcon: IconButton(
                    onPressed: () =>
                      _selectedDate(context)
                    , icon: Icon(Icons.calendar_month_sharp))
                ),
                readOnly: true,
              ),
              const SizedBox(height: 18),
              Text('Tugas Piket'),
              const SizedBox(height: 15),
              Row(
                children: [
                  TextFormField(
                    controller: tugasController,
                    decoration: InputDecoration(
                      hintText: 'Tugas Piket',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15)
                      ),
                      constraints: BoxConstraints.tightFor(width: 180)
                    ),
                  ),
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue.shade100,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)
                      ),
                      fixedSize: Size(100, 50)
                    ),
                    onPressed: (){

                    }, 
                    child: Text('Tambah'))
                ],
              )
            ],
          ),
          )
        ),
      
    );
  }
}