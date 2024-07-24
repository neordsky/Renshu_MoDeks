import 'package:flutter/material.dart';

class ClockFun extends StatelessWidget {
  const ClockFun({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: Stream.periodic(Duration(seconds: 1)),
      builder: (context, snapshot) {
        return Text(_getcurrent());
      },
    );
  }

  String _getcurrent() {
    var ima = DateTime.now();
    return '${ima.hour.toString().padLeft(2, '0')} : ${ima.minute.toString().padLeft(2, '0')} : ${ima.second.toString().padLeft(2, '0')}';
  }
}
