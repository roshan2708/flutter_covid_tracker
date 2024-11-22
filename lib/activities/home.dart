import 'dart:ffi';

import 'package:covidtracker/activities/CountryPage.dart';
import 'package:covidtracker/model/worldStatsModel.dart';
import 'package:covidtracker/services/worldStatServices.dart';
import 'package:flutter/material.dart';
import 'package:pie_chart/pie_chart.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();

}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{
  late final AnimationController _controller = AnimationController(
    duration: const Duration(milliseconds: 3000),
    vsync: this)..repeat();
@override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

  @override
  //background: linear-gradient(180deg, #6F6F6F 0%, #C3EDF7 100%);



  

  Widget build(BuildContext context) {
   StatsSetvices statsSetvices = StatsSetvices(); 
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [const Color.fromARGB(255, 111, 111, 111), Color.fromRGBO(195, 237, 246, 1)], 
            begin: Alignment.topCenter,           
            end: Alignment.bottomCenter,
        ),),
        child: SafeArea(child: Column(children: [
          SizedBox(height: 25,),
          FutureBuilder(future: statsSetvices.fetchWorldStatsServices(), 
          builder: (context ,AsyncSnapshot<WorldStats> snapshot){
            if(!snapshot.hasData){
              return Center(child: CircularProgressIndicator());
            }
            else {
              return  Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30 , vertical: 20),
                child: PieChart(dataMap: {
                  "Total" : double.parse(snapshot.data!.cases!.toString()),
                  "Recovered" :double.parse(snapshot.data!.recovered!.toString()),
                  "Hello" : double.parse(snapshot.data!.tests!.toString()),
                },
                chartType: ChartType.ring,
                legendOptions: LegendOptions(legendPosition: LegendPosition.left),
                ),
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.1,),
              Container(child: Column(
                        children: [
              ReusableContainer(context , "Total Cases" , snapshot.data!.cases!.toString() , "images/people.png"),
              ReusableContainer(context , "Recovered" , snapshot.data!.recovered!.toString(), "images/recovered.png"),
              ReusableContainer(context , "Active" , snapshot.data!.active!.toString() , "images/add-friend.png"),
              ReusableContainer(context , "Tests Done" , snapshot.data!.tests!.toString(), "images/tests-2.png"),
              
              
                        ],
                      ),)
            ],
          );
          
            }
        
          }),
          Spacer(),
         
         GestureDetector(
          onTap: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => CountryList()));
          } ,
           child: Padding(
             padding: const EdgeInsets.symmetric(horizontal: 105 , vertical: 10),
             child: Container(
              height: MediaQuery.of(context).size.height * 0.086,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                color: Colors.grey[350],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(height: 40,
                    width: 40,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage("images/worldwide.png"), fit: BoxFit.fill)
                    ),
                    
                  ), 
                  SizedBox(width: 10,),
                  Text("Country Info" , style: TextStyle( fontSize: 18),),
                ],
              ),
             ),
           ),
         )
        ],)),
      ),

    );
  }


 ReusableContainer(BuildContext context , String text , String number ,String imageLocation) {
    return Padding(
      padding: const EdgeInsets.only(left: 35,right: 35 , top: 12),
      child: Container(
              height: MediaQuery.of(context).size.height*0.085,
              width: double.infinity,
              
              decoration: BoxDecoration(
                color: Colors.grey[350],
                borderRadius: BorderRadius.circular(25),
                
                
              ),
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 55,
                    width: 55,
                    decoration: BoxDecoration(
                      image: DecorationImage(image: AssetImage(imageLocation), fit: BoxFit.fill)
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 17 , horizontal: 10),
                  child: Container(child: Column(children: [
                    
                    Text(text , style: TextStyle(fontWeight: FontWeight.bold),),
                    Text(number , style: TextStyle(fontWeight: FontWeight.bold),)
                  
                  ],),),
                )
              ],)
    ));
  }
}