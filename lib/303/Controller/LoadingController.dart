import 'package:get/get.dart';

class LoadingController extends GetxController {
  RxBool isLoading =
      false.obs; // başlangıçta çalışmayacak ve obs ile izlemeye aldık

  void changeLoadingGetx() {
    isLoading .value =! isLoading.value; // her tıklamada tersini atar 
  }
}
