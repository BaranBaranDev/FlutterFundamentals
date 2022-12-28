// import 'package:flutter/material.dart';

// class CallBackLearn extends StatefulWidget {
//   const CallBackLearn({super.key});

//   @override
//   State<CallBackLearn> createState() => _CallBackLearnState();
// }

// class _CallBackLearnState extends State<CallBackLearn> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(),
//       body: Column(),
//     );
//   }
// }

// // kullanıcı classı
// class CallBackUsers {
//   final String name;
//   final int id;

//   CallBackUsers(this.name, this.id);
//   // TODO dummy remove it
//   // liste 
//   static List<CallBackUsers> dummyUser() { // sahte kullanıcı dönen method
//     //static oluşturduk ki returnleyen kısmı görmesin ki içini dolduralım
//     return [
//       //CallBackUsers(name, id)
//       CallBackUsers("bb", 1),
//       CallBackUsers("b", 2)
//     ];
//   }
// }



import 'package:flutter/material.dart';
import 'package:flutterogreniyorum/product/buton/answerButton.dart';

import '../product/buton/loading.dart';
import '../product/callBackdummy.dart';

class CallBackLearn extends StatefulWidget {
  const CallBackLearn({Key? key}) : super(key: key);

  @override
  State<CallBackLearn> createState() => _CallBackLearnState();
}

class _CallBackLearnState extends State<CallBackLearn> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          CallBackDropdown(onUserSelected: (CallbackUser user) {
            print(user);
          }),
          AnswerButton(
            onNumber: (number) {
              return number % 3 == 1;
            },
          ),
          LoadingButton(
              title: 'Save',
              onPressed: () async {
                await Future.delayed(const Duration(seconds: 1));
              })
        ],
      ),
    );
  }
}

class CallbackUser {
  final String name;
  final int id;

  CallbackUser(this.name, this.id);

  // TODO: Dummy Remove it
  static List<CallbackUser> dummyUsers() {
    return [
      CallbackUser('vb', 123),
      CallbackUser('vb2', 124),
    ];
  }

  @override // equlatily diye bir işlem yaptık classa gelip tıklarsan görürsün bu sayede length 1 den fazla gözükmeyip patlamadan devam edeceğiz 
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is CallbackUser && other.name == name && other.id == id;
  }

  @override
  int get hashCode => name.hashCode ^ id.hashCode;
}