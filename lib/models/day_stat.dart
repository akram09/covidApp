import 'package:equatable/equatable.dart';

class DayState extends Equatable{
  final DateTime day ; 
  final int recoveredNumber; 
  final double midConditionPercentage;
  final double criticalConditionPercentage; 
  final double recoveredPercentage; 
  final double deathPercentage; 
  final int deathNumber ; 

  DayState({this.day, this.recoveredNumber, this.midConditionPercentage, this.criticalConditionPercentage, this.recoveredPercentage, this.deathPercentage, this.deathNumber});

  


  @override
  List<Object> get props =>[this.day, this.recoveredNumber, this.midConditionPercentage, this.criticalConditionPercentage, this.recoveredPercentage, this.deathPercentage, this.deathNumber];
  


}