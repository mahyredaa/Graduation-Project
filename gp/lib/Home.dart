import 'package:gp/analysisWidget.dart';

import 'result.dart';
import 'package:flutter/material.dart';
import "package:dot_navigation_bar/dot_navigation_bar.dart";
import "homeScreenWidget.dart";
import "user.dart";

class Home extends StatefulWidget {
  user? us;
  //const Home(String admin, {Key? key, this.us}): super(key: key);
  Home({this.us});

  @override
  _HomeState createState() => _HomeState(us);
}

enum _SelectedTab { home, analysis, user }

class _HomeState extends State<Home> {

  user? us;
  _HomeState(this.us);
  List<Widget> pages= [];
  var _selectedPage;
  var _selectedTab = _SelectedTab.home;

  void _handleIndexChanged(int i) {
    pages = [HomeScreenWidget(us), const AnalysisWidget(), ResultWidget(us)];
    setState(() {
      _selectedTab = _SelectedTab.values[i];
      _selectedPage = pages[i];
      print(widget.us!.first_name);

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text("Video Emotion Detection"),
      //   backgroundColor: Colors.white,
      //   centerTitle: true,
      // ),
      extendBody: true,
      body: _selectedPage ?? HomeScreenWidget(us),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(bottom: 10),
        child: DotNavigationBar(
          margin: const EdgeInsets.only(left: 10, right: 10),
          currentIndex: _SelectedTab.values.indexOf(_selectedTab),
          dotIndicatorColor: const Color(0xFFFFFFFF),
          unselectedItemColor: Colors.grey[600],
          backgroundColor: const Color.fromARGB(80, 221, 221, 221),
          onTap: _handleIndexChanged,
          items: [
            DotNavigationBarItem(
              icon: const Icon(Icons.home),
              selectedColor: Colors.blue,
            ),
            DotNavigationBarItem(
              icon: const Icon(Icons.analytics),
              selectedColor: const Color.fromARGB(255, 253, 51, 68),
            ),
            DotNavigationBarItem(
              icon: const Icon(Icons.supervised_user_circle),
              selectedColor: const Color.fromARGB(255, 207, 104, 238),
            ),
          ],
        ),
      ),
    );
  }
}