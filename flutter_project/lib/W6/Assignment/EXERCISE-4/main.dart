import 'package:flutter/material.dart';
import 'package:flutter_project/W6/Assignment/EXERCISE-4/jokes.dart';
// import 'package:flutter_project/W6/Assignment/EXERCISE-4/jokes_model.dart';

Color appColor = Colors.green[300]!;

void main() => runApp(MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: appColor,
          title: const Text("Favorite Jokes"),
        ),
        body: ListView(
          children: [
            for (int i = 0; i < jokes.length; i++) FavoriteCard(index: i),
          ],
        ),
      ),
    ));

class FavoriteCard extends StatefulWidget {
  final int index;
  const FavoriteCard({
    super.key, 
    required this.index,
  });

  @override
  State<FavoriteCard> createState() => _FavoriteCardState();
}

bool isAnyCardFavorited = false;

class _FavoriteCardState extends State<FavoriteCard> {
  bool _isFavorite = false;

  void onFavoriteClick() {
    setState(() {
      if (_isFavorite) {
        _isFavorite = false;
        isAnyCardFavorited = false;
      } else if (!isAnyCardFavorited) {
        _isFavorite = true;
        isAnyCardFavorited = true; 
      }
    });
  }
 
  @override
  Widget build(BuildContext context) {
    final currentJoke = jokes[widget.index];
    
    return Container(
      decoration: const BoxDecoration(
        border: Border(
          bottom: BorderSide(width: .5, color: Colors.grey),
        ),
      ),
      padding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  currentJoke.title,
                  style: TextStyle(
                      color: appColor, fontWeight: FontWeight.w800),
                ),
                const SizedBox(height: 10.0),
                Text(currentJoke.description)
              ],
            ),
          ),
          IconButton(
              onPressed: onFavoriteClick,
              icon: Icon(
                _isFavorite ? Icons.favorite : Icons.favorite_border,
                color: _isFavorite ? Colors.red : Colors.grey,
              ))
        ],
      ),
    );
  }
}
