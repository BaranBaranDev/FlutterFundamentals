import 'package:flutter/material.dart';
import '../model/resource_model.dart';
import '../service/request_service.dart';
import '../../../product/service/project_dio.dart';
import 'package:get/get.dart';
import '../../Controller/LoadingController.dart';
import '../view/reg_res_view.dart';

abstract class RegResViewModel extends State<RegResView> with ProjectDioMixin {
  // state özellikleri aktarıldı

  late final IRegresService
      regresService; // late dedim çünkü initState de değer atanacak
/*
  List<ResourceModel> resource =
      []; // boş liste tanımlandı ama içi doldurulacak gelen veriler için
*/
  List<Data> resource = [];
  final controllerLoading = Get.put(
      LoadingController()); // Controller klasörden verinin gelip gelmeme durumunu görmek için loading

  //baseUrl için https://reqres.in/api/unknown veri gelir base'e de  https://reqres.in/api yazılır
  // service =  Dio(BaseOptions(baseUrl:"https://reqres.in/api")) biz temiz olması için product klasör altında bir classdan alacağız bu şekilde uzun uzun tekrar tekrar yazmaktan kaçınacağız
  @override
  void initState() {
    super.initState();
    regresService = RegresService(
        dio: service); // service with ProjectDioMixin ile birlikte geldi
  }

  //temiz bir şekilde servisten çağırma işlemini görelim
  Future<void> fetchData() async {
    controllerLoading.changeLoadingGetx(); // loading başlar  //true durumu
    /*
    resource = await regresService
        .fetchResourceItem() ?? []; // verileri alacağımız servisi çağırdık ve atadık bunun aracılığıyla görüntüde görebiliriz 
   */
    resource = (await regresService.fetchResourceItem())?.data ?? []; // almak istediğimiz verilere resource sayesinde ulaşacağız 
    controllerLoading
        .changeLoadingGetx(); // loadingin bittiğini görmek için bir kez daha yazdık  //false durumu
  }
}
