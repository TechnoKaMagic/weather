class Weather{
    final String cityName;
    final double temperature;
    final String mainCondition;

    Weather ({
      required this.cityName,
      required this.mainCondition,
      required this.temperature,
    });
    factory Weather.fromJson(Map<String, dynamic> json){
      return Weather(
        cityName: json['Name'],
        temperature: json['main']['temp'].toDouble(),
        mainCondition: json ['Weather'][0]['main'],
      );
    }
    }