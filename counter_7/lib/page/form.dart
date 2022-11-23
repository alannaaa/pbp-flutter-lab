import 'package:counter_7/widget/drawer.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/page/data.dart';
import 'package:flutter/material.dart';

List<Data> budgetLst = [];
class MyFormPage extends StatefulWidget {
    const MyFormPage({super.key});

    @override
    State<MyFormPage> createState() => _MyFormPageState();
}

class _MyFormPageState extends State<MyFormPage> {
  final _formKey = GlobalKey<FormState>();

  List<String> tipe = <String>["Pemasukan", "Pengeluaran"];  
  String? _tipeValue;
  String _judul = "";
  int? _nominal = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Form Budget'),
        ),
        // Menambahkan drawer menu
        drawer: returnDrawer(context),

        body: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Container(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: "Judul",
                          labelText: "Judul",
                          // Menambahkan circular border agar lebih rapi
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                          ),
                      ),
                      // Menambahkan behavior saat nama diketik 
                      onChanged: (String? value) {
                          setState(() {
                              _judul = value!;
                          });
                      },
                      // Menambahkan behavior saat data disimpan
                      onSaved: (String? value) {
                          setState(() {
                              _judul = value!;
                          });
                      },
                      // Validator sebagai validasi form
                      validator: (String? value) {
                          if (value == null || value.isEmpty) {
                              return 'Judul tidak boleh kosong!';
                          }
                          return null;
                      },
                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextFormField(
                      decoration: InputDecoration(
                          hintText: "Nominal",
                          labelText: "Nominal",
                          // Menambahkan circular border agar lebih rapi
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5.0),
                          ),
                      ),
                      keyboardType: TextInputType.number,
                      // Menambahkan behavior saat nama diketik 
                      onChanged: (String? value) {
                          setState(() {
                              _nominal = int.tryParse(value!);
                          });
                      },
                      // Menambahkan behavior saat data disimpan
                      onSaved: (String? value) {
                          setState(() {
                              _nominal = int.tryParse(value!);
                          });
                      },
                      // Validator sebagai validasi form
                      validator: (String? value) {
                          if (value == null || value.isEmpty) {
                              return 'Nominal tidak boleh kosong!';
                          }
                          else if (int.tryParse(value) == null) {
                            return 'Nominal harus berupa angka!';
                          }
                          return null;
                      },
                    )
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: DropdownButtonFormField<String>(
                        value: _tipeValue,
                        icon: const Icon(Icons.arrow_drop_down),
                        elevation: 16,
                        hint: const Text("Pilih jenis"),
                        items: tipe.map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          setState(() {
                            _tipeValue = value!;
                          });
                        },
                        validator: (String? value) {
                          if (value == null) {
                            return 'Mohon pilih jenis terlebih dahulu!';
                          }
                        },
                    )
                  ),
                ]
              ),
            )
          ),
        ),

        bottomNavigationBar: Padding(
          padding: const EdgeInsets.all(28.0),
          child: TextButton(
            style: ButtonStyle(
              backgroundColor: MaterialStateProperty.all(Colors.blue), 
              elevation: MaterialStateProperty.all(5.0),
            ),

            child: const Text("Simpan", 
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              )
            ),

            onPressed: (){
              if (_formKey.currentState!.validate()) {
                budgetLst.add(Data(_judul, _nominal!, _tipeValue!));
                _formKey.currentState!.reset();
                
              }
            },
              
          )
        )

    );
  }
}