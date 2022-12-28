//https://medium.flutterdevs.com/explore-generics-in-dart-flutter-6dd62b6f3ed4
// https://dart.academy/generics-in-dart-and-flutter/
// https://api.dart.dev/stable/1.10.1/dart-core/List/fold.html


// T genericler kapsayıp sınırlandırmayı sağlar 
class UserManagement<T extends AdminUser> {
  final T admin;

  UserManagement(this.admin);
  void sayName(GenericUser user) {
    print(user.name);
  }

  int calculateMoney(List<GenericUser> users) {
    int sum = 0;
    for (var item in users) {
      sum += item.money;
    }
    int initialValue = admin.role == 1 ? admin.money : 0; // ifsiz sorgumuz oldu 

    final sumMoney =
        users.map((e) => e.money).fold<int>(initialValue, (previousValue, element) => previousValue + element);
// for yerine fold kullan
    final _monney = users.fold<int>(initialValue, (previousValue, element) => previousValue + element.money);
    return _monney;
  }

  Iterable<VBModel<R>>? showNames<R>(List<GenericUser> users) {
    if (R == String) {
      final names = users.map((e) => VBModel<R>(e.name.split('').toList().cast<R>()));
      return names;
    }
    return null;
  }
}

class VBModel<T> {
  final String name = 'vb';
  final List<T> items;

  VBModel(this.items);
}

class GenericUser extends Equatable {
  final String name;
  final String id;
  final int money;

   GenericUser(this.name, this.id, this.money);

  bool findUserName(String name) {
    return this.name == name;
  }

  @override
  String toString() => 'GenericUser(name: $name, id: $id, money: $money)';

  @override
  // TODO: implement props
  List<Object?> get props => [id];
}

class Equatable {
  // galiba  test clasör ismiydi tekrar bak buu kısma 
}

class AdminUser extends GenericUser {
  final int role;
   AdminUser(String name, String id, int money, this.role) : super(name, id, money);
}










/* 
T ekranaBastir<T>(T nesne) {
  return nesne;
}
  böyle bir fonksiyonun var. ekrana ya birinin yaşını (int) basacaksın, ya birinin bakiyesini (double) basacaksın yada mesela Post Modelin var name (String) özelliğini basacaksın.
T gördüğün yerlere hangi tipte değer basacaksan onu yazıyorsun. Örneğin;
final x = int ekranaBastir<int>(30);
final x = String ekranaBastir<String>('Merhaba Jupiter!');
final x = double ekranaBastir<double>(52.78);
final x = PostModel ekranaBastir<PostModel>(PostModel.name);
inspect(x);


*/