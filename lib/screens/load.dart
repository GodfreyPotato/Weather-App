import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:weather_app/API/weatherAPI.dart';


class Loading extends StatefulWidget {
  const Loading({super.key});

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
   String? cityname;
   String? temp;
   int? code;
   late String bgimg;
   late String weather;
   int? time;
  double lat = 16.4113551;
  double lon = 120.5950576;
  String? timeNow;
  void ini() async{
    weatherAPI instance = weatherAPI(cityname: '', lat: lat, lon: lon);
    await instance.getWeather();
    cityname =  instance.cityname;
    temp =  instance.temp;
    code = instance.code;
    time = instance.time;
    bgimg = instance.bgimg;
    weather = instance.bgimg;
    
    Navigator.pushReplacementNamed(context, '/home',arguments:{'cityname': cityname,'temp': temp, 'bgimg': bgimg, 'weather': weather,'time':time,} );
  }
  
  
  @override
  void initState() {
    super.initState();
    ini();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SpinKitDualRing(color: Colors.blue,
        size: 20,
      )
    );
  }
}