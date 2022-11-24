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
      body: Padding(
        padding: const EdgeInsets.all(32.0), 
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              watchlistItem.fields.title, 
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 30)
            ),
            const SizedBox(height: 5.0,),
            Text.rich(
              TextSpan(
                children: <TextSpan>[
                  const TextSpan(text: 'Release Date: ', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: watchlistItem.fields.releaseDate),
                ]
              )
            ),
            Text.rich(
              TextSpan(
                children: <TextSpan>[
                  const TextSpan(text: 'Rating: ', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: '${watchlistItem.fields.rating}.0/5.0'),
                ]
              )
            ),
            Text.rich(
              TextSpan(
                children: <TextSpan>[
                  const TextSpan(text: 'Status: ', style: TextStyle(fontWeight: FontWeight.bold)),
                  TextSpan(text: watchlistItem.fields.watched ? 'Watched' : 'Not watched'),
                ]
              )
            ),
            const Text.rich(
              TextSpan(text: 'Review: ', style: TextStyle(fontWeight: FontWeight.bold)),
            ),
            Text.rich(
              TextSpan(
                children: <TextSpan>[
                  TextSpan(text: watchlistItem.fields.review),
                ]
              )
            ),
          ],
        )
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.startDocked,
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: FloatingActionButton(
          onPressed: () {
            Navigator.pop(context);        
          }, 
          tooltip: 'Back',
          child: const Icon(Icons.arrow_back)
        )
      )
  );
  }
}