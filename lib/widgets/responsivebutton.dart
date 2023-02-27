import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit.dart';
class ResponsiveButton extends StatelessWidget {

  double? width;
  ResponsiveButton({
    this.width = 100,
});


  Widget build(BuildContext context){
    return Container(
      width: width,
      height: 50,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.blue,
      ),
      child: IconButton(
        icon: Icon(
            Icons.arrow_right_alt,
        ),
        onPressed: (){
          BlocProvider.of<AppCubits>(context).getData();
        },
      ),
    );
  }
}
