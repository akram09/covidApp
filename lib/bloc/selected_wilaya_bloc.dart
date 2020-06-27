import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:covid_app/consts.dart';
import 'package:covid_app/models/wilaya.dart';
import 'package:equatable/equatable.dart';

part 'selected_wilaya_event.dart';
part 'selected_wilaya_state.dart';

class SelectedWilayaBloc extends Bloc<SelectedWilayaEvent, SelectedWilayaState> {

  final Wilaya wilaya ;

  SelectedWilayaBloc(this.wilaya); 


  @override
  SelectedWilayaState get initialState => SelectedWilayaState(WILAYAS, wilaya);

  @override
  Stream<SelectedWilayaState> mapEventToState(
    SelectedWilayaEvent event,
  ) async* {
    if(event is WilayaFilter){
      if(event.query.isNotEmpty){ 
        List<Wilaya> filteredData = List<Wilaya>();
        WILAYAS.forEach((element) {
          if(element.name.toLowerCase().contains(event.query.toLowerCase())){
            filteredData.add(element);
          }
        });
        print(filteredData.toString());
        print("State =====");
        yield SelectedWilayaState(filteredData);
      }else{
      yield SelectedWilayaState(WILAYAS);
      } 
    }else if(event is WilayaTouched){
        yield SelectedWilayaState(WILAYAS, event.wilaya);
    }
  }
}
