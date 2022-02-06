import 'package:weatherapp/data/weather.dart';

abstract class Server {

  Weather getCurrentWeather(String name);

  List<Weather> getWeatherForNextWeek(String name);

  List<String> getCities();

  late String curCity;
  late bool isC;

}