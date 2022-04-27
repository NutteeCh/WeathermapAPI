import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_application_1/models/weather.dart';
import 'package:http/http.dart' as http;

class HomeScreen extends StatefulWidget {
  const HomeScreen({ Key? key }) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {


  final Weather weather = Weather();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('API Weather')),
      body: Center(
        child: FutureBuilder(
          builder: (context,snapshot){
            if(snapshot!=null){
              Weather? weather = snapshot.data as Weather?;
              if(weather==null){
                return Text('Data is null');
              }else{
                return Column(
                  children: [
                    Text('${weather.temp} C'),
                    Text('${weather.lowest} C'),
                    Text('${weather.highest} C'),
                    Text('${weather.description}'),
                  ],
                );
              }
            }
            else{
              return CircularProgressIndicator();
            }
          },
          future: getCurrentWeather(),
        ),
      ),
    );
  }

  Future getCurrentWeather() async {
    Weather weather;
    String city = 'Bangkok';
    String apiKey = 'da65a29869521910526be4537007df13';

    final url = Uri.parse("https://api.openweathermap.org/data/2.5/weather?q=$city&appid=$apiKey");
    http.Response response = await http.get(url);

    if (response.statusCode == 200){
      weather = Weather.fromJson(jsonDecode(response.body));
    }else{
      print('Something wrong I can feel it.');
    }
  }

}