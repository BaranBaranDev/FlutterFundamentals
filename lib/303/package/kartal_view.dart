import 'package:flutter/material.dart';
import '../feed.dart';
import 'package:kartal/kartal.dart';
 //!KARTAL PAKETİ KOL KANAT GİBİDİR 
typedef ImageLoader = void Function(String url);

class KartalView extends StatefulWidget {
  const KartalView({Key? key, this.onImage}) : super(key: key);

  final ImageLoader? onImage;
  @override
  State<KartalView> createState() => _KartalViewState();
}

class _KartalViewState extends State<KartalView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          InkWell(
              onTap: () {
                context.navigateToPage(const FeedView(), type: SlideType.BOTTOM); // geçiş 
              },
              child: Text('Kartal', style: context.textTheme.headline1)),
          Icon(context.isIOSDevice ? Icons.ios_share : Icons.android_rounded), // cihaz türü okuma 
          AnimatedContainer(
              duration: context.durationLow,
              height: context.isKeyBoardOpen ? 0 : context.dynamicHeight(0.15), //klavye açık mı değil mi 
              color: Colors.red),
          const TextField(),
          Image.network(''.randomImage), // random resim 
          InkWell(
              onTap: () {
                'vbacik.10@gmail.com'.launchEmail;
                'https://github.com/VB10/Flutter-Full-Learn/issues/3'.launchWebsite; // site yönlendirme hatta wp da uygulayabilirsin
              },
              child: Text('vb', style: context.textTheme.headline1)) //tema ,boyutlandırma 
        ],
      ),
    );
  }
}