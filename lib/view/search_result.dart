import 'package:booking_app/model/voiture.dart';
import 'package:booking_app/view/booking.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

   List <Voiture>voitures= [];
   var indexx=-1 ;
class Search_Result extends StatefulWidget {
  var location,picktime,droptime;
  Search_Result({this.location,this.picktime,this.droptime, Key? key }) : super(key: key);

  @override
  State<Search_Result> createState() => _Search_ResultState();
}

class _Search_ResultState extends State<Search_Result> {
 

  @override
  Widget build(BuildContext context) {
   
  
    return Scaffold(
      appBar: AppBar(title: const Center(child:Text("Search Results"))),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: ListView.builder(
          itemCount: 100,
          itemBuilder: (BuildContext context, int index) { 
            
  if( voitures[index].location.contains(widget.location) ||voitures[index].picktime.contains(widget.picktime)||voitures[index].droptime.contains(widget.droptime)) {
    return GestureDetector(
            onTap: ()async{
                             Widget cancelButton = FlatButton(
    child: Text("Cancel"),
    onPressed:  () {Navigator.pop(context);},
  );
  Widget continueButton = FlatButton(
    child: Text("Continue"),
    onPressed:  () {  
      indexx=index ;
       Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Booking(index:index,)));},
  );
               AlertDialog alert = AlertDialog(
    title: Text("Booking cars"),
    content: Text("Would you like to continue booking cars ?"),
    actions: [
      cancelButton,
      continueButton,
    ],
  );await showDialog(
    context: context,
    builder: (BuildContext context) {
      return alert;
    },
  );
           ;},
            child: Container(
              height: 325,
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
              Text(voitures[index].nom,style: TextStyle(fontWeight: FontWeight.w400,color:Colors.black.withOpacity(0.5),fontSize: 20),)
              ]),
                  Image(
                        image: AssetImage(voitures[index].entreprise_de_creation),height: 80,width: 80,),
                      ],),
                      Image(
                        image: AssetImage(voitures[index].images),height: 150,width: 150,),
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
                              Text(voitures[index].prix,style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30),),
                             Text("            Total")
                            ],
                          ),
                          
                        
                        ],
                      )
                    ],
                  ),
                )),
            ),
          );
  } else {
    return Container();
  }
           },
        ),
        
      )
      
      
    );
  }
}