import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/cubit/app_cubit.dart';
import 'package:travel_app/cubit/app_cubit_states.dart';
import 'package:travel_app/widgets/anothertext.dart';
import 'package:travel_app/widgets/text.dart';
import 'package:travel_app/screens/welcome_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{

  @override

  List images = [
    'welcomepage2.jpeg',
    'welcomepage1.jpeg',
    'w.jpeg',
  ];

  var imagesdesc = {
    'around-the-world.png':'world',
    'suitcase.png':'suitcase',
    'traveling.png':'tavel',
    'travelling.png':'world travel',
  };

  Widget build(BuildContext context) {
    TabController _tabController = TabController(length: 3, vsync: this);
    return Scaffold(
      body: BlocBuilder<AppCubits,CubitStates>(
        builder: (context,state){
         if(state is LoadedState){
           var info = state.place;
           return Column(
             crossAxisAlignment: CrossAxisAlignment.start,
             children: [
               // menu and image
               Container(
                 padding: EdgeInsets.only(top: 60,left: 20),
                 //menu
                 child: Row(
                   children: [
                     Icon(
                       Icons.menu,
                       color: Colors.black,
                     ),
                     Expanded(child: Container()),
                     Container(
                       margin: EdgeInsets.only(right: 20),
                       width: 50,
                       height: 50,
                       decoration: BoxDecoration(
                         borderRadius: BorderRadius.circular(10),
                         color: Colors.grey,
                       ),
                     ),
                   ],
                 ),
               ),
               //Discover text
               SizedBox(height: 15),
               Container(
                 margin: EdgeInsets.only(left: 18),
                 child: text(line: "Discover",size: 30),
               ),
               SizedBox(height: 20),
               // tab bar
               Container(
                 child: Align(
                   alignment: Alignment.centerLeft,
                   child: TabBar(
                     indicator: CircleTabIndicator(color: Colors.black, radius: 4),
                     labelPadding: EdgeInsets.only(left: 20,right: 20),
                     controller: _tabController,
                     labelColor: Colors.black,
                     unselectedLabelColor: Colors.grey,
                     isScrollable: true,
                     indicatorSize: TabBarIndicatorSize.label,
                     tabs: [
                       Tab(text: "Places"),
                       Tab(text: "Insprition"),
                       Tab(text: "Emotions"),
                     ],
                   ),
                 ),
               ),
               //tab bar view
               Container(
                 height: 300,
                 width: double.maxFinite,
                 padding: EdgeInsets.only(left: 5),
                 child: TabBarView(
                   controller: _tabController,
                   children: [
                     ListView.builder(
                       itemBuilder: (BuildContext context, int index){
                         return GestureDetector(
                           onTap: (){
                             BlocProvider.of<AppCubits>(context).detailPage(info[index]);
                           },
                           child: Container(
                             margin: EdgeInsets.only(top: 10,left: 10),
                             width: 200,
                             height: 300,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(20),
                               image: DecorationImage(
                                 image: NetworkImage("http://mark.bslmeiyu.com/uploads/"+info[index].img),
                                 fit: BoxFit.cover,
                               ),
                             ),
                           ),
                         );
                       },
                       itemCount: info.length,
                       scrollDirection: Axis.horizontal,
                     ),

                     Text("there"),
                     Text("Bye"),
                   ],
                 ),
               ),
               // explore more and see all
               Container(
                 margin: EdgeInsets.only(top: 20,left: 20,right: 20),
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                   children: [
                     text(line: "Explore more..",size: 20),
                     anothertext(line: "See all",color: Colors.blue),
                   ],
                 ),
               ),
               SizedBox(height: 20),
               Container(
                 height: 120,
                 width: double.maxFinite,
                 margin: EdgeInsets.only(left: 20),
                 child: ListView.builder(
                   scrollDirection: Axis.horizontal,
                   itemCount: 4,
                   itemBuilder: (_,int index){
                     return Container(
                       margin: EdgeInsets.only(right: 30),
                       child: Column(
                         children: [
                           Container(
                             width: 80,
                             height: 80,
                             decoration: BoxDecoration(
                               borderRadius: BorderRadius.circular(20),
                               image: DecorationImage(
                                 image: AssetImage("assets/"+imagesdesc.keys.elementAt(index)),
                                 fit: BoxFit.cover,
                               ),
                             ),
                           ),
                           SizedBox(height: 5),
                           Container(
                             child: anothertext(line: imagesdesc.values.elementAt(index),color: Colors.black),
                           ),
                         ],
                       ),
                     );
                   },
                 ),
               ),
             ],
           );
         }
         else{
           return Container();
         }
        },
      ),
    );
  }
}

class CircleTabIndicator extends Decoration{

  double radius;
  final Color color;
  CircleTabIndicator({required this.color, required this.radius});

  @override
  BoxPainter createBoxPainter([VoidCallback? onChanged]) {
    return _CriclePainter(color: color,radius: radius);
  }

}

class _CriclePainter extends BoxPainter{
  @override

   final Color color;
   double radius;
  _CriclePainter({required this.color,required this.radius});

  void paint(Canvas canvas, Offset offset, ImageConfiguration configuration) {
    Paint _paint = Paint();
    _paint.color = color;
    _paint.isAntiAlias = true;
    final Offset circleOffset = Offset(configuration.size!.width/2,configuration.size!.height);
    canvas.drawCircle(offset+circleOffset, radius, _paint);
  }

}


