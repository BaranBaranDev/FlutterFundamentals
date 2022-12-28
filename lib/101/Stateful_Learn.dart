import 'package:flutter/material.dart';

import '../language/language_items.dart';

class StatefulLearn extends StatefulWidget {
  const StatefulLearn({super.key});
  //! Bu kısım dışarıdan datanın geldiği yerdir yani değişmeyenler burada
  @override
  State<StatefulLearn> createState() => _StatefulLearnState();
}

class _StatefulLearnState extends State<StatefulLearn> {
  //! State hayattır ve hayatlar bu classın altında olur ana işlemler burada yazılır
  int _counter = 0; // başlangıç değerimiz ve değişecek değiğşken
  void _isUptade(bool value) {
    // başka yerden ulaşılmaması için buraya özgü hazırlıyoruz
    if (value) {
      // dışarıdan true false gelecek true ise burası değilse else kısmı çalışır
      _counter = _counter + 1;
      setState(() {}); // arayüzde günceller build tetiklenir
    } else {
      _counter = _counter - 1;
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(LanguageItems().welcome), // product kısmında languade adında yer oluşturduk stringleri orada tutup buraya çekeceğim 
      ),
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min, // min dedim en sağa taşındı
        children: [
          FloatingActionButton(
            onPressed: () {
              _isUptade(true); // tıklanınca true olarak çalışacak
            },
            child: const Icon(Icons.add),
          ),
          FloatingActionButton(
            onPressed: () =>
                _isUptade(false), // tıklanınca false olarak çalışacak
            child: const Icon(Icons.remove),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        // ignore: prefer_const_literals_to_create_immutables
        children: [
          Align(
            // align ile nakliyecilik yaptık :)
            alignment: Alignment.center,
            child: _TextCounter(counter: _counter),
          )
        ],
      ),
    );
  }
}

//? TextCounterimiz ve eğer farklı bir yapı kurup kirli duracaksa product kısmında state class kur sadece o widgeti returnlet daha sonra burada kullan.
//? Bu sayede gereksiz yere state kullanımı azaltırsın ve program çalışmasına zararın olmaz
class _TextCounter extends StatelessWidget {
  const _TextCounter({
    Key? key,
    required int counter, // dışarıdan parametre alıyoruz
  })  : _counter = counter,
        super(key: key);

  final int _counter;

  @override
  Widget build(BuildContext context) {
    return Text(
      _counter.toString(), // int stringe dönüştü text içi kullanıldı
      style: Theme.of(context) // themadan boyutlandırma ve renklendirme yapışdı
          .textTheme
          .headline2
          ?.copyWith(
              color: Colors.red), // copyWith ile daha fazla özelleştirme yaptık
    );
  }
}
