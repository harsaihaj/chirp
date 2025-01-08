import 'package:chirp/constants.dart';
import 'package:flutter/material.dart';

import '../widgets/customAddicon.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int pageIdx = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: backgroundColor,
        onTap: (index){
          setState(() {
            pageIdx= index;
          });
        },
        currentIndex: pageIdx,
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.home_rounded, size: 25,),
            label: "Home"
          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.search_rounded, size: 25,),
              label: "Search"
          ),

          BottomNavigationBarItem(
              icon: customAddIcon(),
              label: ""

          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.messenger_rounded, size: 25,),
              label: "Messages"
          ),

          BottomNavigationBarItem(
              icon: Icon(Icons.person_4_rounded, size: 25,),
              label: "Profile"
          ),


        ],
      ),
      body: Center(
        child: Text(pageindex[pageIdx]),
      ),
    );
  }
}

