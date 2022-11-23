import 'package:flutter/material.dart';
import 'package:counter_7/main.dart';
import 'package:counter_7/page/form.dart';
import 'package:counter_7/page/data.dart';
import 'package:counter_7/page/mywatchlist.dart';


Widget returnDrawer(BuildContext context) {
    return Drawer(
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
                    // Route menu ke halaman data
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const MyDataPage()),
                    );
                  },
                ),
                ListTile(
                    title: const Text('My Watchlist'),
                    onTap: () {
                    // Route menu ke halaman My Watchlist
                    Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (context) => const MyWatchlistPage()),
                    );
                  },
                ),
              ],
            ),
          );
}