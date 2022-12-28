class SharedNotInitiazleException implements Exception { // aynısından istediğimizden implements kullandık 
  @override
  String toString() { // to String methodu ile hata olursa döndürülecek mesajı yazıyoruz
    return 'Your prefences has not initiazled right now';
  }
}