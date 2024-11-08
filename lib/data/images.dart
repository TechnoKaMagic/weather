// //backGround
// String bg1 = "assets/background/weathercloud.jpg";
List<String> BG =[
  "assets/background/1.jpg",
 
];

Map<String,dynamic> Bg ={

  "Clear" : "assets/background/ClearClouds.jpg",
  "Cloud-Lightning" : "assets/background/Cloud Liightining.jpg",
  "Clouds" : "assets/background/Clouds.jpg",
  "Drizzle" : "assets/background/drizzle.jpg",
  "FewClouds" : "assets/background/fewClouds.jpg",
  "Mist" : "assets/background/mist.jpg",
  "Rain" : "assets/background/rain.jpg",
  "Snow" : "assets/background/snow.jpg",
  "default" : "assets/background/default.jpg",
};
Map<String, dynamic> WeatherIcons = {
  "Clear": "assets/icons/clear sky.webp",
  "Few Clouds": "assets/icons/few clouds.webp",
  "Scattered Clouds": "assets/icons/scattered clouds.png",
  "Broken Clouds": "assets/icons/broken clouds.webp",
  "Shower Rain": "assets/icons/shower rain.webp",
  "Rain": "assets/icons/rain.png",
  "Thunderstorm": "assets/icons/thunderstorm.png",
  "Snow": "assets/icons/snow.png",
  "Mist": "assets/icons/mist.png",
  "Error": "assets/icons/error.png",
  "Clouds" : "assets/icons/clouds.png"
};


List<String> WIcons =[
  "assets/icons/sun.png",
  "assets/icons/few clouds.webp",
  "assets/icons/broken clouds .webp",
 "assets/icons/mist.png",
 "assets/icons/rain.png",
  "assets/icons/scattered clouds .png",
  "assets/icons/shower rain.webp",
  "assets/icons/snow.png",
  "assets/icons/thunderstorm.png",
  "assets/icons/error.png"
  ];

 String tempHigh = "assets/icons/tempurature_high.png";
  String tempLow = "assets/icons/tempurature_low.png";
  String sun = "assets/icons/sun.png";
  String moon = "assets/icons/moon.png";


 String TempHigh = "assets/ICON/13.png";
  String TempLow = "assets/ICON/14.png";
  String Sun = "assets/ICON/11.png";
  String Moon = "assets/ICON/12.png";


String SnowAni = "assets/animation/snow.json";



//Icons
// String  brokenClouds = "assets/icons/broken clouds .webp";
// String  clearSky = "assets/icons/clear sky.webp";
// String  fewClouds = "assets/icons/few clouds.webp";
// String  mist = "assets/icons/mist.png";
// String  rain = "assets/icons/rain.png";
// String  scatterdClouds = "assets/icons/scattered clouds .png";
// String  shower = "assets/icons/shower rain.webp";
// String  snow = "assets/icons/snow.png";
// String  thunderStrom = "assets/icons/thunderstorm.png";



 
   //new weather icon try to feach from weather code
  String getWeatherIcon(int? code) {
  if (code == null) return 'assets/7.png'; // Fallback icon

  if (code >= 200 && code < 300) {
    return 'assets/ICON/1.png';
  } else if (code >= 300 && code < 400) {
    return 'assets/ICON/2.png';
  } else if (code >= 500 && code < 600) {
    return 'assets/ICON/3.png';
  } else if (code >= 600 && code < 700) {
    return 'assets/ICON/4.png';
  } else if (code >= 700 && code < 800) {
    return 'assets/ICON/5.png';
  } else if (code == 800) {
    return 'assets/ICON/6.png';
  } else if (code > 800 && code <= 804) {
    return 'assets/ICON/7.png';
  } else {
    return 'assets/ICON/7.png'; // Default icon
  }
}
