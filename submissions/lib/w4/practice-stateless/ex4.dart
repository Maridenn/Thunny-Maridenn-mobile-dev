import 'package:flutter/material.dart';

class Temp {
  const Temp({required this.min, required this.max});

  final double min;
  final double max;

  double get avgTemp => (min + max) / 2;

  String get minText => "Min: ${min.toString()}°C";
  String get maxText => "Max: ${max.toString()}°C";
  String get tempText => "${avgTemp.toStringAsFixed(2)}°C";
}

enum Weather {
  cloudy(
    temp: Temp(min: 10.2, max: 23.9),
    start: Color.fromARGB(255, 215, 221, 232),
    end: Color.fromARGB(255, 117, 127, 154),
    descrip: "Cloudy but cosy",
    imagePath: "assets/w4-stateless/ex4/cloudy.png",
  ),
  sunny(
    temp: Temp(min: 20.9, max: 35.0),
    start: Colors.red,
    end: Colors.yellow,
    descrip: "Clear skies and sunshines",
    imagePath: "assets/w4-stateless/ex4/sunny.png",
  ),
  sunnyCloudy(
    temp: Temp(min: 18.8, max: 30.9),
    start: Color.fromARGB(255, 255, 222, 233),
    end: Color.fromARGB(255, 181, 255, 252),
    descrip: "Sunny with passing clouds",
    imagePath: "assets/w4-stateless/ex4/sunnyCloudy.png",
  ),
  veryCloudy(
    temp: Temp(min: 8.8, max: 20.2),
    start: Color.fromARGB(255, 44, 62, 80),
    end: Color.fromARGB(255, 189, 195, 199),
    descrip: "Thick cloud cover",
    imagePath: "assets/w4-stateless/ex4/veryCloudy.png",
  );

  const Weather({
    required this.imagePath,
    required this.temp,
    required this.descrip,
    required this.start,
    required this.end,
  });

  final Temp temp;
  final String descrip;
  final Color start;
  final Color end;
  final String imagePath;
}

enum Cities {
  phnomPenh(name: "Phnom Penh", weather: Weather.sunny),
  rome(name: "Rome", weather: Weather.cloudy),
  florence(name: "Florence", weather: Weather.sunnyCloudy),
  stockholm(name: "Stockholm", weather: Weather.veryCloudy);

  const Cities({required this.name, required this.weather});
  final String name;
  final Weather weather;
}

class WeatherCard extends StatelessWidget {
  const WeatherCard({super.key, required this.city});

  final Cities city;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20),
      child: PhysicalModel(
        color: city.weather.start,
        shadowColor: city.weather.end,
        borderRadius: BorderRadius.circular(20),
        elevation: 12.0,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            gradient: LinearGradient(
              colors: [city.weather.start, city.weather.end],
            ),
          ),
          child: Stack(
            children: [
              Positioned(
                right: -25,
                top: 30,
                child: Container(
                  width: 200,
                  height: 200,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: city.weather.start,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.all(20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        CircleAvatar(
                          radius: 25,
                          backgroundImage: AssetImage(city.weather.imagePath),
                        ),
                        SizedBox(width: 20),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              city.name,
                              style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              city.weather.descrip,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              city.weather.temp.minText,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              city.weather.temp.maxText,
                              style: TextStyle(
                                fontSize: 12,
                                color: Colors.white,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Text(
                      city.weather.temp.tempText,
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 16, 146, 211),
          title: Text("Weathers", style: TextStyle(color: Colors.white)),
          actions: [
            Icon(Icons.menu, color: Colors.white),
            SizedBox(width: 16),
          ],
        ),
        body: Center(
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              WeatherCard(city: Cities.stockholm),
              WeatherCard(city: Cities.florence),
              WeatherCard(city: Cities.phnomPenh),
              WeatherCard(city: Cities.rome),
              WeatherCard(city: Cities.florence),
              WeatherCard(city: Cities.stockholm),
              WeatherCard(city: Cities.phnomPenh),
            ],
          ),
        ),
      ),
    ),
  );
}
