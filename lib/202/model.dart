import 'package:flutter/material.dart';

class PostModel {
  // path= https://jsonplaceholder.typicode.com/posts

  //! SERVİSTEN VERİ GELİRSE BUNU KULLAN
  final int? userId;
  final int? id;
  final String? title;
  final String? body;
  // final tanımladık null gelebilir dedik

  PostModel(
      {this.userId,
      this.id,
      this.title,
      this.body}); // requried vermeden hallettik
}

class ModelView extends StatefulWidget {
  const ModelView({super.key});

  @override
  State<ModelView> createState() => _ModelViewState();
}

class _ModelViewState extends State<ModelView> {
  // data değiştirilebilir olması için var yada Aldığı class ismini yazıp değişken kur 
  final user1 = PostModel(body: "Olacak o kadar ");
  @override
  void initState() {
    super.initState();
    final user2 = PostModel(body: "Olacak o kadar ");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
             Text(user1.body ?? "not data"),
        ],
      ),
    );
  }
}









