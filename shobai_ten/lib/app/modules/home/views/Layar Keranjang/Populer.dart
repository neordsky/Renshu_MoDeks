import 'package:flutter/material.dart';

class PagePopuler extends StatefulWidget {
  String Naba;
  PagePopuler(this.Naba);

  @override
  State<PagePopuler> createState() => _PagePopulerState();
}

class _PagePopulerState extends State<PagePopuler> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height * 0.9,
        color: Colors.blueAccent,
        child: GridView.builder(
            itemCount: 20,
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2, mainAxisSpacing: 2, crossAxisSpacing: 2),
            itemBuilder: (context, index) {
              return OutlinedButton(
                  onPressed: () {},
                  child: GridTile(
                    child: Text("Nothing Data"),
                    footer: GridTileBar(
                      backgroundColor: Colors.purpleAccent,
                    ),
                  ));
            }),
      ),
    );
  }
}
