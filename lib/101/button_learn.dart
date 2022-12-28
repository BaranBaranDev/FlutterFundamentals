import 'package:flutter/material.dart';

class ButtonLearnView extends StatelessWidget {
  const ButtonLearnView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          TextButton(
              onPressed: () {}, child: const Text("button 1")), // yazı buton
          ElevatedButton(
            style: ButtonStyle(
              // style ile tarzını oluştur.
              backgroundColor: MaterialStateProperty.resolveWith((states) {
                // If the button is pressed, return green, otherwise blue
                if (states.contains(MaterialState.pressed)) {
                  return Colors.green;
                }
                return Colors.white38;
              }),
              textStyle: MaterialStateProperty.resolveWith((states) {
                // If the button is pressed, return size 40, otherwise 20
                if (states.contains(MaterialState.pressed)) {
                  return const TextStyle(fontSize: 10);
                }
                return const TextStyle(fontSize: 2);
              }),
            ),
            child: const Text("Changing Button"),
            onPressed: () {},
          ), // renkli arka planlı buton
          IconButton(
              onPressed: () {},
              icon: const Icon(Icons
                  .ads_click)), // icon yazarsa Icons(Icons.add) yap bu genel olarak böyledir
          OutlinedButton(
              onPressed: () {},
              // tasarım styleden sorulur bu tavsiye edilen yöntem diğeri de bir üstte
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.grey,
                elevation: 5,
              ),
              child: const Text(
                  "button 4")), // arka planı sınıra almış buton istersen
          FloatingActionButton(
            // klasik fab butonumuz
            onPressed: () {},
            child: const Icon(Icons.add),
          ),
          InkWell(
            // InkWell ile tıklanırlık sağlanır
            onTap: () => null,
            child: const Text("button 5"),
          )
        ],
      ),
    );
  }
}
