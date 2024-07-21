import 'package:flutter/material.dart';
import 'package:weather_app/API/weatherAPI.dart';

class Location extends StatefulWidget {
  const Location({super.key});



  @override
  State<Location> createState() => _LocationState();
}

class _LocationState extends State<Location> {
  List<weatherAPI> locations = [
    weatherAPI(cityname:'Sta. Maria, Pangasinan' ,lat: 15.9586767, lon: 120.6978768),
    weatherAPI(cityname:'University Valley, Quezon City' , lat: 14.6634304, lon: 121.0726136),
    weatherAPI(cityname:'Sta. Barbara, Pangasinan' , lat: 15.9704083, lon: 120.4883926),
    weatherAPI(cityname: 'Russia', lat: 55.7825600, lon: 37.2594730),
  ];

  // List<Map> locations = [
  //   {'cityname': 'Sta. Maria, Pangasinan', 'lat': 15.9586767, 'lon': 120.6978768},
  //   {'cityname': 'University Valley, Quezon City', 'lat': 14.6634304, 'lon': 121.0726136},
  //   {'cityname': 'Sta. Barbara, Pangasinan', 'lat': 15.9704083, 'lon':120.4883926},
  //   ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Choose Location'),
          centerTitle: true,
          backgroundColor: Colors.blue,
          titleTextStyle: TextStyle(
            color: Colors.white , 
            fontSize: 25,
            ),
        ),
        body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context, index){
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: Card(
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
                  child: ListTile(
                    title:Text(locations[index].cityname ?? ''),
                    onTap: () async{
                      await locations[index].getWeather();
                      Navigator.pushReplacementNamed(context, '/home', arguments: {
                        'cityname': locations[index].cityname,
                        'temp': locations[index].temp, 
                        'bgimg': locations[index].bgimg, 
                        'weather': locations[index].weather,
                        'time': locations[index].time,
                        } 
                        );
                    },
                    ),
                ),
              ),
            );
          },

        )
    );
  }
}