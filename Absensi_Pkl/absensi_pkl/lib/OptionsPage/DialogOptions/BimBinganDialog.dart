import 'package:flutter/material.dart';

class BimBinganDialog extends StatefulWidget {
  const BimBinganDialog({super.key});

  @override
  State<BimBinganDialog> createState() => _BimBinganDialogState();
}

class _BimBinganDialogState extends State<BimBinganDialog> {
  TextEditingController lapor = TextEditingController();
  TextEditingController solusitext = TextEditingController();
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
      child: Column(
        children: [
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.1,
              ),
              Text(
                "Hasil Bimbingan",
                style: TextStyle(fontSize: 23),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width * 0.1,
          ),
          Container(
            height: MediaQuery.of(context).size.width * 0.01,
            width: double.infinity,
            color: Colors.grey.withOpacity(0.4),
          ),
          Row(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width * 0.03,
              ),
              Text(
                "Permasalahan",
                style: TextStyle(fontSize: 19),
              ),
            ],
          ),
          Container(
              decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                        offset: Offset(1, 1), spreadRadius: 1, blurRadius: 1)
                  ]),
              height: MediaQuery.of(context).size.height * 0.1,
              width: double.infinity,
              child: TextField(
                controller: lapor,
                maxLines: null,
                textInputAction: TextInputAction.newline,
                decoration: InputDecoration(hintText: "Tulis Laporan Anda"),
              )),
        ],
      ),
    );
  }
}
