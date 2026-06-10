import 'package:flutter/material.dart';

List<String> images = [
  "assets/w4-s2/bird.jpg",
  "assets/w4-s2/bird2.jpg",
  "assets/w4-s2/insect.jpg",
  "assets/w4-s2/girl.jpg",
  "assets/w4-s2/man.jpg",
];

class GalleryImage extends StatefulWidget {
  const GalleryImage({super.key});
  
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _GalleryImageState();
  }
}

class _GalleryImageState extends State<GalleryImage> {
  int currentImageIndex = 0;
  
  void nextImage() {
    setState(() {
      currentImageIndex++;

      if (currentImageIndex >= images.length) {
        currentImageIndex = 0;
      }
    });
  }

  void preImage() {
    setState(() {
      currentImageIndex--;

      if (currentImageIndex < 0) {
        currentImageIndex = images.length - 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
        backgroundColor: Colors.green[50],
        appBar: AppBar(
          backgroundColor: Colors.green[400],
          title: const Text('Image viewer'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.navigate_before),
              tooltip: 'Go to the previous image',
              onPressed: () => preImage(),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 50, 0),
              child: IconButton(
                icon: const Icon(Icons.navigate_next),
                tooltip: 'Go to the next image',
                onPressed: () => nextImage(),
              ),
            ),
          ],
        ),
        body: Image.asset(images[currentImageIndex]),
      );
  }
}

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false, // Why this line ? Can you explain it ?
      home: GalleryImage()
    ));
