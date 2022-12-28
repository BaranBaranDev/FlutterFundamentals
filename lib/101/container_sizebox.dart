import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ContanerSizeboxLearnView extends StatelessWidget {
  const ContanerSizeboxLearnView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.teal,
      // scaffold bizim iskeletimiz olur
      appBar: AppBar(
        // üstte ki bar
        title: const Text("Container Sizebox Öğreniyorum "),
        backgroundColor: Colors.blueGrey, // rengi güncelledik
      ),
      bottomSheet: const Text("Sayfa1"),

      /// aşağı köşede yer alır
      bottomNavigationBar: BottomNavigationBar(items: const [
        // aşağıda ki geçiş barı
        BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
        BottomNavigationBarItem(icon: Icon(Icons.co2), label: "Hm")
      ]),
      floatingActionButton: FloatingActionButton(
        // köşede ki button
        onPressed: () {},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation
          .centerDocked, // yerini ayarlar fab butonun
      drawer: const Drawer(), // üç çizgi yardımcı penceremiz için
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          SizedBox(
            // sizebox en temel kullanımı
            height: 150,
            width: 150,
            child: Text("a" * 500),
          ),
          const SizedBox.shrink(), // boş göstermek için shrink kullanabilirsin
          SizedBox.square(
            // kare vermek istersen
            dimension: 50, // 50 lik olmasını istedim
            child: Text("b" * 50),
          ),
          Container(
            height: 150, // uzunluk
            width: 100, // genişlik
            //color: Colors.green,
            constraints: const BoxConstraints(

                /// sınırlama verebilirsin constraints sayesinde
                maxWidth: 100),
            padding: const EdgeInsets.all(
                10), // container içi her köşeye mesafe verdi
            margin:
                const EdgeInsets.all(5), // container dışı alana mesafe verdik
            decoration: ProjectDecoration
                .projectDecoration, // oluşturduğumuz yapıyı kullandık
            child: Text("abcd" * 50),
          )
        ],
      ),
    );
  }
}

// temiz kod istersen sınıflar ve methodlar
class ProjectDecoration {
  static BoxDecoration projectDecoration = BoxDecoration(
      borderRadius:
          BorderRadius.circular(5), // ovallik istersen borderRadius kullan
      gradient: // rengi dağıtır
          // ignore: prefer_const_constructors
          LinearGradient(colors: const [Colors.lightBlue, Colors.green]),
      color: Colors.green,
      boxShadow: const [
        BoxShadow(
            // gölgelendirme için
            blurRadius: 25,
            //offset: (1,1,1,5),
            color: Colors.orange,
            spreadRadius: 50)
      ],
      border: Border.all(
          // köşede ki çizgiler
          color: Colors.red // çizgi rengini ayarladık
          ));
}
