import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:travel_app/models/data_models.dart';

abstract class CubitStates extends Equatable{

}


class InitialState extends CubitStates{
  List<Object> get props => [];
}

class WelcomeState extends CubitStates{
  List<Object> get props => [];
}

class LoadingState extends CubitStates{
  List<Object> get props => [];
}

class LoadedState extends CubitStates{
  LoadedState(this.place);

  final List<DataModel> place;
  List<Object> get props => [place];
}

class DetailsState extends CubitStates{
  DetailsState(this.place);

  final DataModel place;
  List<Object> get props => [place];
}