import 'package:covidtracker/activities/detailsPage.dart';
import 'package:covidtracker/services/worldStatServices.dart';
import 'package:flutter/material.dart';

class CountryList extends StatefulWidget {
  const CountryList({super.key});

  @override
  State<CountryList> createState() => _CountryListState();
}

class _CountryListState extends State<CountryList> {

  TextEditingController searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    StatsSetvices statsSetvices = StatsSetvices();
    return Scaffold(
      appBar: AppBar(elevation: 0,
      title: Text("Country Info" , ),centerTitle: true,
      backgroundColor: Colors.grey,
      ),
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [const Color.fromARGB(255, 111, 111, 111), Color.fromRGBO(195, 237, 246, 1)], 
            begin: Alignment.topCenter,           
            end: Alignment.bottomCenter,
        ),),
        child: SafeArea(child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                controller: searchController,
                onChanged: (value){
                  setState(() {
                    
                  });
                },
                decoration: InputDecoration(
                  filled: true,
                  fillColor: Colors.grey,
                  contentPadding: EdgeInsets.symmetric(horizontal: 20),
                  hintText: "Search with the country name",
                  border: OutlineInputBorder(
                    
                    borderRadius: BorderRadius.circular(12)
                  )
                ),
              ),
            ),
            Expanded(child: FutureBuilder(future: statsSetvices.fetchCountryList(), 
            builder: (context ,AsyncSnapshot<List<dynamic>> snapshot ){
              if(!snapshot.hasData){
                return Text("Loading");
              }
              else{
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context , index){
                    String name =snapshot.data![index]["country"] ;
                    if(searchController.text.isEmpty){
                       return Column(children: [
                      ListTile(
                        title: Text(snapshot.data![index]["country"]),
                        subtitle: Text(snapshot.data![index]["updated"].toString()),
                        leading: Image(image: NetworkImage(snapshot.data![index]["countryInfo"]["flag"]),
                      height: 50,
                      width: 70,),)
            
            
                    ],);
            
            
                    }
                    else if(name.toLowerCase().contains(searchController.text.toLowerCase())) {
                       return Column(children: [
                      InkWell(
                        onTap: () {
                          Navigator.push(context,MaterialPageRoute(builder: (context) => DetailsPage(
                            image: snapshot.data![index]["countryInfo"]["flag"],
                            name: snapshot.data![index]["country"],
                            totalCases: snapshot.data![index]["cases"],
                            totalRecovered: snapshot.data![index]["recovered"],
                            totalDeaths: snapshot.data![index]["deaths"],
                            active: snapshot.data![index]["active"],
                            tests: snapshot.data![index]["tests"],
                            todayRecovered: snapshot.data![index]["todayRecovered"],
                            critical: snapshot.data![index]["critical"],
                          )));
                        },
                        child: ListTile(
                          title: Text(snapshot.data![index]["country"]),
                          subtitle: Text(snapshot.data![index]["updated"].toString()),
                          leading: Image(image: NetworkImage(snapshot.data![index]["countryInfo"]["flag"]),
                        height: 50,
                        width: 70,),),
                      )
            
            
                    ],);
            
            
                    }
                    else {
                      return Container();
            
                    }
                    
            
                });
              }
            }
            ))
          ],
        )),
      ),
    );
  }
}