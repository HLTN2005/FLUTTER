import 'package:flutter/material.dart';

void main() {
  runApp(MyTest());
}
class MyTest extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: SafeArea(
          child:Scaffold(
            appBar: AppBar(
              title: Text("My App"),
            ),
            body: Screen(),
          ) 
      ),
    );
  }
}
class Screen extends StatefulWidget
{
  @override
  State<StatefulWidget> createState() => BuildScreen();

}
class BuildScreen extends State<Screen>
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Column(
      children: [
        TextField(

        )
      ],
    );
  }


  
}

