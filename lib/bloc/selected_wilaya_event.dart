part of 'selected_wilaya_bloc.dart';

abstract class SelectedWilayaEvent extends Equatable {
  const SelectedWilayaEvent();

}
class WilayaTouched extends SelectedWilayaEvent{
  final Wilaya wilaya ;

  const WilayaTouched({this.wilaya});

  @override
  // TODO: implement props
  List<Object> get props => [wilaya]; 
}

class WilayaFilter extends SelectedWilayaEvent{
  final String query ; 

  const WilayaFilter({this.query});
  @override
  List<Object> get props => [query];

}
