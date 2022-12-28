import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PageViewLearn extends StatelessWidget {
  final _pageController = PageController(viewportFraction: 0.75);
  // sayfa geçişini ayarlamak için
  // viewportFraction: 0.75 ile de sayfaya yakınlığı düzenler

  final RxInt _currentPageIndex =
      0.obs; // sayfa sayısı için değişken ve izlemeye alındı obs ile
  PageViewLearn({super.key});

  void _pageIndex(int index) {
    _currentPageIndex.value =
        index; // dışarıda ki index aktarıldı mevcut parametrenin değerine setstate olmaması için getx kullandım
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: Row(
        mainAxisSize: MainAxisSize.min, // min dedim en sağa taşındı
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25),
            child: Obx(() => Text(
                "$_currentPageIndex")), // kaçıncı sayfada olduğunu görmek için obx ile sarmaladık
          ),
          const Spacer(),
          FloatingActionButton(
            onPressed: () {
              _pageController.previousPage(
                  // bir önceki sayfaya geçiş
                  duration: _DurationUtility._durationLow, // geçiş süresi
                  curve: Curves.slowMiddle); // geçiş şekli
            },
            child: const Icon(Icons.chevron_left),
          ),
          FloatingActionButton(
            onPressed: () {
              _pageController.nextPage(
                  // bir sonraki sayfaya geçiş
                  duration: _DurationUtility._durationLow, // geçiş süresi
                  curve: Curves.linear); // geçiş şekli
            },
            child: const Icon(Icons.chevron_right),
          )
        ],
      ),
      body: PageView(
        onPageChanged:
            _pageIndex, // geriye döndürmeyen fonks olduğundan by şekilde kullanabilirdik kullandık
        padEnds:
            false, // sayfa sonunda ki beyazlıkl gösterilmemesi için false dedim
        controller: _pageController,
        // yana kaydırarak geçiş olur buralara sayfada ekleyebilirsin
        children: [
          Container(
            color: Colors.red,
          ),
          Container(
            color: Colors.yellow,
          ),
          Container(
            color: Colors.green,
          ),
        ],
      ),
    );
  }
}

// nerede sayılar string vb orada class olur :-)
class _DurationUtility {
  static const _durationLow = Duration(seconds: 1);
}
