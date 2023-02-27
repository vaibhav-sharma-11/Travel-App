import 'package:bloc/bloc.dart';
import 'package:travel_app/cubit/app_cubit_states.dart';
import 'package:travel_app/models/data_models.dart';
import 'package:travel_app/services/data_services.dart';

class AppCubits extends Cubit<CubitStates>{
  AppCubits({required this.data}) :super(InitialState()){
    emit(WelcomeState());
  }

  final DataServices data;
  late final place;
  void getData() async {
    try{
      emit(LoadingState());
      place = await data.getinfo();
      emit(LoadedState(place));
    }
    catch(e){
      print(e.toString());
    }
  }

  detailPage(DataModel data){
    emit(DetailsState(data));
  }

  goHome(){
    emit(LoadedState(place));
  }
}