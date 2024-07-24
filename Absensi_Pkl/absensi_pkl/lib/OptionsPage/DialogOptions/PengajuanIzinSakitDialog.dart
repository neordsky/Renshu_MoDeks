import 'package:flutter/material.dart';

class IzinSakitDialog extends StatefulWidget {
  const IzinSakitDialog({super.key});

  @override
  State<IzinSakitDialog> createState() => _IzinSakitDialogState();
}

class _IzinSakitDialogState extends State<IzinSakitDialog> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.height * 0.2,
          horizontal: MediaQuery.of(context).size.width * 0.05),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(offset: Offset(1, 1), spreadRadius: 1, blurRadius: 1)
          ]),
      width: double.infinity,
      height: MediaQuery.of(context).size.height * 0.1,
    );
  }
}
