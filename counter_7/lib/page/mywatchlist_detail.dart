import 'package:flutter/material.dart';
import 'package:counter_7/model/watchlist_item.dart';
import 'package:counter_7/widget/drawer.dart';

class WatchlistDetail extends StatelessWidget {
  const WatchlistDetail({super.key, required this.watchlistItem});
  final Watchlist watchlistItem;

  @override
  Widget build(BuildContext context) {
  return Scaffold(
      appBar: AppBar(
        title: const Text("Detail"),
      ),
      drawer: returnDrawer(context),
      
  );
  }
}