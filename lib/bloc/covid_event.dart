part of 'covid_bloc.dart';

abstract class CovidEvent extends Equatable {
  const CovidEvent();
  @override
  List<Object> get props => [];
}
class SelectedCityEvent extends CovidEvent{
  final String city;
  const SelectedCityEvent({this.city});

  @override
  List<Object> get props => [city];
}
class LoadInitialData extends CovidEvent{
  @override
  List<Object> get props => [];
}

