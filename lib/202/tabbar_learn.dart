import 'package:flutter/material.dart';

class TabbarViewLearn extends StatefulWidget {
  const TabbarViewLearn({super.key});

  @override
  State<TabbarViewLearn> createState() => _TabbarViewLearnState();
}

class _TabbarViewLearnState extends State<TabbarViewLearn>
    with TickerProviderStateMixin {
  late final TabController _tabController; // late dedim init anında oluşacak
  @override
  void initState() {
    super.initState();
    _tabController = TabController(
        // tabbar altında ki her controllere verdim ki birbiriyle bağlantılı olsun
        length: _MyTabView.values.length,
        vsync:
            this); // vsync: thisotomatik gelmesi için hayatın döndüğü classa with TickerProviderStateMixin entegre ettik
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
        // scaffoldu sardık
        length: _MyTabView.values.length, // eleman sayısı
        child: Scaffold(
          extendBody:
              true, // daha güzel gözükür bottom bar ile fab buton da gözlemlersin
          body: TabBarView(
            controller: _tabController,
            //TabBarView dersek ekran da ki görünüm dahil olur
            children: [
              Container(
                color: Colors.yellow,
              ),
              Container(
                color: Colors.green,
              ),
            ],
          ),
          floatingActionButton: FloatingActionButton(
            onPressed: () {
              _tabController.animateTo(0); // basılınca gider
            },
          ),
          floatingActionButtonLocation: FloatingActionButtonLocation
              .centerDocked, // bottom ortasına hizaladık
          bottomNavigationBar: BottomAppBar(
            // appbar da ki yöntem ile benzer
            color: Colors.red,
            child: TabBar(
              controller: _tabController,
              ///? Listede elemanları yazdırmamız lazımdı ve tabs liste alıyordu yeni liste üretip elemanları çıkarmak için mapledik
              tabs: _MyTabView.values.map((e) => Tab(text: e.name)).toList(),

              //? KİRLİ
              // tabs: const [
              //   Tab(
              //     text: "1",
              //   ),
              //   Tab(
              //     text: "2",
              //   )
              // ],
            ),
          ),
          appBar: AppBar(
            bottom: TabBar(controller: _tabController, tabs: const [
              // appbar bottom dan TabBar kurduk
              Tab(
                text: "1",
              ),
              Tab(
                text: "2",
              )
            ]),
          ),
        ));
  }
}

// isimlendirmeleri direk enumda yap ki temiz olsun ve boyutu da buradan aldık
enum _MyTabView { yellow, green }

//Bir classa güç kazandırmak için extansion yazılır
extension _MyTabExtansion on _MyTabView {
  //_MyTabView enumuna güç kazandıracağız burada ki fonks listede ki elemanlarda da kulanılabilir

}
