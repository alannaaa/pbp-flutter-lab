import 'package:counter_7/main.dart';
import 'package:counter_7/form.dart';
import 'package:flutter/material.dart';

class MyDataPage extends StatefulWidget {
    const MyDataPage({super.key});

    @override
    State<MyDataPage> createState() => _MyDataPageState();
}

class Data {
  String judul; 
  int nominal;
  String tipe;
  
  Data(this.judul, this.nominal, this.tipe);
}

class _MyDataPageState extends State<MyDataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Form Budget'),
        ),
        // Menambahkan drawer menu
        drawer: Drawer(
            child: Column(
                children: [
                // Menambahkan clickable menu
                  ListTile(
                      title: const Text('Counter'),
                      onTap: () {
                      // Route menu ke halaman utama
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const MyHomePage(title: 'Home')),
                      );
                      },
                  ),
                  ListTile(
                      title: const Text('Tambah Budget'),
                      onTap: () {
                      // Route menu ke halaman form
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const MyFormPage()),
                      );
                    },
                  ),
                  ListTile(
                      title: const Text('Data Budget'),
                      onTap: () {
                      // Route menu ke halaman form
                      Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(builder: (context) => const MyDataPage()),
                      );
                    },
                  ),
                ],
            ),
        ),

        body: ListView(
          padding: const EdgeInsets.all(8.0),
          children: budgetLst.map((data) => _DataListItem(data)).toList()
          
        )
    );
  } 
}

class _DataListItem extends Padding {

  _DataListItem(Data data) :
    super(
      padding: const EdgeInsets.all(5.0),
      child: Container(
      height: 60,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 2,
            blurRadius: 7,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: ListTile(
        title : Text(data.judul, style: const TextStyle(fontSize: 20.0)),
        trailing: Padding(
          padding: const EdgeInsets.only(top: 13.0), 
          child: Column(
            children:[
              Text(data.nominal.toString(), style: const TextStyle(fontSize:14.0)), 
              Text(data.tipe)
            ]
          )
        )
      )
      )
    );

}