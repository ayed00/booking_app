
import 'dart:async';

import 'package:booking_app/view/home.dart';
import 'package:booking_app/view/search_result.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
class Booking extends StatefulWidget {
 var  index ;
  Booking({this.index, Key? key }) : super(key: key);

  @override
  State<Booking> createState() => _BookingState();
}

   final CameraPosition _kGooglePlex = CameraPosition(
    target: LatLng(37.42796133580664, -122.085749655962),
    zoom: 14.4746,
  );

  final CameraPosition _kLake = CameraPosition(
      bearing: 192.8334901395799,
      target: LatLng(37.43296265331129, -122.08832357078792),
      tilt: 59.440717697143555,
      zoom: 19.151926040649414);
class _BookingState extends State<Booking> {
  Completer<GoogleMapController> _controller = Completer();
  @override
  Widget build(BuildContext context) {
     if(widget.index!=-1) {
       return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>Home(),)),
          icon: Icon(Icons.home)),
        title: Center(child: Title(color: Colors.white,
        child: Text("Booking Confirmed"),)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 80,
                width: double.infinity,
                
                child: Card(child: Column(children: [
           Text('Booking Reference'),SizedBox(height: 5,),
           Text('US64646166',style: TextStyle(fontWeight: FontWeight.w900,color:Colors.black,fontSize: 25),),
              ],)),),
              Container(
                        height: 300,
                        child: Card(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                           Column(
                             children: [
                        Text("Compact Car",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                        Text(voitures[widget.index].nom,style: TextStyle(fontWeight: FontWeight.w400,color:Colors.black.withOpacity(0.5),fontSize: 20),)
                        ]),
                            Image(
                                  image: AssetImage(voitures[widget.index].entreprise_de_creation),height: 60,width: 80,),
                                ],),
                                Image(
                                  image: AssetImage(voitures[widget.index].images),height: 150,width: 150,),
                                Container(color: Colors.grey,
                                height: 2,width: double.infinity,),
                                SizedBox(height: 10,),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(children: [
                                      Icon(Icons.shopping_bag_outlined,size: 40,),SizedBox(width: 4,) ,Text("1"),SizedBox(width: 4,) ,
                                       Icon(Icons.person_outline_rounded,size: 40),SizedBox(width: 4,) , Text("5"),SizedBox(width: 4,) ,
                                        Icon(Icons.tune,size: 40),SizedBox(width: 4,) ,Text("Automatic"),
                                    ],),
                                    Column(
                                      children: [
                                        Text(voitures[widget.index].prix,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                                       Text("            Total")
                                      ],
                                    ),
                                    
                                  
                                  ],
                                )
                              ],
                            ),
                          )),
                      ),
                        Container(
                height: 200,
                width: double.infinity,
                
                child: Card(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
           Text('Pickup & Return',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22)),SizedBox(height: 5,),
          SizedBox(height: 20,),
           Text('Pickup',style: TextStyle(fontWeight: FontWeight.w400,color:Colors.black,fontSize: 18),),
            Text('07 apr 2020 - ${voitures[widget.index].picktime}',style: TextStyle(fontWeight: FontWeight.w400,color:Colors.black.withOpacity(0.5),fontSize: 18),),
           SizedBox(height: 30,),
            Text('Return',style: TextStyle(fontWeight: FontWeight.w400,color:Colors.black,fontSize: 18),),
             Text('10 apr 2020 - ${voitures[widget.index].droptime}',style: TextStyle(fontWeight: FontWeight.w400,color:Colors.black.withOpacity(0.5),fontSize: 18),),
              ],),
                )),),
                       Container(
                height: 200,
                width: double.infinity,
                
                child: Card(child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
           Text('Supplier location',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 22)),SizedBox(height: 5,),
             
             Container(
               height: 140,width: 400,
               child: GoogleMap(
        mapType: MapType.normal,
        initialCameraPosition: _kGooglePlex,
        onMapCreated: (GoogleMapController controller) {
         _controller.complete(controller);
        },
      ),
             ),
              ],),
                )),),
            ],
          ),
        ),
      ),
    );
     } else return Scaffold(appBar: AppBar(),body: Center(child: Text("aucun booking")),);
  }
}