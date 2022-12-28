import 'package:flutter/material.dart';

class FormLearnView extends StatefulWidget {
  const FormLearnView({Key? key}) : super(key: key);

  @override
  State<FormLearnView> createState() => _FormLearnViewState();
}

class _FormLearnViewState extends State<FormLearnView> {
  final GlobalKey<FormState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Form( // birden fazla olursa key de kullanılacaksa mutlaka olur 
        key: _key, // nerede kontrol gerekir orada key yazılır 
        autovalidateMode: AutovalidateMode.always,
        onChanged: () {},
        child: Column(
          children: [
            TextFormField(validator: FormFieldValidator().isNotEmpty), // temiz olması için validasyon dışarıda classdan geliyor 
            TextFormField(validator: FormFieldValidator().isNotEmpty),
            DropdownButtonFormField<String>( // dropdownmenu 
                validator: FormFieldValidator().isNotEmpty, // ilk durum 
                items: const [
                  DropdownMenuItem(value: 'v', child: Text('a')),
                  DropdownMenuItem(value: 'v2', child: Text('a1')),
                  DropdownMenuItem(value: 'v3', child: Text('a2')),
                ],
                onChanged: (value) {}),
            CheckboxListTile(value: true, onChanged: (value) {}),
            ElevatedButton(
                onPressed: () {
                  if (_key.currentState?.validate() ?? false) { // mevcut durum validate ise tamamdır değilse  false atar 
                    //  print('okey');
                  }
                },
                child: const Text('Save'))
          ],
        ),
      ),
    );
  }
}

// validasyon için 
class FormFieldValidator {
  String? isNotEmpty(String? data) {
    return (data?.isNotEmpty ?? false) ? null : ValidatorMessage._notEmpty;
  }
}

// error mesajımızın classı 
class ValidatorMessage {
  static const String _notEmpty = 'Bos gecielemz';
}
