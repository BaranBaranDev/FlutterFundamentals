import 'package:flutter/material.dart';

class AnimatedLearn202 extends StatefulWidget {
  const AnimatedLearn202({super.key});

  @override
  State<AnimatedLearn202> createState() => _AnimatedLearn202State();
}

class _AnimatedLearn202State extends State<AnimatedLearn202> {
  bool _isCheck = true; // başlangıçta gözükecek
  void _isVisible() {
    setState(() {
      _isCheck = !_isCheck; // tıkladıkça tersi alınacak
    });
  }

  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Scaffold(
      appBar: AppBar(
        title: _placeHolder(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => _isVisible(),
      ),
      body: Column(
        children: [
          Expanded(
            child: Text("data", style: context.textTheme().headline1

                /// bu şekilde extansion ile kullanabiliriz
                //Theme.of(context).textTheme.subtitle1,
                ),
          ),
          Expanded(child: _placeHolder()),
          Expanded(
            child: AnimatedContainer(
                color: Colors.red,
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width / 5,
                duration: _Duraction._duraction5Second),
          ) // dışarı method olarak çıkardım,
          //? AnimatedList ekleme çıkarmada efektif durur 
        ],
      ),
    );
  }

  AnimatedCrossFade _placeHolder() {
    return AnimatedCrossFade(
        // animasyonlu geçiş
        firstChild: const Placeholder(), // ilk widget
        secondChild: const SizedBox.shrink(), // bir şey gözükmeyecek
        duration: _Duraction
            ._duraction5Second, // temiz olması için static olarak class kurdum
        crossFadeState: _isCheck // true ise
            ? CrossFadeState.showFirst // ilk değilse ikinci
            : CrossFadeState.showSecond);
  }
}

// style: Theme.of(context).textTheme.subtitle1, context global olduğundan burada extension kullanabilirsin
extension BuildContextExtension on BuildContext {
  // return textThema olacak
  TextTheme textTheme() {
    return Theme.of(this)
        .textTheme; // this dedik context yerine bu şekilde context diyince bu kısım döndürülecek
  }
}

// geçiş süresi
class _Duraction {
  static const _duraction5Second = Duration(seconds: 5);
}
