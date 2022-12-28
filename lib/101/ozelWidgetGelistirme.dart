import 'package:flutter/material.dart';

class CustomWidget extends StatelessWidget {
  const CustomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      appBar:
          AppBar(actions: const [CircleProgressRedIndikator()]), // indikatör
      backgroundColor: _ColorsUtility().greyColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            ButtonWidget(
              onPressed: () {},
              title: 'Food',
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width /
                  3, // ekran genişliğinie göre oranlar
              child: ButtonWidget(
                onPressed: () => null,
                title: 'Card',
              ),
            ),
            const LinearProgressIndicator(), // farklı bir indikatör
          ],
        ),
      ),
    );
  }
}

class CircleProgressRedIndikator extends StatelessWidget {
  const CircleProgressRedIndikator({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        // basık durmaması için center dedim
        child: CircularProgressIndicator(
      color: _ColorsUtility()
          .redColor, // rengi main de progressIndikatör denen kısımdan değiştir
      //renk sabittir değiştirirsen sürekli düzgün dizayn olmaz ve burada rengi değiştirirsen mutlaka isim kurarken rengi de belirt
      // value: 0.9,
    ));
  }
}

//! özel class kurduk with ile widget classına saracağım böylece kodların bulunduğu ana kısım sade efektif ramden az yiyecek
class _ColorsUtility {
  final Color redColor = Colors.red;
  final Color whiteColor = Colors.white;
  final Color greyColor = const Color.fromARGB(255, 231, 224, 224);
}

class ButtonWidget extends StatelessWidget with _ColorsUtility {
  // renl classı with ile dahil ettik daha efektif olacak bu sayede
  ButtonWidget({super.key, required this.title, required this.onPressed});
  final String title; // buton içinde ki text
  final void Function()
      onPressed; // tıklama fonks direk eklemiş  olduk bu şekilde butona göre özelleştireceğiz
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        style: ElevatedButton.styleFrom(
            // button ismi. stylFrom kısmından buton özelleştirildi
            shape: const StadiumBorder(), // tatlı bir widget
            backgroundColor: whiteColor,
            elevation: 8),
        onPressed: onPressed, // tıklanılınca ne olacağı dışarıdan belirtilecek
        child: Text(
          title, // dışarıdan alınacak
          style: Theme.of(context)
              .textTheme
              .subtitle2
              ?.copyWith(color: redColor), // themadan gerekli okuma yapıldı
        ));
  }
}
