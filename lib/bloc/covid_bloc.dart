import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:covid_app/data/covid_api.dart';
import 'package:covid_app/models/stats.dart';
import 'package:equatable/equatable.dart';

part 'covid_event.dart';
part 'covid_state.dart';

class CovidBloc extends Bloc<CovidEvent, CovidState> {
  final CovidApiClient client;

  CovidBloc({this.client});


  @override
  CovidState get initialState => InitialLoading();

// TODO: handle failures 
  @override
  Stream<CovidState> mapEventToState(
    CovidEvent event,
  ) async* {
    if(event is SelectedCityEvent){
      final stats = client.getWilayaStats(event.city); 
      yield LoadingSuccess(stats: stats);
    }else if (event is LoadInitialData){
      try{
        final stats = client.getCountryStats();
        yield LoadingSuccess(stats: stats); 
      }catch(_){
        yield LoadingFail(); 
      }      
    }
  }
}
