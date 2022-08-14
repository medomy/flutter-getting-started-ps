
class Weather {
  String name = "";
  String description = "";
  double temp = 0;
  double precieved = 0;
  int pressure = 0;
  int humdity = 0;
  Weather(this.name , this.description,this.temp , this.precieved , this.pressure , this.humdity);
  Weather.convert(Map<String,dynamic> weatherInfo){
    this.name = weatherInfo["name"];
    this.temp = (weatherInfo["main"]["temp"] - 273.15)?? 0;
    this.description = weatherInfo["weather"][0]["main"]??"";
    this.precieved = (weatherInfo["main"]["feels_like"] - 273.15) ?? 0;
    this.pressure = weatherInfo["main"]["pressure"] ?? 0;
    this.humdity = weatherInfo["main"]["humidity"] ?? 0;

  }
}