import 'package:flutter/material.dart';

class DetailsPage extends StatefulWidget {
  String image;
  String name;
  int totalCases , totalDeaths , totalRecovered , active , critical , todayRecovered , tests;
  DetailsPage({
    required this.image,
    required this.name,
    required this.totalCases,
    required this.totalDeaths,
    required this.totalRecovered,
    required this.active,
    required this.critical,
    required this.todayRecovered,
    required this.tests  });

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.name),centerTitle: true,backgroundColor: Colors.grey,),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [const Color.fromARGB(255, 111, 111, 111), Color.fromRGBO(195, 237, 246, 1)], 
            begin: Alignment.topCenter,           
            end: Alignment.bottomCenter,
        ),),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 80),
            child: Center(
              child: Container(
                
                height: 110,
                width: 150,
                decoration: BoxDecoration(
                 image: DecorationImage(image: NetworkImage(widget.image ) ,fit: BoxFit.fill)
                ),
              ),
            ),
          ),
          detailsContainer("Total Tests Done" , widget.tests.toString()),
          detailsContainer("Total Cases" , widget.totalCases.toString()),
          detailsContainer("Recovered" , widget.active.toString()),
          detailsContainer("Total Deaths" , widget.totalDeaths.toString()),
          detailsContainer("Critical" , widget.critical.toString()),
          
          
        ],),
      ),
    
    
    );
  }

  Widget detailsContainer(String title , String value) {
    return Padding(
        padding: const EdgeInsets.only(bottom: 12 , left: 22,right: 22),
        child: Container(
          height: MediaQuery.of(context).size.height * 0.085,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(35),
                color: Colors.grey[350],
              ),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(title),
                Spacer(),
                Text( value),
              ],
            ),
          ),
        ),
      );
  }
}