import 'dart:convert';
/// coord : {"lon":72.8515,"lat":34.0403}
/// weather : [{"id":800,"main":"Clear","description":"clear sky","icon":"01d"}]
/// base : "stations"
/// main : {"temp":34.25,"feels_like":37.93,"temp_min":34.25,"temp_max":34.25,"pressure":1007,"humidity":47,"sea_level":1007,"grnd_level":949}
/// visibility : 10000
/// wind : {"speed":1.48,"deg":242,"gust":1.65}
/// clouds : {"all":9}
/// dt : 1662630477
/// sys : {"type":2,"id":2007435,"country":"PK","sunrise":1662598011,"sunset":1662643581}
/// timezone : 18000
/// id : 1174301
/// name : "Khalabat"
/// cod : 200

CurrentWeatherModel currentWeatherModelFromJson(String str) => CurrentWeatherModel.fromJson(json.decode(str));
String currentWeatherModelToJson(CurrentWeatherModel data) => json.encode(data.toJson());
class CurrentWeatherModel {
  CurrentWeatherModel({
      Coord? coord, 
      List<Weather>? weather, 
      String? base, 
      Main? main, 
      int? visibility, 
      Wind? wind, 
      Clouds? clouds, 
      int? dt, 
      Sys? sys, 
      int? timezone, 
      int? id, 
      String? name, 
      int? cod,}){
    _coord = coord;
    _weather = weather;
    _base = base;
    _main = main;
    _visibility = visibility;
    _wind = wind;
    _clouds = clouds;
    _dt = dt;
    _sys = sys;
    _timezone = timezone;
    _id = id;
    _name = name;
    _cod = cod;
}

  CurrentWeatherModel.fromJson(dynamic json) {
    _coord = json['coord'] != null ? Coord.fromJson(json['coord']) : null;
    if (json['weather'] != null) {
      _weather = [];
      json['weather'].forEach((v) {
        _weather?.add(Weather.fromJson(v));
      });
    }
    _base = json['base'];
    _main = json['main'] != null ? Main.fromJson(json['main']) : null;
    _visibility = json['visibility'];
    _wind = json['wind'] != null ? Wind.fromJson(json['wind']) : null;
    _clouds = json['clouds'] != null ? Clouds.fromJson(json['clouds']) : null;
    _dt = json['dt'];
    _sys = json['sys'] != null ? Sys.fromJson(json['sys']) : null;
    _timezone = json['timezone'];
    _id = json['id'];
    _name = json['name'];
    _cod = json['cod'];
  }
  Coord? _coord;
  List<Weather>? _weather;
  String? _base;
  Main? _main;
  int? _visibility;
  Wind? _wind;
  Clouds? _clouds;
  int? _dt;
  Sys? _sys;
  int? _timezone;
  int? _id;
  String? _name;
  int? _cod;
CurrentWeatherModel copyWith({  Coord? coord,
  List<Weather>? weather,
  String? base,
  Main? main,
  int? visibility,
  Wind? wind,
  Clouds? clouds,
  int? dt,
  Sys? sys,
  int? timezone,
  int? id,
  String? name,
  int? cod,
}) => CurrentWeatherModel(  coord: coord ?? _coord,
  weather: weather ?? _weather,
  base: base ?? _base,
  main: main ?? _main,
  visibility: visibility ?? _visibility,
  wind: wind ?? _wind,
  clouds: clouds ?? _clouds,
  dt: dt ?? _dt,
  sys: sys ?? _sys,
  timezone: timezone ?? _timezone,
  id: id ?? _id,
  name: name ?? _name,
  cod: cod ?? _cod,
);
  Coord? get coord => _coord;
  List<Weather>? get weather => _weather;
  String? get base => _base;
  Main? get main => _main;
  int? get visibility => _visibility;
  Wind? get wind => _wind;
  Clouds? get clouds => _clouds;
  int? get dt => _dt;
  Sys? get sys => _sys;
  int? get timezone => _timezone;
  int? get id => _id;
  String? get name => _name;
  int? get cod => _cod;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_coord != null) {
      map['coord'] = _coord?.toJson();
    }
    if (_weather != null) {
      map['weather'] = _weather?.map((v) => v.toJson()).toList();
    }
    map['base'] = _base;
    if (_main != null) {
      map['main'] = _main?.toJson();
    }
    map['visibility'] = _visibility;
    if (_wind != null) {
      map['wind'] = _wind?.toJson();
    }
    if (_clouds != null) {
      map['clouds'] = _clouds?.toJson();
    }
    map['dt'] = _dt;
    if (_sys != null) {
      map['sys'] = _sys?.toJson();
    }
    map['timezone'] = _timezone;
    map['id'] = _id;
    map['name'] = _name;
    map['cod'] = _cod;
    return map;
  }

}

/// type : 2
/// id : 2007435
/// country : "PK"
/// sunrise : 1662598011
/// sunset : 1662643581

Sys sysFromJson(String str) => Sys.fromJson(json.decode(str));
String sysToJson(Sys data) => json.encode(data.toJson());
class Sys {
  Sys({
      int? type, 
      int? id, 
      String? country, 
      int? sunrise, 
      int? sunset,}){
    _type = type;
    _id = id;
    _country = country;
    _sunrise = sunrise;
    _sunset = sunset;
}

  Sys.fromJson(dynamic json) {
    _type = json['type'];
    _id = json['id'];
    _country = json['country'];
    _sunrise = json['sunrise'];
    _sunset = json['sunset'];
  }
  int? _type;
  int? _id;
  String? _country;
  int? _sunrise;
  int? _sunset;
Sys copyWith({  int? type,
  int? id,
  String? country,
  int? sunrise,
  int? sunset,
}) => Sys(  type: type ?? _type,
  id: id ?? _id,
  country: country ?? _country,
  sunrise: sunrise ?? _sunrise,
  sunset: sunset ?? _sunset,
);
  int? get type => _type;
  int? get id => _id;
  String? get country => _country;
  int? get sunrise => _sunrise;
  int? get sunset => _sunset;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['type'] = _type;
    map['id'] = _id;
    map['country'] = _country;
    map['sunrise'] = _sunrise;
    map['sunset'] = _sunset;
    return map;
  }

}

/// all : 9

Clouds cloudsFromJson(String str) => Clouds.fromJson(json.decode(str));
String cloudsToJson(Clouds data) => json.encode(data.toJson());
class Clouds {
  Clouds({
      int? all,}){
    _all = all;
}

  Clouds.fromJson(dynamic json) {
    _all = json['all'];
  }
  int? _all;
Clouds copyWith({  int? all,
}) => Clouds(  all: all ?? _all,
);
  int? get all => _all;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['all'] = _all;
    return map;
  }

}

/// speed : 1.48
/// deg : 242
/// gust : 1.65

Wind windFromJson(String str) => Wind.fromJson(json.decode(str));
String windToJson(Wind data) => json.encode(data.toJson());
class Wind {
  Wind({
      double? speed, 
      int? deg, 
      double? gust,}){
    _speed = speed;
    _deg = deg;
    _gust = gust;
}

  Wind.fromJson(dynamic json) {
    _speed = json['speed'];
    _deg = json['deg'];
    _gust = json['gust'];
  }
  double? _speed;
  int? _deg;
  double? _gust;
Wind copyWith({  double? speed,
  int? deg,
  double? gust,
}) => Wind(  speed: speed ?? _speed,
  deg: deg ?? _deg,
  gust: gust ?? _gust,
);
  double? get speed => _speed;
  int? get deg => _deg;
  double? get gust => _gust;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['speed'] = _speed;
    map['deg'] = _deg;
    map['gust'] = _gust;
    return map;
  }

}

/// temp : 34.25
/// feels_like : 37.93
/// temp_min : 34.25
/// temp_max : 34.25
/// pressure : 1007
/// humidity : 47
/// sea_level : 1007
/// grnd_level : 949

Main mainFromJson(String str) => Main.fromJson(json.decode(str));
String mainToJson(Main data) => json.encode(data.toJson());
class Main {
  Main({
      double? temp, 
      double? feelsLike, 
      double? tempMin, 
      double? tempMax, 
      int? pressure, 
      int? humidity, 
      int? seaLevel, 
      int? grndLevel,}){
    _temp = temp;
    _feelsLike = feelsLike;
    _tempMin = tempMin;
    _tempMax = tempMax;
    _pressure = pressure;
    _humidity = humidity;
    _seaLevel = seaLevel;
    _grndLevel = grndLevel;
}

  Main.fromJson(dynamic json) {
    _temp = json['temp'];
    _feelsLike = json['feels_like'];
    _tempMin = json['temp_min'];
    _tempMax = json['temp_max'];
    _pressure = json['pressure'];
    _humidity = json['humidity'];
    _seaLevel = json['sea_level'];
    _grndLevel = json['grnd_level'];
  }
  double? _temp;
  double? _feelsLike;
  double? _tempMin;
  double? _tempMax;
  int? _pressure;
  int? _humidity;
  int? _seaLevel;
  int? _grndLevel;
Main copyWith({  double? temp,
  double? feelsLike,
  double? tempMin,
  double? tempMax,
  int? pressure,
  int? humidity,
  int? seaLevel,
  int? grndLevel,
}) => Main(  temp: temp ?? _temp,
  feelsLike: feelsLike ?? _feelsLike,
  tempMin: tempMin ?? _tempMin,
  tempMax: tempMax ?? _tempMax,
  pressure: pressure ?? _pressure,
  humidity: humidity ?? _humidity,
  seaLevel: seaLevel ?? _seaLevel,
  grndLevel: grndLevel ?? _grndLevel,
);
  double? get temp => _temp;
  double? get feelsLike => _feelsLike;
  double? get tempMin => _tempMin;
  double? get tempMax => _tempMax;
  int? get pressure => _pressure;
  int? get humidity => _humidity;
  int? get seaLevel => _seaLevel;
  int? get grndLevel => _grndLevel;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['temp'] = _temp;
    map['feels_like'] = _feelsLike;
    map['temp_min'] = _tempMin;
    map['temp_max'] = _tempMax;
    map['pressure'] = _pressure;
    map['humidity'] = _humidity;
    map['sea_level'] = _seaLevel;
    map['grnd_level'] = _grndLevel;
    return map;
  }

}

/// id : 800
/// main : "Clear"
/// description : "clear sky"
/// icon : "01d"

Weather weatherFromJson(String str) => Weather.fromJson(json.decode(str));
String weatherToJson(Weather data) => json.encode(data.toJson());
class Weather {
  Weather({
      int? id, 
      String? main, 
      String? description, 
      String? icon,}){
    _id = id;
    _main = main;
    _description = description;
    _icon = icon;
}

  Weather.fromJson(dynamic json) {
    _id = json['id'];
    _main = json['main'];
    _description = json['description'];
    _icon = json['icon'];
  }
  int? _id;
  String? _main;
  String? _description;
  String? _icon;
Weather copyWith({  int? id,
  String? main,
  String? description,
  String? icon,
}) => Weather(  id: id ?? _id,
  main: main ?? _main,
  description: description ?? _description,
  icon: icon ?? _icon,
);
  int? get id => _id;
  String? get main => _main;
  String? get description => _description;
  String? get icon => _icon;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['main'] = _main;
    map['description'] = _description;
    map['icon'] = _icon;
    return map;
  }

}

/// lon : 72.8515
/// lat : 34.0403

Coord coordFromJson(String str) => Coord.fromJson(json.decode(str));
String coordToJson(Coord data) => json.encode(data.toJson());
class Coord {
  Coord({
      double? lon, 
      double? lat,}){
    _lon = lon;
    _lat = lat;
}

  Coord.fromJson(dynamic json) {
    _lon = json['lon'];
    _lat = json['lat'];
  }
  double? _lon;
  double? _lat;
Coord copyWith({  double? lon,
  double? lat,
}) => Coord(  lon: lon ?? _lon,
  lat: lat ?? _lat,
);
  double? get lon => _lon;
  double? get lat => _lat;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['lon'] = _lon;
    map['lat'] = _lat;
    return map;
  }

}