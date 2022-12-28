import 'package:dio/dio.dart';
import 'post_model.dart';
import 'package:get/get_connect/http/src/status/http_status.dart';

class Service {


  final _dio = Dio(BaseOptions(baseUrl:"https://jsonplaceholder.typicode.com/"));

  Future<void> _addItemsPostModelService(PostModelService postModel) async {
    //! PostModelService türetilen postModel alacağımız verinin değişkenidir temsili yani
    // post işlemi yapılacak yetkilendirme verildi
    final response = await _dio.post('posts',
        data: postModel // datada isteğin gönderileceği yerdir
        );

    if (response.statusCode == HttpStatus.created) {
      // gönderme olacağından created dedik

    }
  }






    List<PostModelService>?
      _items; // ilk başta PostModelService türeyen liste kurduk null gelebilir dedik buraya özgü olması için private oluşturduk

  //? verileri almak için method kuruyoruz
  Future<void> fetchPostItems() async {
    /*
    Dio().get('https://jsonplaceholder.typicode.com/posts'); ile kurdum ama veri çekileceğinden 
    await kullandım bu sayede veriler geldikten sonra işleme devam edecek bu işlem async işlemdir
    daha kullanışlı olması içinde response adını verdiğim değişkene aktardım 
    */
    final response =
        await Dio().get('https://jsonplaceholder.typicode.com/posts');
        //? her seferinde dio oluşturmak doğru değil init state de değişkene ata ama onunda dışında kontrol etmek için yöntem var anlaman için bu sayfaya karışmıyorum diğer sayfalarda dikkat edip yazacağım
        

    // yetki verildiyse kontrole geçelim :)
    if (response.statusCode == HttpStatus.ok) {
      // kodlar tamam ise yani veri doğru geldiyse şartı tamamdır kapsama diğer yolu yaz
      final _datas = response.data; // veriler değişkene aktarıldı
      //sırada ki adım için yeni koşul :))
      if (_datas is List) {
          _items = _datas
              .map((e) => PostModelService.fromJson((e)))
              .toList(); // yeni obje üretmek için listeler maplenir yeni listelerin kapısı açılır
      }
    }
  
  }





}
