import 'package:flutter/material.dart';

class PageTerbaru extends StatefulWidget {
  String naba;
  PageTerbaru(this.naba);

  @override
  State<PageTerbaru> createState() => _PageTerbaruState();
}

class _PageTerbaruState extends State<PageTerbaru> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height * 0.9,
        color: Colors.yellowAccent,
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
