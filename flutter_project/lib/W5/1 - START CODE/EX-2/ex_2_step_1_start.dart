import 'package:flutter/material.dart';

// class FavoriteCard extends StatelessWidget {
//   const FavoriteCard({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(8.0),
//       child: Container(
//         decoration: BoxDecoration(
//           border: Border(bottom: BorderSide(color: Colors.grey))
//         ),
//         child: Row(
//           children: [
//             Expanded(
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text('Title', style: TextStyle(color: Colors.blue)),
//                   Text('Description'),
//                 ],
//               ),
//             ),
//             Icon(Icons.favorite),
//           ],
//         ),
//       ),
//     );
//   }
// }

class FavoriteCard extends StatefulWidget {
  const FavoriteCard({super.key});

  @override
  State<StatefulWidget> createState() {
    return _HeartButtonState();
  }
}

class _HeartButtonState extends State<FavoriteCard> {
  bool isFavorite = false;
  Color get buttonColor => isFavorite ? Colors.grey.shade100 : Colors.red;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border(bottom: BorderSide(color: Colors.grey)),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Title', style: TextStyle(color: Colors.blue)),
                  Text('Description'),
                ],
              ),
            ),
            IconButton(
              onPressed: () => {
                setState(() {
                  isFavorite = !isFavorite;
                }),
              },
              icon: Icon(Icons.favorite, color: buttonColor),
            ),
          ],
        ),
      ),
    );
  }
}

void main() => runApp(
  MaterialApp(
    home: Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: const Text("Favorite cards"),
      ),
      body: Column(children: [FavoriteCard(), FavoriteCard(), FavoriteCard()]),
    ),
  ),
);
