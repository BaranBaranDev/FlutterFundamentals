// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:dio/dio.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

import '../model/resource_model.dart';

abstract class IRegresService {
  //? ilk başta soyut bir class kurduk
  final Dio
      dio; // view kısmından dio alacağız yani dışarıdan alınacak ondan bu şekilde oluşturdum
  IRegresService({
    required this.dio,
  });

  
/*
  ? sıra gelde methodumuza onu da burada isimlendirip extend edeceğiz bu classı diğer tarafta otomatik göreceğiz
  ! Future<List<ResourceModel>?> fetchResourceItem(); 
  !!
  ! yukarıda data sadece döneceğine liste almışız doğru değil single dönüş olacak aşağıda da liste mi yerine 
  ! map mi diye güncelleyeceğiz 
  !!
  ortaya esinlendiği modelin ismi sağına doğru ilerle null olabnilir method ismi soluna doğruda türü mesela burada list ve fonk türü future yapısında olacağından future diyip oluşturabiliriz
*/
   Future<ResourceModel?> fetchResourceItem(
    
   ); 
}






class RegresService extends IRegresService {
  // service classımız ve ona soyut clasımızı entegre ettik oradan da özellikleri aldık
  RegresService({required super.dio});

  @override
  Future<ResourceModel?> fetchResourceItem() async {
    final response = await dio.get(
        // yetkilendirildi jsonlar response içinde sıra geldi içine akın etmeye :)
        "/${_RegResPath.resource.name}"); // daha güçlü olması için enum kullandım

    // ilk başta verilerin durumunu kontrol ederiz
    if (response.statusCode == HttpStatus.ok) {
      final jsonBody = response.data; //json içi değişkene aktarıldı
      /*
      if (jsonBody is List) {
        // listeyse
        return jsonBody
            .map((json) => ResourceModel.fromJson(json))
            .toList(); // mapleyerek ResourceModel içinde ki fromJson'a göre yeni liste üretmiş olduk
      } 
      */
      if (jsonBody is Map<String, dynamic>) {
        // datayı okuyacaktık listeyse diyince olmuyor çünkü map ondan dolayı değişiklik yaptık 
        return ResourceModel.fromJson(jsonBody); // single döndüğünden bu şekilde parse ettik  
      }
    }
    return null; // bir şey göstermez
  }
}

enum _RegResPath { resource } //path için
