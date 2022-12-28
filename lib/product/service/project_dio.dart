import 'package:dio/dio.dart';

// baseUrli tuttuğumuz class bu sayede uzun kodlardan kaçıyoruzz
class ProjectDioMixin { // bu classı with ile entegre et ve direk service de çağır :))
  final service = Dio(BaseOptions(baseUrl:"https://reqres.in/api"));
}
