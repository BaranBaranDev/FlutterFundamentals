import 'package:flutter/material.dart';

import '../../product/Navigate/navigator_route.dart';

class NavigateHomeView extends StatefulWidget {
  const NavigateHomeView({Key? key}) : super(key: key);

  @override
  State<NavigateHomeView> createState() => _NavigateHomeViewState();
}

class _NavigateHomeViewState extends State<NavigateHomeView> { // with NavigatorMixin
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton.large(
          child: const Icon(Icons.abc_rounded),
          onPressed: () async {
           //! router.pushToPage(NavigateRoutes.detail, arguments: "bb");
            // await NavigatorManager.instance.pushToPage(NavigateRoutes.detail, arguments: "55");
              Navigator.of(context).pushNamed(NavigateRoutes.detail.withParaf, arguments: "123");
          }),
      appBar: AppBar(title: Text(toString())),
    );
  }
}