import 'package:flutter/material.dart';

class LifeCycleLearn extends StatefulWidget {
  const LifeCycleLearn({super.key, required this.message});

  //? Dışarıdan değer girilecekse buraya yaz
  final String message;

  @override
  State<LifeCycleLearn> createState() => _LifeCycleLearnState();
}

class _LifeCycleLearnState extends State<LifeCycleLearn> {
  //? işlevsel  class burası yani evimiz
  String _message = ""; // ilk başta boş
  late final bool
      _isOdd; // boş bool değişken oluşturuldu ve late kullandık çünkü late ile burada değer alacağını belirttik ve alması lazım yoksa patlarız :-)

  @override
  // init state fonk başıltırıldı
  void initState() {
    // buildi tetiklemez ilk başta bir kez çalışır ve bir daha çalışmaz
    super.initState();
    _message = widget
        .message; // build başlamadan dışarıdan gelen data burada ki değişkene aktarıldı
    _isOdd = widget
        .message.length.isOdd; // sorgulayıcı bool içerik parametreye aktarıldı
    _isCurrent(); // buraya döngülü fonks yazma bunları dışarı çıkartıp fonks method adını yaz ki temiz olsun
    // initState builden önce olduğundan _isCurrent() methodu eklemeleri değiştirilmemek üzere gösterilir
  }

// canım biraz karmaşa istedi :-)
  void _isCurrent() {
    if (_isOdd) {
      // eğer tek ise
      _message += "Tek"; // değişkenin yanına Tek stringi de eklenir
    } else {
      // değilse yani çiftse
      _message += "Çift"; // değişkenin yanına Çift stringi de eklenir
    }
  }

// güncelleme istersen didUpdateWidget ve bu sayede tek sefer yazılan init verisi güncellenince değer de güncellenir
  @override
  void didUpdateWidget(covariant LifeCycleLearn oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.message != widget.message) {
      // eski data şimdi ki eşit değilse
      _message = widget.message; // gerekli aktarım ve işlemler yapılır
      _isCurrent();
      setState(
          () {}); // arayüz güncellemesi gerektirdiğinden setState kullanılır
    }
  }

// Eğer sayfadan çıkarsan dispose devreye girer
  @override
  void dispose() {
    super.dispose();
    _message = ''; // bu sayfadan çıkınca String temizlenir
    //sayfa ölürse dispose gerekli temizlikleri yapması için görevlendirebilirsin :)
  }

  @override
  void didChangeDependencies() {
    // init sonrası çalışır üst classdan tetikleyebilirsin fazla önerilmez
    // TODO: implement didChangeDependencies
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
        appBar: AppBar(
          //stateful da widget.parametre ismini diyerek dışarıdan alınan parametreyi yapıda kullanabiliriz
          title: widget.message.length
                  .isOdd // dışarıdan gelen message datasının uzunluğu tekse tek değilse ise çift yazacak
              //isOdd tek mi isEven çift mi sorusunu sorar
              ? Text(_odd) // true ise
              : Text(_even), // false ise
          // bu bir yöntem ama daha efektif olması için body kısmında göstereceğim.
        ),
        body: Center(child: _isOdd ? Text(_message) : Text(_message)));
  }
}

String get _odd => "Tektir yanına al";
String get _even => "Çifttir uzak dur";
