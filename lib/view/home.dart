import 'package:booking_app/view/booking.dart';
import 'package:booking_app/view/search_result.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:searchfield/searchfield.dart';
import 'package:intl/intl.dart';
class Home extends StatefulWidget {
  const Home({ Key? key }) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
     late TextEditingController  picktimeController =TextEditingController();
       late TextEditingController  droptimeController =TextEditingController();
  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    
  }
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    
    picktimeController.text="10:00";
    droptimeController.text="10:00";
  }
  
DateTime date=DateTime.now();
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
  statusBarColor: Colors.blue, //or set color with: Color(0xFF0000FF)
));
    late TextEditingController  locationController =TextEditingController();
     late TextEditingController  dateController =TextEditingController();
   
  List item=[Home(),Booking(index:indexx)];


    return  Scaffold(
      
      appBar: AppBar(title: Center(child: Text("Flutter Cars"))),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text("Search for a car",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w800),),
          SizedBox(height: 10,),
          Text("We search over 1,600 suppliers te find you the \n lowest price",style: TextStyle(fontSize: 15),),
           SizedBox(height: 15,),
           Form(
             child: Column(
               children:[ 
                 SearchField(
                 controller: locationController,
                   searchInputDecoration: InputDecoration(
                   border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                   prefixIcon: Icon(Icons.location_on),
                   hintText: "Enter a pickup location"
                 ), suggestions: [

                   for ( var i=0;i<voitures.length;i++)
                   SearchFieldListItem(voitures[i].location.toString() ,)
                 ],
                 
               ),
               
                 
               
                SizedBox(height: 15,),
                TextFormField(
                 controller: dateController,
                 decoration: InputDecoration(
                   border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                   prefixIcon: IconButton(
                     onPressed: ()async{
                      
       showDatePicker(
                context: context, initialDate: date, firstDate: DateTime(2000), lastDate: DateTime(2100)
              
                ).then((value){
 if(value==null)return ;

                              
                    setState(() {
                       date=value;
                     });
                      
                } );
                     },
                     icon: Icon(Icons.date_range)),
                   hintText: "Select dates{$DateFormat.yMMMd().format(date)}"
                 ),
                 
               ),
                SizedBox(height: 15,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      width: 180,
                      child: TextFormField(
                       controller: picktimeController,
                       decoration: InputDecoration(
                         border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                         prefixIcon: Icon(Icons.access_time),
                      labelText: "pick up time",
                     //   hintText: "10",
                        
                       ),
                       
               ),
                    ),
                     Container(
                  width: 180,
                  child: TextFormField(
                   controller: droptimeController,
                   decoration: InputDecoration(
                     border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
                     prefixIcon: Icon(Icons.access_time),
                    label: Text("Drop all time"),
                  
                    
                    
                   ),
                   
               ),
                ),
                  ],
                ),
                SizedBox(height: 15,),
               
               
               ],
             ),
           ),
           Container(
             width: 500,height: 60,
           
             child: ElevatedButton(onPressed: (){

               Navigator.of(context).push(MaterialPageRoute(builder: ((context) =>Search_Result(location:locationController.text) )));
             }, child: Text("Search Cars",style: TextStyle(fontSize: 20),),
             style: ButtonStyle(shape:MaterialStateProperty.all(RoundedRectangleBorder(
               borderRadius:BorderRadius.circular(10) ))),
             )),
        ],),
      ),
     bottomNavigationBar:BottomNavigationBar(
       onTap: (value) => Navigator.of(context).push(MaterialPageRoute(builder: (context) => item[value] )) ,
       items: [
       BottomNavigationBarItem(label:"search" ,icon: Icon(Icons.search)),
        BottomNavigationBarItem(label:"booking",icon: Icon(Icons.airport_shuttle_outlined)),
     ],)
    );
  }
}