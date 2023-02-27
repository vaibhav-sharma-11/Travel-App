import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit.dart';
import 'package:travel_app/widgets/responsivebutton.dart';
import 'package:travel_app/widgets/text.dart';
import 'package:travel_app/widgets/anothertext.dart';


class WelcomePage extends StatefulWidget {
  const WelcomePage({Key? key}) : super(key: key);

  @override
  State<WelcomePage> createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  List images = [
    'welcomepage1.jpeg',
    'welcomepage2.jpeg',
    'w.jpeg',
  ];
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView.builder(
        scrollDirection: Axis.vertical,
        itemCount: images.length,
        itemBuilder:(_, index) {
          return Container(
            width: double.maxFinite,
            height: double.maxFinite,
            decoration: BoxDecoration(
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  "assets/"+images[index],
                ),
              ),
            ),
            child: Container(
              margin: EdgeInsets.only(top: 130,left: 35,right: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: List.generate(3, (indexDots){
                      return Container(
                        margin: EdgeInsets.only(bottom: 8),
                        width: 8,
                        height: index == indexDots ? 25 :8,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(8),
                            color: Colors.blue
                        ),
                      );
                    }),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      text(line: "Trips", size:30),
                      SizedBox(height:5),
                      anothertext(line: "Mountains",size: 30,color: Colors.black),
                      SizedBox(height:20),
                      Container(
                        width: 250,
                        child: anothertext(
                          line: "Mountain hikes give you an incredible semse of freedom along ith enduravce",
                          size: 16,
                        ),
                      ),
                      SizedBox(height: 40),
                      GestureDetector(
                        onTap: (){},
                          child: Container(
                              child: ResponsiveButton(
                                  width: 150,
                              )
                          ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

