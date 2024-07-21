import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
    Map data ={};
  @override
  Widget build(BuildContext context) {
    data = data.isEmpty ? ModalRoute.of(context)!.settings.arguments as Map : data;
    String temp = data ['temp'];
    String location = data['cityname'];
    String bgimg = data['bgimg'];
    String weather = data['weather'];
    int time = data['time'];
    print('home $bgimg ');
    return Scaffold(
      body: Container(
        decoration: BoxDecoration( 
          gradient: LinearGradient(
            colors: time<17&&time>5 ? [Color.fromARGB(255, 6, 104, 189), Color.fromARGB(255, 32, 119, 190), Color.fromARGB(255, 156, 192, 223)] : [Color.fromARGB(255, 89, 12, 189), Color.fromARGB(255, 25, 7, 126), Color.fromARGB(255, 38, 106, 207)],
            end: Alignment.bottomCenter,
            begin: Alignment.topCenter,
            )
        ),
        child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '$weather', 
                      style: TextStyle( fontSize: 30, color: Colors.white),
                      textAlign: TextAlign.center,
                      
                      ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20,30,20,10),
                      child: Image.asset(
                        time<17&&time>5 ? 'assets/${bgimg}.png' : 'assets/${bgimg}n.png',
                        ),
                    ),

                    Text('$temp',
                      style: TextStyle(
                        fontSize: 50, color: Colors.white,
                      ),),

                    Text('$location', style: TextStyle(
                      fontSize: 30, color: Colors.white
                    ),
                      ),
                    
                    SizedBox(height: 20,),

                    ElevatedButton.icon(onPressed: (){
                      Navigator.pushNamed(context, '/location');
                    }, 
                      label: Text('Change Location'), )
                  ],),
              ),
      ),
    );
  }
}