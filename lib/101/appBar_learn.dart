import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AppBarLearnView extends StatelessWidget {
  AppBarLearnView({super.key});

  String _title = "AppBar da neymiş";

  final IconSize iconSize = IconSize();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        // Öğrenmen için buraya yazdım ama temiz kod olması için stabil kalacakları main de ki appbar da thema kısmında ayarla mutlaka gereksiz koddan kaçın
        appBar: AppBar(
          backgroundColor: Colors.transparent, // renk
          leading: const Icon(Icons.one_k), // sol kısım
          // ignore: prefer_const_constructors
          actions: const [Icon(Icons.two_k)], // sağ kısım
          title: Text(
              _title), // keklikler direk texti ekler buraya sen yukarıda ki gibi de kullanma ayrı class kur
          centerTitle: true, // ortaya gelmesi için izin verdik
          elevation: 5, // gölgelik
          systemOverlayStyle: SystemUiOverlayStyle.light, // statüs bar rengi
          /// actionsIconTheme üstüne gel  tipi IconThemeData olduğunu görürsün onu kullan direk böylece ıcon rengi değişti
          actionsIconTheme: const IconThemeData(color: Colors.red),
        ),
        body: Container(
          color: const Color.fromARGB(255, 8, 101, 84),
          // double.infinity, ile gidebileceği kadar ilerlettik yapı bu sayede bozulmadı
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // ıconlar temiz şekilde thema da oluştur ama şimdilik class ile göstereceğim
              Icon(Icons.home_filled,
                  color: ColorsIcon().purpleColor, size: iconSize.largeIcon

                  /// IconSize sınıfından gelen nesne yardımıyla sınıfta ki data kullanıldı
                  ),
            ],
          ),
        ));
  }
}

// ıcon boyut classı
class IconSize {
  final double largeIcon = 150.0;
}

// renk sınıfı 
class ColorsIcon {
  Color purpleColor = Colors.purple;
}
