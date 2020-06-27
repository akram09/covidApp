import 'package:covid_app/models/day_stat.dart';
import 'package:covid_app/models/wilaya.dart';
import 'package:equatable/equatable.dart';

class Stats extends Equatable{
  final Wilaya city; 
  final int totalCases;
  final int activeCases; 
  final int closedCases; 
  final List<DayState> historyStats;

  Stats({this.city, this.totalCases, this.activeCases, this.closedCases, this.historyStats}); 



  @override
  List<Object> get props => [
    this.city, this.totalCases, this.activeCases, this.closedCases, this.historyStats
  ];

}