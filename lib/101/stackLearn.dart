import 'package:flutter/material.dart';
import '../core/random_image.dart';

// class StackLearn extends StatelessWidget {
//   const StackLearn({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       //içiçe binme varsa Stack kullan
//       body: Column(
//         children: [
//           Expanded(
//               flex: 4,
//               child: Stack(
//                 children: const [Positioned.fill(child: RandomImage())],
//               )),
//           // ignore: prefer_const_constructors
//           Spacer(
//             flex: 6,
//           )
//         ],
//       ),
//     );
//   }
// }

class StackDemoView extends StatelessWidget {
  const StackDemoView({Key? key}) : super(key: key);
  final _cardHeight = 100.0;
  final _cardWidth = 200.0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Expanded(
              flex: 4,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  Positioned.fill( //yerleştirmede işe yarar 
                      bottom: _cardHeight / 2, child: const RandomImage()),
                  Positioned(
                      height: _cardHeight,
                      bottom: 0,
                      width: _cardWidth,
                      child: _cardCustom())
                ],
              )),
          const Spacer(flex: 6)
        ],
      ),
    );
  }

  Card _cardCustom() {
    return const Card(
      color: Colors.white,
      shape: RoundedRectangleBorder(),
    );
  }
}
