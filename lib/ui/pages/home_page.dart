import 'package:clay_containers/clay_containers.dart';
import 'package:cloud_app/ui/assets/colors/colors.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static const routeName = 'home-page';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        title: Text('Home Page'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
         Container(
           padding: EdgeInsets.all(16),
           child: ClayContainer(
             color: primaryColor,
             height: 100,
             borderRadius: 12,
             child: Container(
               decoration: BoxDecoration(
                 gradient: LinearGradient(colors: <Color>[activeColor1,activeColor2]),
                 borderRadius: BorderRadius.circular(12)
               ),
               child: Padding(
                 padding: EdgeInsets.all(12),
                 child: ListTile(
                   leading: Icon(Icons.tablet,color: Colors.white),
                 ),
               ),
             ),
           ),
         )
        ],
      ),
    );
  }
}
