import 'package:equatable/equatable.dart';

class Stats extends Equatable{
  final String city; 
  final int totalCases;
  final int recoveredCases; 
  final int deaths; 
  final int activeCases; 
  final double midCondition;
  final double criticalCondition; 
  final int closedCases; 
  final double recovered; 
  final double death; 
  final List<int> recoveredHistory; 
  final List<int> deathHistory; 

  const Stats({this.totalCases, this.recoveredCases, this.deaths, this.activeCases, this.midCondition, this.criticalCondition, this.closedCases, this.recovered, this.death, this.recoveredHistory, this.deathHistory, this.city});


  @override
  List<Object> get props => [
    this.totalCases, this.recoveredCases, this.deaths, 
    this.activeCases, this.midCondition, this.criticalCondition,
     this.closedCases, this.recovered, this.death, 
    this.recoveredHistory, this.deathHistory, this.city
  ];

}