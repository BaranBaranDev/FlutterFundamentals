import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

import 'package/loading_bar.dart';

class PackageLearn extends StatelessWidget {
  const PackageLearn({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: const [
          LoadingBar( // paketleri de klasör kur sınıf da returnlet oradan çağır ki ekip çalışmasında sorun olmasın
            size: 50,
          )
        ],
      ),
    );
  }
}
