import 'package:booking_app/view/home.dart';
import 'package:booking_app/view/search_result.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'model/voiture.dart';

void main() {
    Voiture v1=Voiture("Dooge Neon  or simiar","assets/images/2018-Nissan-Versa-White_o.png","\$85,4","assets/images/payless.png","tunis") ;
   Voiture v2=Voiture("tesla","assets/images/voiture2.jpg","\$199,4","assets/images/tesla.jpg","nabeul") ;
    Voiture v3=Voiture("bmw","assets/images/voiture3.jpg","\$199,4","assets/images/thrifty.jpg","sousse") ;

    for(var i=0;i<34;i++) {
      voitures.addAll(<Voiture>[v1,v2,v3]);
    }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Cars',
      debugShowCheckedModeBanner: false,
      

      theme: ThemeData(
        
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

