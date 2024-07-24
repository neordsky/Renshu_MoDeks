import 'package:flutter/material.dart';

class KontakDialog extends StatefulWidget {
  const KontakDialog({super.key});

  @override
  State<KontakDialog> createState() => _KontakDialogState();
}

class _KontakDialogState extends State<KontakDialog> {
  List<String> KonNam = [
    "Aceng Abdul Wahid, S.Kom",
    "Instruktur : ",
    "Panitian: "
  ];
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
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.5,
              child: ListView.builder(
                  itemCount: KonNam.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: MediaQuery.of(context).size.height * 0.03,
                          horizontal: MediaQuery.of(context).size.width * 0.05),
                      child: Container(
                        color: Colors.grey.withOpacity(0.2),
                        width: double.infinity,
                        height: MediaQuery.of(context).size.height * 0.1,
                        child: Row(
                          children: [
                            Image.asset("assets/whatsappneg.png"),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.1,
                            ),
                            Column(
                              children: [Text(KonNam[index])],
                            )
                          ],
                        ),
                      ),
                    );
                  }),
            ),
            Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.05,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  OutlinedButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      child: Text("Kembali")),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.1,
                  )
                ],
              ),
            )
          ],
        ));
  }
}
