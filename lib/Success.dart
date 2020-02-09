import 'package:flutter/material.dart';
class Success extends StatefulWidget {
 String text;
 Success(String text){
   this.text=text;
 }
  @override
  _SuccessState createState() => _SuccessState();
}

class _SuccessState extends State<Success> {
  double discountPrice;
 

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Center(child: Container(height:300,width:300,child: Image.asset("assets/success.gif"))),
            Center(child: Text("${widget.text}",
            style: TextStyle(fontSize: 40,fontFamily: "Nixie One"))),
          ],
        ));
  }
}