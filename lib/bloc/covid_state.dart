part of 'covid_bloc.dart';

abstract class CovidState extends Equatable {
  const CovidState();
   @override
  List<Object> get props => [];
}

class InitialLoading extends CovidState {}
class LoadingFail extends CovidState {}
class LoadingSuccess extends CovidState{
  final Stats stats ; 
  LoadingSuccess({this.stats}); 
  @override
  List<Object> get props => [stats];

}
