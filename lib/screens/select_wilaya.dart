import 'package:covid_app/consts.dart';
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
  var  wilaya ; 
  var  wilayas = WILAYAS;

  @override
  void initState() { 
    wilaya = widget.wilaya;
    super.initState();
  }


  void _filterSearch(String query){
    if(query.isNotEmpty){ 
      print("entered");
      List<Wilaya> filteredData = List<Wilaya>();
      WILAYAS.forEach((element) {
        if(element.name.toLowerCase().contains(query.toLowerCase())){
          filteredData.add(element);
        }
      });
      print(filteredData.toString());
      print("State =====");
      this.setState(() {
        wilayas.clear();
        print(wilayas);
        wilayas.addAll(filteredData);
        print(wilayas);
      });
      print(wilayas);
      return ; 
    }else{
      setState(() {
        wilayas.clear();
        wilayas.addAll(WILAYAS);
      });  
    }
  }

  Widget _wilayaWidget(Wilaya wilaya, bool done ){
    return GestureDetector(onTap: (){
      setState(() {
        this.wilaya = wilaya;
      });
    },
      child: Container(
              width: double.infinity,
              
              child:Material(
                color: Colors.white,
                elevation: 1,
                shadowColor: Colors.grey.shade200,
                child:Container(
                    padding: EdgeInsets.symmetric(vertical: 16),
                    child:  Row(
                      children: <Widget>[
                        SizedBox(width: 50,),
                        Text(wilaya.number.toString(), style: Theme.of(context).textTheme.headline6.apply(color: Colors.red),),
                        SizedBox(width: 10,),
                        Text(wilaya.name, style: Theme.of(context).textTheme.subtitle1,),
                        Expanded(child: Container(
                          child: Icon(Icons.done, color:done ? Colors.red: Colors.transparent,),
                          padding: EdgeInsets.only(right: 30),
                          alignment: Alignment.topRight,
                        )
                          
                        )
                      ],
                    )
                  ) ,
                )
              ),
    );
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
                            _filterSearch(value);
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
            wilaya!=null ?
            Container(
              child: Column(children: <Widget>[
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 20),
                  alignment: Alignment.topLeft,
                  child: Text("Current Location",style: Theme.of(context).textTheme.bodyText1.apply(color: Colors.grey),),
                ),
                _wilayaWidget(wilaya, true)
              ],)
            ):SizedBox(height: 20,),
            Container(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                  alignment: Alignment.topLeft,
                  child: Text("List",style: Theme.of(context).textTheme.bodyText1.apply(color: Colors.grey),),
            ),
            Expanded(child: ListView.builder(
                itemCount: wilayas.length,
                itemBuilder: (context, index){
                  return _wilayaWidget(wilayas[index], false);
                },
              )
            )
            

            
            
            
          ],)

      
        ),
      )
      );
    
  }
}