import 'package:counter_7/form.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Program Counter'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  void _decrementCounter() {
    setState(() {
      if (_counter > 0) {
        _counter--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: Text(widget.title),
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
                    // Navigator.pushReplacement(
                    //     context,
                    //     MaterialPageRoute(builder: (context) => const MyFormPage()),
                    // );
                  },
                ),
              ],
            ),
          ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            if (_counter%2 == 0)
              const Text(
                'GENAP',
                style: TextStyle(
                  color: Colors.red,
               ),
              )
            else 
              const Text(
                'GANJIL',
                style: TextStyle(
                  color: Colors.blue,
               ),
              ),

            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headline4,
            ),
          ],
        ),
      ),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            FloatingActionButton(
              onPressed: _decrementCounter,
              tooltip: 'Decrement',
              child: const Icon(Icons.remove),
            ),
            FloatingActionButton(
              onPressed: _incrementCounter,
              tooltip: 'Increment',
              child: const Icon(Icons.add),
            )
          ],
        ),
      ), 
    );
  }
}
