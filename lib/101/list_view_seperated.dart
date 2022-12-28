import 'package:flutter/material.dart';

class ListViewSeparetedLearn extends StatefulWidget {
  const ListViewSeparetedLearn({super.key});

  @override
  State<ListViewSeparetedLearn> createState() => _ListViewSeparetedLearnState();
}

class _ListViewSeparetedLearnState extends State<ListViewSeparetedLearn> {
  late final List<_CollectionProduct>
      _items; // late diyerek init içinde değer alacağını söyledim ve final ile değişmeyeceğini belirttik
  @override
  void initState() {
    super.initState();
    _items = _ItemsCollection()._item;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView.separated(
          padding: const EdgeInsets.all(15),
          itemBuilder: (context, index) {
            // başlamadan önce gelecekleri düşün model kur liste kurdum parça parça yerleştirdim
            return Card(
              child: SizedBox(
                height: 300,
                child: Column(
                  children: [
                    Expanded(
                        child: Image.network(
                      _items[index].path, // path
                      width: 200, // genişlik
                      fit: BoxFit.fill, // ekrana tamamını alacak
                    )), // widget sığmazsa expaded ile sar
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(_items[index]
                            .title), // listenin ve yukarıdan gelen index ile elemanları arasında tur atıp. ile .çağırabiliriz
                        Text(
                            "\$ ${_items[index].price}") // listede price kısmı geldi
                      ],
                    ),
                  ],
                ),
              ),
            );
          },
          separatorBuilder: (context, index) =>
              const Divider(), // widget sonrası araya giren widget
          itemCount: _items.length // boyutu listenin boyu kadar oldu
          ),
    );
  }
}

// card yapıda bulunacakların classı
class _CollectionProduct {
  final String path; // resim pati
  final String title; // başlık
  final double price; // fiyat

  _CollectionProduct(
      {required this.path, required this.title, required this.price});
}

// temiz yazmak için sayılar string çıkar ve karışık yapı kurma çıkar dışarı ama bu seferlik göz ardı ettim :)))

class _ItemsCollection {
  late final List<_CollectionProduct>
      _item; // late diyerek init içinde değer alacağını söyledim ve final ile değişmeyeceğini belirttik
  @override

  _ItemsCollection() { // initState yazabilirdik ama temiz olması için class içinde değişken kurduk bunu tanımlattık 
    _item = [
      _CollectionProduct(
          path:
              "https://assets.coingecko.com/coins/images/7588/large/TLOS_200.png?1629277084",
          title: "TELOS",
          price: 100),
      _CollectionProduct(
          path:
              "https://assets.coingecko.com/coins/images/7588/large/TLOS_200.png?1629277084",
          title: "TELOS2",
          price: 150),
      _CollectionProduct(
          path:
              "https://assets.coingecko.com/coins/images/7588/large/TLOS_200.png?1629277084",
          title: "TELOS3",
          price: 300)
    ];
  }
}
