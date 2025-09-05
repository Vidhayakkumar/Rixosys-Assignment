import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:rixosys/view_model/list_data_view_model.dart';
import 'package:rixosys/views/home_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5),(){
      Navigator.push(context, MaterialPageRoute(builder: (_)=>HomePage()));
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: Text('Splash Screen',style: TextStyle(
          fontSize: 20
        ),),
      )
    );
  }
}
