import 'package:covid_app/models/day_stat.dart';
import 'package:covid_app/models/stats.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

class CovidApiClient {

  final Dio dio ; 
  
  const CovidApiClient({@required this.dio});
  
  // TODO: add api call here 
  Stats getCountryStats(){
    return Stats(city: null , activeCases: 2060 , closedCases: 1094, totalCases: 3160,historyStats: <DayState>[

    ] );
  }
  // TODO: add api call here 
  Stats getWilayaStats(String city){
    return Stats(city: city , activeCases: 2060 , closedCases: 1094, totalCases: 3160,historyStats: <DayState>[
    ] );
  }






}