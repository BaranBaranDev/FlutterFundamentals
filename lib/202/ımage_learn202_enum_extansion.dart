import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'animated_learn.dart';

class ImageLearn202 extends StatefulWidget {
  const ImageLearn202({super.key});

  @override
  State<ImageLearn202> createState() => _ImageLearn202State();
}

class _ImageLearn202State extends State<ImageLearn202> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      body: Center(
          child: Column(
        children: [
          Image.asset(ImagePaths.apple
                  .path() //! enum class.içinde ki name sonrada string döndüren fonks

              ),
          Text("data", style: context.textTheme().subtitle2), //Önceden oluşturmuştuk extansion ile 
        ],
      )),
    );
  }
}

enum ImagePaths {
  // int değer string değer ne olursa olsun enum ile numaralndırılıp daha efektif kullanabilirsin
  apple
}

//enum classıma güç katmam lazım işte orada extansion devreye girer
extension ImagePathsExtension on ImagePaths {
  //ImagePaths'e güç vereceğimizi belirttik
  String path() {
    return "images/$name.png"; // name enumdan gelir ve içeride ki apple dahil edilmiş olacak
  }
}
