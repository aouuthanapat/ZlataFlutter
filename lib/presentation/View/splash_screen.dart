import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter_api/presentation/View/home_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';

const Color myColor = Color(0xFF800000);
const Color textColor = Color(0xFF7D7D7D);

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
    Timer (const Duration(seconds: 2), () {
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const HomeScreen()));

    });
  }
  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    return Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('images/loading.jpg',
              fit: BoxFit.cover,
              height: height * .5,
            ),
            SizedBox(height: height * 0.04,),
            Text('TOP HEADLINES', style: GoogleFonts.anton(letterSpacing: .6, fontSize: 30, color: textColor),),
            SizedBox(height: height * 0.04,),
            const SpinKitChasingDots(
              color: textColor,
              size: 40,
            )
          ],
        )
    );
  }
}
