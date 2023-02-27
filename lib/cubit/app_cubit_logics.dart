import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit.dart';
import 'package:travel_app/cubit/app_cubit_states.dart';
import 'package:travel_app/screens/detail_page.dart';
import 'package:travel_app/screens/welcome_page.dart';
import 'package:travel_app/widgets/home_page.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({Key? key}) : super(key: key);

  @override
  State<AppCubitLogics> createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits,CubitStates>(
        builder: (context,state){
          if(state is WelcomeState){
            return WelcomePage();
          }
          if(state is DetailsState){
            return DetailPage();
          }
          if(state is LoadingState){
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          if(state is LoadedState){
            return HomePage();
          }
          else{
            return Container();
          }
        },
      ),
    );
  }
}
