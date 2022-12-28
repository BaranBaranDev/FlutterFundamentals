import 'package:flutter/material.dart';

class TextLearnView extends StatelessWidget {
  const TextLearnView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          //Eğer text gelmezse ?? "" diyerek boş olmasını sağlar böylece patlamazsın
          Text(TextItems.merhaba * 50, // temiz kullanım için
              maxLines: 3, // maksimun satır sayısı
              overflow: TextOverflow.ellipsis, // sona 3 nokta koyduk
              textAlign:
                  TextAlign.right, // sağa kaydırdık yerleştirme için kullanılır
              style: ProjectStyle
                  .textStyleFeatures // daha temiz kod için fakat daha iyi yöntem ise thema üzerinden gitmektir
              ),
          Text(
            TextItems.welcome,
            style: Theme.of(context) // context bağlantımız
                .textTheme // textThema diyoruz
                .headline4 // boyutlandırdık ve nullSafety dikkat et ardından diğer özell. copyWith içine yazdık
                ?.copyWith(
                    color: ColorItems // daha önce tanımlanan sınıftan çağırdık 
                        .redColor), // evet daha kullanışlı bir kod olur bu
          )
        ],
      ),
    );
  }
}

///Style özelliği bir sınıfta oluşturuldu
class ProjectStyle {
  /// static olarak tanımla kullanabilmen için bir kez kayıt edilir ve kullanırsın
  static TextStyle textStyleFeatures = const TextStyle(
    letterSpacing: 2, //boşluk verdi harf arasına
    wordSpacing: 2, // kelimeler arası boşluk
    decoration: TextDecoration
        .underline, // altını çizdirdik textin farklı özelliklerde mevcuttur
    fontSize: 25, //boyut
    fontStyle: FontStyle.italic, // STYLE
    fontWeight: FontWeight.w300, // kalınlık
  );
}

/// text sınfımız
class TextItems {
  static String get merhaba => "Selam Ver"; // temiz olması için tanımladım
  static String get welcome => "Hoş geldin"; // temiz olması için tanımladım
}

class ColorItems {
  static Color redColor = Colors.red;
}
