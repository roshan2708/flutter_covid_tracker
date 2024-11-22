import 'dart:async';
import 'dart:math';

import 'package:covidtracker/activities/home.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 3), (){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => HomePage()));
    });
  }
  @override
  
  
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: SweepGradient(
                colors: [
                  Color.fromRGBO(166, 166, 166, 0.93),
                  Color.fromRGBO(250, 250, 250, 1),
                //   Colors.green,
                //   Colors.blue,
                //   Colors.red, // Closing the loop
                ],
                 startAngle: pi / 4, // 45 degrees (top-right)
                endAngle: 2 * pi, // 360 degrees (full circle)
        ),),
        
        child: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
               height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage("images/worldwide.png"), fit: BoxFit.fill)
                    ),

              ),
              SizedBox(width:10 ,),
            Text("COVID-19" , style: TextStyle(fontWeight: FontWeight.bold , fontSize: 48),)
          ],),
        ),
      ),

    );
  }
}