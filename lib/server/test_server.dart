import 'package:weatherapp/server/server.dart';
import 'package:weatherapp/data/weather.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:weatherapp/data/string.dart';

class TestServer implements Server {
  static final _server = TestServer._internal();

  factory TestServer() {
    return _server;
  }
  TestServer._internal();

  @override
  Weather getCurrentWeather(String name) {
    switch(name) {
      case 'KUL':
        return new Weather('CLOUDY', 25, 27);
      case 'SH':
        return new Weather('RAINY', 21, 22);
      case 'JR':
        return new Weather('SUNNY', 29, 33);
      default:
        Fluttertoast.showToast(msg: Strings.getValue('CANTFNDLOC'));
        return Weather.getDefault();
    }
  }

  @override
  List<Weather> getWeatherForNextWeek(String name) {
    switch(name) {
      case 'KUL':
        return <Weather>[
          new Weather('CLOUDY', 23, 25),
          new Weather('SUNNY', 27, 30),
          new Weather('CLOUDY', 22, 24),
          new Weather('RAINY', 21, 19),
          new Weather('SUNNY', 28, 31),
          new Weather('SUNNY', 29, 33),
          new Weather('CLOUDY', 24, 22)
        ];
      case 'SH':
        return <Weather>[
          new Weather('RAINY', 20, 22),
          new Weather('SUNNY', 29, 31),
          new Weather('SUNNY', 31, 33),
          new Weather('RAINY', 22, 23),
          new Weather('CLOUDY', 24, 25),
          new Weather('SUNNY', 30, 33),
          new Weather('RAINY', 21, 24)
        ];
      case 'JR':
        return <Weather>[
          new Weather('CLOUDY', 24, 25),
          new Weather('CLOUDY', 26, 29),
          new Weather('SUNNY', 30, 33),
          new Weather('RAINY', 20, 23),
          new Weather('CLOUDY', 23, 27),
          new Weather('SUNNY', 31, 33),
          new Weather('CLOUDY', 23, 29)
        ];
      default:
        Fluttertoast.showToast(msg: Strings.getValue('CANTFNDLOC'));
        return <Weather>[
          Weather.getDefault(),
          Weather.getDefault(),
          Weather.getDefault(),
          Weather.getDefault(),
          Weather.getDefault(),
          Weather.getDefault(),
          Weather.getDefault()
        ];
    }
  }

  @override
  List<String> getCities() {
    return [
      'KUL',
      'SH',
      'JR'
    ];
  }

  @override String curCity = 'KUL';

  @override bool isC = true;

}