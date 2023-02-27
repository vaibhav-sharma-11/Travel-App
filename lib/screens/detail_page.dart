import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit.dart';
import 'package:travel_app/cubit/app_cubit_states.dart';
import 'package:travel_app/widgets/anothertext.dart';
import 'package:travel_app/widgets/text.dart';

class DetailPage extends StatefulWidget {
  const DetailPage({Key? key}) : super(key: key);

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override

  int selectedindex = -1;
  bool tap = false;
  Widget build(BuildContext context) {
    return BlocBuilder<AppCubits,CubitStates>(builder: (context,state){
      DetailsState detail = state as DetailsState;
      return Scaffold(
        body: Container(
          width: double.maxFinite,
          height: double.maxFinite,
          child: Stack(
            children: [
              // image
              Positioned(
                left: 0,
                right: 0,
                child: Container(
                  width: double.maxFinite,
                  height: 350,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage("http://mark.bslmeiyu.com/uploads/"+detail.place.img),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              // icon
              Positioned(
                left: 10,
                top: 50,
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                      onPressed: (){
                        BlocProvider.of<AppCubits>(context).goHome();
                      },
                    ),
                  ],
                ),
              ),
              //location description
              Positioned(
                top: 330,
                child: Container(
                  padding: EdgeInsets.only(left: 20,right: 20,top: 20),
                  width: MediaQuery.of(context).size.width,
                  height: 500,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(25),
                      topRight: Radius.circular(25),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          text(line: detail.place.name,size: 25),
                          text(line: detail.place.price.toString(),size: 25,color: Colors.blue),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on,
                            color: Colors.blue,
                          ),
                          anothertext(line: detail.place.location),
                        ],
                      ),
                      SizedBox(height: 15),
                      Row(
                        children: [
                          Wrap(
                            children: List.generate(detail.place.stars, (index){
                              return Icon(
                                Icons.star,
                                color: Colors.yellow,
                              );
                            }),
                          ),
                          anothertext(line: detail.place.stars.toString(),color: Colors.grey),
                        ],
                      ),
                      SizedBox(height: 20),
                      text(line: "People",size: 18),
                      SizedBox(height: 5),
                      anothertext(line: "Number of people in your group",size: 15),
                      SizedBox(height: 20),
                      // number of peoples
                      Wrap(
                        children: List.generate(5, (index) {
                          return InkWell(
                            onTap: (){
                              setState(() {
                                selectedindex = index;
                              });
                            },
                            child: Container(
                              margin: EdgeInsets.only(right: 6),
                              width: 50,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(15),
                                color: selectedindex == index ? Colors.black : Colors.black26,
                              ),
                              child: Center(
                                child: Text(
                                  (index+1).toString(),
                                  style: TextStyle(
                                    color: selectedindex == index ? Colors.white : Colors.black26,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                      ),
                      SizedBox(height: 20),
                      text(line: "Description"),
                      SizedBox(height: 5),
                      anothertext(line: detail.place.description),
                      SizedBox(height: 20),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          InkWell(
                            child: Container(
                              width: 50,
                              height: 50,
                              child: Center(
                                child: Icon(
                                  Icons.favorite,
                                  color: tap == true ? Colors.red :Colors.white,
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: tap == true ? Colors.white : Colors.black,
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                            onTap: (){
                              setState(() {
                                tap = true;
                              });
                            },
                            onDoubleTap: (){
                              setState(() {
                                tap = false;
                              });
                            },
                          ),
                          InkWell(
                            child: Container(
                              margin: EdgeInsets.only(right: 12),
                              width: 200,
                              height: 50,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.blue,
                              ),
                              child: Center(
                                child: Text(
                                  "Book Trip Now",
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white,
                                    fontSize: 18,
                                  ),
                                ),
                              ),
                            ),
                            onTap: (){},
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
