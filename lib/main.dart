import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit.dart';
import 'package:travel_app/cubit/app_cubit_logics.dart';
import 'package:travel_app/screens/detail_page.dart';
import 'package:travel_app/services/data_services.dart';
import 'package:travel_app/widgets/home_page.dart';
import 'package:travel_app/widgets/main_page.dart';
import 'screens/welcome_page.dart';
import 'package:bloc/bloc.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: BlocProvider<AppCubits>(
        create: (context)=>AppCubits(
          data: DataServices(),
        ),
        child: AppCubitLogics(),
      )
    );
  }
}
