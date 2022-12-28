import 'package:flutter/material.dart';

class RandomImage extends StatelessWidget {
  const RandomImage({Key? key, this.height = 100})
      : super(key: key); // varsayılan parametre verildi
  final imageUrl = 'https://picsum.photos/200/300';
  final double height;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Image.network(imageUrl, height: height, fit: BoxFit.fill));
  }
}
