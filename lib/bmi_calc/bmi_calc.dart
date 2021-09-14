import 'dart:ui';

import 'package:flutter/material.dart';
class BmiCalc extends StatefulWidget {
  @override
  _BmiCalcState createState() => _BmiCalcState();
}

class _BmiCalcState extends State<BmiCalc> {
  var heightcontroller = TextEditingController();
  var weightcontroller = TextEditingController();
  double result = 0.0;
  String w = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      backgroundColor: Colors.black87,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('BMI Calculator', style: TextStyle(color: Colors.yellow),),
                Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(child: TextField(
                      style: TextStyle(color: Colors.white, fontSize: 25),

                      decoration: InputDecoration(
                        hintText: 'Height', hintStyle: TextStyle(fontSize: 25,
                        color: Colors.white,),
                        border: InputBorder.none,


                      ), controller: heightcontroller,)),

                    Expanded(child: TextField(
                      style: TextStyle(color: Colors.white, fontSize: 25),
                      decoration: InputDecoration(
                          hintText: 'Weight', hintStyle: TextStyle(fontSize: 25,
                          color: Colors.white),
                          border: InputBorder.none
                      ),
                      controller: weightcontroller,)),

                  ],),
                SizedBox(height: 20,),
                InkWell(onTap: () {
                  setState(() {
                    result = double.parse(weightcontroller.text) / (double
                        .parse(heightcontroller.text) * double.parse(
                        heightcontroller.text));
                  });
                  calculate();
                },
                    child: Text(
                      'Calculate', style: TextStyle(color: Colors.yellow),)),
                SizedBox(height: 20,),
                Text('$result',
                  style: TextStyle(color: Colors.yellow, fontSize: 25),),
                SizedBox(height: 20,),
                Text(w, style: TextStyle(color: Colors.yellow, fontSize: 25),),

                SizedBox(height: MediaQuery
                    .of(context)
                    .size
                    .width * 0.1),

                Align(alignment: Alignment.centerRight,
                    child: Container(width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.4,
                      height: 25,
                      decoration: BoxDecoration(color: Colors.yellow,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomLeft: Radius.circular(15))),)),
                SizedBox(height: MediaQuery
                    .of(context)
                    .size
                    .width * 0.05,),
                Align(alignment: Alignment.centerRight,
                    child: Container(width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.27,
                      height: 25,
                      decoration: BoxDecoration(color: Colors.yellow,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomLeft: Radius.circular(15))),)),
                SizedBox(height: MediaQuery
                    .of(context)
                    .size
                    .width * 0.05,),
                Align(alignment: Alignment.centerRight,
                    child: Container(width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.17,
                      height: 25,
                      decoration: BoxDecoration(color: Colors.yellow,
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(15),
                              bottomLeft: Radius.circular(15))),)),
                SizedBox(height: MediaQuery
                    .of(context)
                    .size
                    .width * 0.05,),
                Align(alignment: Alignment.centerLeft,
                    child: Container(width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.12,
                      height: 25,
                      decoration: BoxDecoration(color: Colors.yellow,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              bottomRight: Radius.circular(15))),)),
                SizedBox(height: MediaQuery
                    .of(context)
                    .size
                    .width * 0.05,),
                Align(alignment: Alignment.centerLeft,
                    child: Container(width: MediaQuery
                        .of(context)
                        .size
                        .width * 0.36,
                      height: 25,
                      decoration: BoxDecoration(color: Colors.yellow,
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(15),
                              bottomRight: Radius.circular(15))),))


              ],),
          ),
        ),
      ),

    );
  }

  void calculate() {
    if (result > 20&&result<=25) {
      setState(() {
        w = 'you have normal weight';
      });
    } else if (result > 25) {
      setState(() {
        w = 'you are over weight';
      });
    } else {
      w = "You\'re under weight";
    }
  }
}
