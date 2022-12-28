import 'package:flutter/material.dart';

import '../viewModel/regResViewModel.dart';

class RegResView extends StatefulWidget {
  const RegResView({super.key});

  @override
  State<RegResView> createState() => _RegResViewState();
}

// state gerekli servis işlemi için kod kalabalığı olmaması için model kısmına extends State<RegResView>  entegre ediyoruz oranın class ismini de buraya edeceğiz ki haberleşme sağlansın
class _RegResViewState extends RegResViewModel {
  // görünüm burada , stateler RegResViewModel de yönetilecek
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          controllerLoading.isLoading
                  .value // RegResViewModel e entegre etmiştik onuda buraya edince özellikler aktarıldı
              ? const CircularProgressIndicator()
              : const SizedBox.shrink()
        ],
      ),
      body: ListView.builder(
        itemCount: resource.length,
        itemBuilder: (BuildContext context, int index) {
          return Card(child: Text(resource[index].name ?? 'is not data'));
        },
      ),
    );
  }
}
