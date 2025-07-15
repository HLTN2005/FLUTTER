import 'package:flutter/material.dart';



class MyApp extends StatelessWidget{
  bool test;
  MyApp(this.test);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return test ? const CircularProgressIndicator() : Text("State");
  }
}//widget khong co gia dien trang thai

class MyApp2 extends StatefulWidget{

  bool loading;
  MyApp2(this.loading);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MyApp2_State();
  }

}
class MyApp2_State extends State<MyApp2>{
  late bool check;
  @override
  void initState() {
    check =widget.loading;
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return check ? CircularProgressIndicator() : FloatingActionButton(onPressed: onClick);
  }
  void onClick(){
    setState(() {
      check = true;
    });
  }
}
void main() {
  // runApp(MaterialApp(
  //   home: SafeArea(
  //       child: Scaffold(
  //         appBar: AppBar(
  //           backgroundColor: Colors.red,
  //           title: Text(
  //               "App cua Nhan"),
  //         ),
  //         body: Center(
  //           child: Text(
  //               "Thien ngu lol"),
  //         ),
  //       ))
  // ));



  runApp( MaterialApp(
    home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.red,
            title: Text ("My App"),

          ),
          body: Center(
            child: MyApp2(false),
          ),
        )
    ),
    debugShowCheckedModeBanner: false,
  )

  );


}

