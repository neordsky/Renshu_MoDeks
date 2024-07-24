import 'package:flutter/material.dart';
import 'package:shobai_ten/Transaksi/TransaksiLanjut.dart';

class Confir extends StatefulWidget {
  String Kode;
  String Naba;
  String Img;
  int Haba;
  int juba;

  Confir(this.Kode, this.Naba, this.Img, this.Haba, this.juba);

  @override
  State<Confir> createState() => _ConfirState();
}

class _ConfirState extends State<Confir> {
  int quan = 1;
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(20),
      child: Container(
        margin: EdgeInsets.only(
          top: MediaQuery.of(context).size.height * 0.4,
        ),
        height: MediaQuery.of(context).size.height * 0.8,
        width: MediaQuery.of(context).size.width * 0.4,
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(offset: Offset(1, 1), blurRadius: 1, spreadRadius: 1)
        ], color: Colors.white),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                OutlinedButton.icon(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    icon: Icon(Icons.close),
                    label: Text(""))
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  margin: EdgeInsets.only(
                      bottom: MediaQuery.of(context).size.height * 0.2),
                  color: Colors.grey,
                  height: MediaQuery.of(context).size.height * 0.15,
                  width: MediaQuery.of(context).size.width * 0.3,
                  child: Image.network(
                    "http://10.0.2.2:2000/image/${widget.Img}",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.4,
                width: MediaQuery.of(context).size.width * 0.5,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.Naba,
                        style: TextStyle(fontSize: 15, color: Colors.black),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        widget.Kode,
                        style: TextStyle(fontSize: 10, color: Colors.cyan),
                      ),
                    ),
                    Text(
                      "Rp." + widget.Haba.toString(),
                      style: TextStyle(fontSize: 18, color: Colors.deepPurple),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            quan.toString() + "x",
                            style: TextStyle(fontSize: 14, color: Colors.black),
                          )
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.05,
                          width: MediaQuery.of(context).size.width * 0.5,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              OutlinedButton.icon(
                                  label: Text(""),
                                  onPressed: () {
                                    setState(() {
                                      if (quan == 1) {
                                      } else {
                                        quan -= 1;
                                        print(quan.toString());
                                      }
                                    });
                                  },
                                  icon: Icon(Icons.minimize)),
                              Text(
                                quan.toString(),
                                style: TextStyle(
                                    fontSize: 15, color: Colors.black),
                              ),
                              OutlinedButton.icon(
                                  label: Text(""),
                                  onPressed: () {
                                    setState(() {
                                      quan += 1;
                                      print(quan.toString());
                                    });
                                  },
                                  icon: Icon(Icons.add))
                            ],
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              )
            ],
          ),
          Container(
            height: MediaQuery.of(context).size.height * 0.05,
            width: MediaQuery.of(context).size.width * 1,
            child: ElevatedButton(
                onPressed: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (context) {
                    return TranLan(widget.Naba, widget.Kode, widget.Haba,
                        widget.juba, widget.Img, quan);
                  }));
                },
                child: Text("Checkout")),
          )
        ]),
      ),
    );
  }
}
