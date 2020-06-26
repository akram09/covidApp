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
      DayState(criticalConditionPercentage: 0.12 , day: DateTime.now(),deathNumber: 20, deathPercentage: 0.3, midConditionPercentage: 0.4, recoveredNumber: 30, recoveredPercentage: 0.2, totalNumber: 200),
      DayState(criticalConditionPercentage: 0.12 , day: DateTime.now(),deathNumber: 30, deathPercentage: 0.3, midConditionPercentage: 0.4, recoveredNumber: 30, recoveredPercentage: 0.2, totalNumber: 200),
       DayState(criticalConditionPercentage: 0.12 , day: DateTime.now(),deathNumber: 20, deathPercentage: 0.3, midConditionPercentage: 0.4, recoveredNumber: 30, recoveredPercentage: 0.2, totalNumber: 200),
      DayState(criticalConditionPercentage: 0.12 , day: DateTime.now(),deathNumber: 30, deathPercentage: 0.3, midConditionPercentage: 0.4, recoveredNumber: 30, recoveredPercentage: 0.2, totalNumber: 200),
       DayState(criticalConditionPercentage: 0.12 , day: DateTime.now(),deathNumber: 40, deathPercentage: 0.3, midConditionPercentage: 0.4, recoveredNumber: 30, recoveredPercentage: 0.2, totalNumber: 200),
      DayState(criticalConditionPercentage: 0.12 , day: DateTime.now(),deathNumber: 20, deathPercentage: 0.3, midConditionPercentage: 0.4, recoveredNumber: 30, recoveredPercentage: 0.2, totalNumber: 200),
       DayState(criticalConditionPercentage: 0.12 , day: DateTime.now(),deathNumber: 60, deathPercentage: 0.3, midConditionPercentage: 0.4, recoveredNumber: 30, recoveredPercentage: 0.2, totalNumber: 200),
      DayState(criticalConditionPercentage: 0.12 , day: DateTime.now(),deathNumber: 20, deathPercentage: 0.3, midConditionPercentage: 0.4, recoveredNumber: 30, recoveredPercentage: 0.2, totalNumber: 200),
       DayState(criticalConditionPercentage: 0.12 , day: DateTime.now(),deathNumber: 30, deathPercentage: 0.3, midConditionPercentage: 0.4, recoveredNumber: 30, recoveredPercentage: 0.2, totalNumber: 200),
      DayState(criticalConditionPercentage: 0.12 , day: DateTime.now(),deathNumber: 20, deathPercentage: 0.3, midConditionPercentage: 0.4, recoveredNumber: 30, recoveredPercentage: 0.2, totalNumber: 200),
       DayState(criticalConditionPercentage: 0.12 , day: DateTime.now(),deathNumber: 60, deathPercentage: 0.3, midConditionPercentage: 0.4, recoveredNumber: 30, recoveredPercentage: 0.2, totalNumber: 200),
      DayState(criticalConditionPercentage: 0.12 , day: DateTime.now(),deathNumber: 70, deathPercentage: 0.3, midConditionPercentage: 0.4, recoveredNumber: 30, recoveredPercentage: 0.2, totalNumber: 200),
       DayState(criticalConditionPercentage: 0.12 , day: DateTime.now(),deathNumber: 20, deathPercentage: 0.3, midConditionPercentage: 0.4, recoveredNumber: 30, recoveredPercentage: 0.2, totalNumber: 200),
      DayState(criticalConditionPercentage: 0.12 , day: DateTime.now(),deathNumber: 50, deathPercentage: 0.3, midConditionPercentage: 0.4, recoveredNumber: 30, recoveredPercentage: 0.2, totalNumber: 200),
       DayState(criticalConditionPercentage: 0.12 , day: DateTime.now(),deathNumber: 20, deathPercentage: 0.3, midConditionPercentage: 0.4, recoveredNumber: 30, recoveredPercentage: 0.2, totalNumber: 200),
      DayState(criticalConditionPercentage: 0.12 , day: DateTime.now(),deathNumber: 20, deathPercentage: 0.3, midConditionPercentage: 0.4, recoveredNumber: 30, recoveredPercentage: 0.2, totalNumber: 200),
    ] );
  }
  // TODO: add api call here 
  Stats getWilayaStats(String city){
    return Stats(city: city , activeCases: 2060 , closedCases: 1094, totalCases: 3160,historyStats: <DayState>[
    ] );
  }






}