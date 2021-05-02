import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'pages/onBoarding.dart';
import 'pages/starterPage.dart';
import 'pages/starterPage.dart';
void main() async {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Arabi21',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: LandingPage(),
    );
  }
}
class LandingPage extends StatelessWidget {
 final Future<FirebaseApp> _initialize=Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future:_initialize,
      builder:(context,snapshot){
       if (snapshot.hasError) {
          return Scaffold(
            body:Center(
              child:Text("Error ${snapshot.error}")
            ),
          );
        }
        if (snapshot.connectionState == ConnectionState.done) {
          return StarterPage();
        }
        return Scaffold(
            body:Center(
              child:Text("Connecting to the App..."),
            ),
          );
      }
    );
  }
}
