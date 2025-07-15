import 'package:flutter/material.dart';

void main() {
  runApp(stataless());
}

class stataless extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(backgroundColor: Colors.red, title: Text("My App")),
          body: Center(child: stateful(false)),
        ),
      ),
    );
  }
}

class stateful extends StatefulWidget {
  bool check;

  stateful(this.check);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return mystate();
  }
}

class mystate extends State<stateful> {
  late bool test;

  @override
  void initState() {
    // TODO: implement initState
    test = widget.check;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    if (test == true) {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Card(
            color: Colors.orange,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "CHUC MUNG BAN DA THANH CONG",
                style: TextStyle(
                  fontWeight: FontWeight.w600, //do dam nhat
                  fontFamily: "Times new Roman", // kieu chu
                  wordSpacing: 10, // k/c giua cac tu
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
          SizedBox(height: 40),
          Card(
            color: Colors.orange,
            child: Padding(
              padding: EdgeInsets.all(20),
              child: Text(
                "HAY TIEP TUC",
                style: TextStyle(
                  fontWeight: FontWeight.w600, //do dam nhat
                  fontFamily: "Times New Roman", // kieu chu
                  wordSpacing: 10, // k/c giua cac tu
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ),
        ],
      );
    } else {
    return Column(
    mainAxisAlignment: MainAxisAlignment.center,

    children: [
    Card(
    color: Colors.blue,
    child: Padding(
    padding: EdgeInsets.all(20),
    child: Text(
    "Moi ban nhan nut",
    textAlign: TextAlign.justify, //Can chinh
    style: TextStyle(
    fontWeight: FontWeight.w600, //do dam nhat
    fontFamily: "Times new Roman", // kieu chu
    wordSpacing: 10, // k/c giua cac tu
    decoration: TextDecoration.underline,
    ),
    ),
    ),
    ),
    SizedBox(height: 20),
    FloatingActionButton(
    onPressed: onClick,
    backgroundColor: Colors.orange,
    child: Icon(Icons.play_arrow),
    ),
    ],
    );
    }
  }

  void onClick() {
    setState(() {
      test = true;
    });
  }
}
