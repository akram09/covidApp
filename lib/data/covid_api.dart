import 'package:covid_app/models/day_stat.dart';
import 'package:covid_app/models/stats.dart';
import 'package:covid_app/models/wilaya.dart';
import 'package:dio/dio.dart';
import 'package:meta/meta.dart';
import 'dart:math';
class CovidApiClient {

  final Dio dio ; 
  
  const CovidApiClient({@required this.dio});
  
  // TODO: add api call here 
  Future<Stats> getCountryStats() async{  
    Response response = await dio.get('/live_stats');
    if(response.statusCode!=200){
      throw Exception("Internet Connection Problem");
    }else{
      int totalCases = response.data["total_cases"] as int ;
      int closedCases = (response.data["total_recovered"] as int)  + (response.data["total_deaths"] as int);
      int activeCases = totalCases -closedCases;

      Response timeLineResponse = await dio.get('/time_line');
      if(timeLineResponse.statusCode!=200){
        print("Response not 200"); 
        throw Exception("Internet Connection Problem");
      }else{
        dynamic TimelineObject  = (timeLineResponse.data as List).first;
        DateTime time = DateTime.now().subtract(Duration(days: 15));
        var rng = Random();
        var daySates = <DayState>[];
        DayState dayState =null;

        for (var i = 0; i < 15; i++) {
          int day = time.day; 
          int month = time.month; 
          var dayKey = "$month/$day/20";
          var dayValue = TimelineObject[dayKey]; 
          int newDeaths = dayValue["new_daily_deaths"]as int ; 
          int newCases = dayValue["new_daily_cases"] as int;
          // TODO: dont use random yachkopi  
          int newRecovered = rng.nextInt(200); 
          // THis was random numbers TODO:
          if(i==14){
            final deathPercentage = (newDeaths - dayState.deathNumber)/dayState.deathNumber;
            final recoveredPercentage =(newRecovered - dayState.recoveredNumber)/dayState.recoveredNumber;
            final criticalPercentage = rng.nextInt(20) /100 ; 
            final midConditionPercentage = rng.nextInt(20)/100; 
            dayState = DayState(day: time, deathNumber: newDeaths, recoveredNumber:newRecovered, criticalConditionPercentage: criticalPercentage, deathPercentage: deathPercentage, midConditionPercentage: midConditionPercentage , recoveredPercentage: recoveredPercentage);
          }else{
            dayState = DayState(day: time, deathNumber: newDeaths, recoveredNumber:newRecovered, criticalConditionPercentage: 0.0, deathPercentage: 0.0, midConditionPercentage: 0.0 , recoveredPercentage: 0.0);
          }
          daySates.add(dayState);
          time  =time.add(Duration(days: 1));
        }
         return Stats(
            city: null, 
            activeCases:activeCases,
            closedCases: closedCases,
            totalCases: totalCases,
            historyStats:daySates
        ) ;
      }
    }
  }
  // TODO: add api call here 
  Future<Stats> getWilayaStats(Wilaya city) async{
    final name = city.name; 
    Response response = await dio.get('/wilaya/$name');
    var rng = Random();
    if(response.statusCode!=200){
      throw Exception("Internet Connection Problem");
    }else{
      int totalCases = response.data["cases"] as int ;
      int closedCases =rng.nextInt(totalCases);
      int activeCases = totalCases- closedCases;

      Response timeLineResponse = await dio.get('/time_line');
      if(timeLineResponse.statusCode!=200){
        print("Response not 200"); 
        throw Exception("Internet Connection Problem");
      }else{
        dynamic TimelineObject  = (timeLineResponse.data as List).first;
        DateTime time = DateTime.now().subtract(Duration(days: 15));
        
        var daySates = <DayState>[];
        DayState dayState =null;

        for (var i = 0; i < 15; i++) {
          int day = time.day; 
          int month = time.month; 
          var dayKey = "$month/$day/20";
          var dayValue = TimelineObject[dayKey]; 
          int newDeaths = dayValue["new_daily_deaths"]as int ; 
          int newCases = dayValue["new_daily_cases"] as int;
          // TODO: dont use random yachkopi  
          int newRecovered = rng.nextInt(200); 
          // THis was random numbers TODO:
          if(i==14){
            final deathPercentage = (newDeaths - dayState.deathNumber)/dayState.deathNumber;
            final recoveredPercentage =(newRecovered - dayState.recoveredNumber)/dayState.recoveredNumber;
            final criticalPercentage = rng.nextInt(20) /100 ; 
            final midConditionPercentage = rng.nextInt(20)/100; 
            dayState = DayState(day: time, deathNumber: newDeaths, recoveredNumber:newRecovered, criticalConditionPercentage: criticalPercentage, deathPercentage: deathPercentage, midConditionPercentage: midConditionPercentage , recoveredPercentage: recoveredPercentage);
          }else{
            dayState = DayState(day: time, deathNumber: newDeaths, recoveredNumber:newRecovered, criticalConditionPercentage: 0.0, deathPercentage: 0.0, midConditionPercentage: 0.0 , recoveredPercentage: 0.0);
          }
          daySates.add(dayState);
          time  =time.add(Duration(days: 1));
        }
         return Stats(
            city: city, 
            activeCases:activeCases,
            closedCases: closedCases,
            totalCases: totalCases,
            historyStats:daySates
        ) ;
      }
    }
  }






}