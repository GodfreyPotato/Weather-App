import 'package:weather/weather.dart';
import 'package:weather_app/API/apikey.dart';

class weatherAPI{
  String? cityname;
  String? temp;
  int? code;
  int? time;
  double lat;
  double lon;
  late String bgimg;
  late String weather;
  WeatherFactory wf = WeatherFactory(apiKey);

  weatherAPI ({required this.cityname, required this.lat, required this.lon});

  Future <void> getWeather() async{
    Weather w = await wf.currentWeatherByLocation(lat, lon);

    cityname = w.areaName;
    temp = w.temperature.toString();
    code = w.weatherConditionCode;
    time = int.parse(w.date.toString().substring(11,13));
    bgw();

  }

  void bgw(){
    
    if(code == 800){
      bgimg = 'clear';
      weather = 'Clear Sky';
    }
    else if(code! >= 801 && code! <= 804){
      bgimg = 'partlyclear';
      weather = 'Cloudy and a little bit of sun son!';
    }
    else if(code! >= 300 && code! <321){
      bgimg = 'drizzle';
      weather = 'Get those umbrellas';
    }
    else if(code! >= 500 && code! <=531){
      bgimg = 'rainy';
      weather = 'Rainy';
    }
    else if(code! >= 200 && code! <= 232){
      bgimg = 'thunderstorm';
      weather = 'Thunderstorm!';
    }
    print(bgimg);
  }
  
}