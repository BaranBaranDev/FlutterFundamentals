
import '../../303/lottie/lottie_view.dart';
import '../../303/navigator/navigator_home_detail.dart';
import '../../303/navigator/navigator_home_view.dart';

class NavigatorRoures { // once class 
  static const paragfh = "/";
  final items = {
    paragfh: (context) => const LottieView(),
    NavigateRoutes.home.withParaf: (context) => const NavigateHomeView(),
    NavigateRoutes.detail.withParaf: (context) => const NavigateHomeDetail(),
  };// kirli kod olmaması için  değerleri değişkene atadık 
}

enum NavigateRoutes { init, home, detail } // okunur olması için enum oluşturdum

extension NavigateRoutesExtension on NavigateRoutes { //enum NavigateRoutes güç katacak 
  String get withParaf => "/$name"; // her isme yani name değerine bu returnlenecek 
}