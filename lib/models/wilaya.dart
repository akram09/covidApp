import 'package:equatable/equatable.dart';

class Wilaya extends Equatable{
  final String name;
  final int number;

  const Wilaya({this.name, this.number});

  @override
  List<Object> get props => [this.name, this.number]; 
}