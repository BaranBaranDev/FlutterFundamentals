//! Stateless widget, padding, card ve image widgetları
// fonks tarzında widget ile yapı kurup çağırdığında sınıf kapsamında olması lazım ama class öyle değil her sayfada ulaşabilir kılabilirsin

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class StatelesLearn extends StatelessWidget {
  const StatelesLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SafeArea(
        // safeAre ekranın en üst kısımlarından ayırır
        child: Column(
          children: [
            const Padding(
                // boşluk vermek istersen padding kullan
                padding:
                    ProjectPadding.paddingSymetric // temiz kod olması içinn
                ),
            _TextsAdd(title: _firstData),
            _TextsAdd(title: _secondData),
            const _container4(),
            const ProjectCard(),
            const ProjectCard(data: "Selam "),
            ImageLearnView(
              resim: ImagesItems().applePurple, // daha efektif olması için bu şekilde kullandım
            ) 
          ],
        ),
      ),
    );
  }
}

/// extract widget ile çıkardım
class _container4 extends StatelessWidget {
  const _container4({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      color: Colors.red,
    );
  }
}

// ekleyeceğimiz textler için ve _ ile oluşturduğumuzdan buraya özgü oldu
class _TextsAdd extends StatelessWidget {
  const _TextsAdd({super.key, required this.title});
  final String
      title; // boş parametre aldık  yukarıda constructor da oluşturduk dışarıdan veri ekleme var
  // eğer String ? title diye kursaydın null olabileceğini belirttiğimizden requireda gerek kalmazdı
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headline3,
    ); // direk parametreyi ekledik eğer states olsaydı widget.title derdik
  }
}

// boşluklar içinde class kurduk ve padding genelde sabittir hayır demeyi bil ve yapıyı bozma
class ProjectPadding {
  static const paddingSymetric =
      EdgeInsets.symmetric(horizontal: 100, vertical: 15);

  static const shapeRounded = RoundedRectangleBorder(
      borderRadius: BorderRadius.all(Radius.circular(15)));
}

// Card yapımız
class ProjectCard extends StatelessWidget {
  const ProjectCard({super.key, this.data});

  final String? data; // parametre tanımlandı

  @override
  Widget build(BuildContext context) {
    // Container yerine daha tatlı olan widget Card widgetı
    return Card(
      color: Theme.of(context).backgroundColor, // temadan renk aldık
      elevation: 5, // gölgelik
      margin: ProjectPadding.paddingSymetric,
      //cardThema mainden card widgetini özelleştirebilirsin.
      /// paddin içe margin dıştan aralık verir
      shape: ProjectPadding
          .shapeRounded, // temiz kod için ya main thema dan hallet ya da sınıf kur
      //!RoundedRectangleBorder(), // özelleştir istediğin gibi kullan
      //!CircleBorder(), // yuvarlak
      //!StadiumBorder(), // boyutlandırma uygunsa staqtium şeklinde güzel bir shape ürünü
      child: SizedBox(
        /// Boyutlandırdık
        height: 150,
        width: 150,
        child: Center(
          // texti ortaya hizaladım
          child: Text(data ?? "Data Ulaşamadı"),
        ), // ? ile nuln gelebilir dedim öyle olursa da ?? ile durum kontrolü sağlandı
      ),
    );
  }
}

//resim classı
class ImageLearnView extends StatelessWidget {
  const ImageLearnView({super.key, required this.resim});

  final String resim;

  @override
  Widget build(BuildContext context) {
    return SizedBox(height: 50, width: 50, child: Image.asset(resim));
  }
}

//resim string classı
class ImagesItems {
  // verimli yapı için bu şekilde kullanmaya özen göster
  final String _apple = "images/apple.png";

  String get applePurple => _apple;
}

// bu sayfaya özel string veriler oluşturdum daha temiz olması açısından
String get _firstData => "Birinci Veri ";
String get _secondData => "İkinci Veri ";
