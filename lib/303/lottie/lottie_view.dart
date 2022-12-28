import 'package:flutter/material.dart';
import '../provider/change.dart';
import '../provider/themaNotf_learn/themaProvider.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class LottieView extends StatefulWidget {
  const LottieView({super.key});

  @override
  State<LottieView> createState() => _LottieViewState();
}

class _LottieViewState extends State<LottieView> with TickerProviderStateMixin {
  late final AnimationController
      _controller; // build tetiklenmeden alacağımızı belli ettik

  /// lottie kontrolü için bool değişken
  bool isLight = false;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: DuractionItems
            .normalDuraction() // pratik temiz efektif bir kullanım
        ); // VSYNC KARŞISI THİS DEDİK WİTH İLE TickerProviderStateMixin YAPTIK SORUN ÇÖZÜLDÜ
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Center(
              child: InkWell(
                onTap: () async {
                  _controller.animateTo(isLight ? 0.1 : 1);
                  isLight =
                      !isLight; // tersini atar zaten hazır aldık setState gerek yok

                  Future.microtask(
                    // yukarıad ki işlem bitince çalıştırır
                    () {
                      context
                          .read<ThemaNotifier>()
                          .changeThema(); // fonk çalıştırır.
                    },
                  );
                },
                child: Lottie.asset(LottieItems.themaChange.lottiePath,
                    repeat: false, // TEKRAR ETMEYİ DURDURUR
                    controller: _controller // initState de verilen  controller
                    //delegates:
                    ),
              ),
            ),
            Text(context
                .watch<ThemaNotifier>()
                .isLightThema
                .toString()), // watch takip eder 
            Text(context.read<ThemaNotifier>().isLightThema.toString()),// read bir kez okur
          ],
        ));
  }
}

/* 
 !Lottie.asset("lib/303/lottie/animationLottie/thema.json")
 ?temiz kod için bu stringi kullanırken product altında constant klasörü kur orada barındır
 !şuan öğrenmeye çalıştığımızdan kodları buraya yazacağım
*/

enum LottieItems { themaChange } // görsel dosya isimlerini barındırıyroum

extension LottiePathExtansion on LottieItems {
  // on ile yazacağımız yeri belli ediyoruz ve ona güç katmak için yazıyoruz
  String _path() {
    switch (this) {
      case LottieItems.themaChange:
        return "themaChange";
    }
  }

  String get lottiePath =>
      "lib/303/lottie/animationLottie/${_path()}.json"; // get ile kullanılacaak an çağırılır
}

//constant klasörde atanacak bir sınıfa daha geldik
///! Static kullanmadan duraction atamak
class DuractionItems extends Duration {
  // class ismi değişken ismini belirt iki nokta super ilede atanacak değeri yaz bunu da direk pratik şekilde kullanabilirsin
  DuractionItems.normalDuraction() : super(seconds: 1);
}
