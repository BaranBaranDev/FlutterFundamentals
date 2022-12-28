import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import '../model.dart';
import 'post_model.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

class ServicePostLearn extends StatefulWidget {
  const ServicePostLearn({super.key});

  @override
  State<ServicePostLearn> createState() => _ServicePostLearnState();
}

class _ServicePostLearnState extends State<ServicePostLearn> {
  late final _dio; // init içinde vereceğiz ki tek seferlik olsun
  final String _baseUrl = "https://jsonplaceholder.typicode.com/";

  //? TextField için controller
  final TextEditingController _titleController = TextEditingController();
  final TextEditingController _bodyController = TextEditingController();
  final TextEditingController _userController = TextEditingController();

  String? result;

  @override
  void initState() {
    // proje başlar başlamaz bir şeyin gelmesini istersen initState buradayım der
    super.initState();
    _dio = Dio(BaseOptions(
        baseUrl:
            _baseUrl)); // BaseOptions ile de belli bir path atadık son kelimeyle veri havuzu değiştiğinden daha sade duracak
  }

  //? verileri göndermek  için method kuruyoruz

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          // ignore: prefer_const_constructors
          TextField(
              controller: _titleController,
              keyboardType: TextInputType.text,
              textInputAction:
                  TextInputAction.next, // next basınca alta geçer ,
              decoration: InputDecoration(label: Text("title"))),
          // ignore: prefer_const_constructors
          TextField(
              controller: _bodyController,
              keyboardType: TextInputType.text,
              textInputAction: TextInputAction.next,
              decoration: InputDecoration(label: Text("body"))),
          // ignore: prefer_const_constructors
          TextField(
              controller: _userController,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.number, // sadece numara
              autofillHints: const [AutofillHints.creditCardNumber],
              // ignore: prefer_const_constructors
              decoration: InputDecoration(label: Text("UserId"))),
          ElevatedButton(
              onPressed: () {
                if (_titleController.text
                        .isNotEmpty && // controllerda ki veri boş değilse şartı
                    _userController.text.isNotEmpty &&
                    _bodyController.text.isNotEmpty) {
                  //? İlk başta validasyon yaptık şimdi ise model oluşturuyoruz
                  final model = PostModelService(
                      body: _bodyController.text, // bodye yollanacak veri
                      title: _titleController.text, // title yollanacak veri
                      userId: int.tryParse(_userController
                          .text) // int değer idi tryParse ile dönüştürdük
                      );
                  _addItemsPostModelService(
                      model); // basılınca modele tanımlanan veriler methoda dahil edilip yollanacak
                }
              },
              child: const Text("Send")),
          Text(result ?? "İşlem Başarısız")
        ],
      ),
    );
  }

  Future<void> _addItemsPostModelService(PostModelService postModel) async {
    //! PostModelService türetilen postModel alacağımız verinin değişkenidir temsili yani
    // post işlemi yapılacak yetkilendirme verildi
    final response = await _dio.post('posts',
        data: postModel // datada isteğin gönderileceği yerdir
        );

    if (response.statusCode == HttpStatus.created) { // gönderme olacağından created dedik 
      
      setState(() {
        result = "Gönderme işlemi başarılı"; // ekranda görmek içindi :)
      });
    }
  }
}
