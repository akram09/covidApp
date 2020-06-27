part of 'selected_wilaya_bloc.dart';

class SelectedWilayaState extends Equatable {
  final Wilaya wilaya; 
  final List<Wilaya> wilayas;

  const SelectedWilayaState( this.wilayas, [this.wilaya]);
    @override
  List<Object> get props => [wilaya, wilayas];
 
}
