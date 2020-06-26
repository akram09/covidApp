import 'package:covid_app/models/wilaya.dart';
import 'package:flutter/material.dart';
class SelectWilaya extends StatefulWidget {
  final Wilaya wilaya; 
  
  SelectWilaya({Key key, this.wilaya}) : super(key: key);

  @override
  _SelectWilayaState createState() => _SelectWilayaState();
}

class _SelectWilayaState extends State<SelectWilaya> {
  TextEditingController editingController = TextEditingController();
  Wilaya wilaya ; 

  @override
  void initState() { 
    super.initState();
    wilaya = widget.wilaya;
  }



  @override
  Widget build(BuildContext context) {
    return 
    Container(color:Color.fromRGBO(242, 246, 248,1), 
     child: SafeArea(
      child:Container(color: Color.fromRGBO(242, 246, 248,1),
        child:
        Column(children: <Widget>[
            Container(child: Icon(Icons.arrow_back), 
            padding:EdgeInsets.symmetric(horizontal: 20, vertical: 30) ,
            alignment: Alignment.topLeft,),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20),
              width: double.infinity,
              child: Material(
                elevation: 1,
                color: Colors.white,
                shadowColor: Colors.grey.shade200,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                child: Padding(padding: EdgeInsets.symmetric(vertical: 4, horizontal: 14), 
                child: Row(
                  children: <Widget>[
                    Icon(Icons.search, color: Colors.grey,),
                    Expanded(child: 
                      Container(
                        padding: EdgeInsets.only(left: 6),
                        child:TextField(
                          onChanged: (value){

                          },
                          controller: editingController,
                          decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: "Search"
                          ),
                        )
                      )
                    )  
                  ],

                ),
                ),
              )
            ),
           
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20, vertical: 3),
              child: Text("Current Location"),
            )
            
          ],)

      
        ),
      )
      );
    
  }
}