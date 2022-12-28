import 'package:flutter/material.dart';
import 'state_manage202.dart';

class StateManageVierw202 extends StatefulWidget {
  const StateManageVierw202({super.key});

  @override
  _StateManageVierw202State createState() => _StateManageVierw202State();
}

class _StateManageVierw202State extends StateManage202 { //  extends StateManage202 ile stateleri içeren özellikleri buraya da dahil ettik 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          ElevatedButton(
              onPressed: () {
                isVisible();
              },
              child: Text(_press) // String get _press => "Press";
              ), 

          isCheck
              ? const CircularProgressIndicator.adaptive()
              : const SizedBox.shrink()
        ],
      ),
    );
  }
}

String get _press => "Press";
