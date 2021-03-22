import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:travel/src/widgets/destination_widgets.dart';
import 'package:travel/src/widgets/hotel_widget.dart';

class HomeScreenPage extends StatefulWidget {
  @override
  _HomeScreenPageState createState() => _HomeScreenPageState();
}

class _HomeScreenPageState extends State<HomeScreenPage> {
  int _selectedIcon = 0;

  int _currentTab = 0;

  List _icono = [
    FontAwesomeIcons.plane,
    FontAwesomeIcons.bed,
    FontAwesomeIcons.walking,
    FontAwesomeIcons.biking,
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: ListView(
              physics: BouncingScrollPhysics(),
              padding: EdgeInsets.symmetric(vertical: 30),
              children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 20, right: 120),
              child: FadeInDown(
                delay: Duration(milliseconds: 250),
                child: Text(
                  'What would you like to find?',
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            SizedBox(height: 30),
            Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: _icono
                      .asMap()
                      .entries
                      .map((MapEntry map) => _buildIcons(context, map.key))
                      .toList()),
            SizedBox(height: 20),
            DestinationCarousel(),
            SizedBox(height: 20),
            HotelCarousel(),
          ])),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentTab,
        onTap: (int _currentTab) {
          setState(() {
            this._currentTab = _currentTab;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Icon(
                Icons.search,
                size: 30.0,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Icon(
                Icons.local_pizza,
                size: 30.0,
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: CircleAvatar(
                radius: 15.0,
                backgroundImage: AssetImage('assets/avatar.png')
              ),
              label: ''),
        ],
      ),
    );
  }

  Widget _buildIcons(context, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIcon = index;
        });
      },
      child: FadeInLeft(
              delay: Duration(milliseconds: index * 200),
              duration: Duration(milliseconds: 300),
              child: Container(
            width: 60,
            height: 60,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: _selectedIcon == index
                  ? Theme.of(context).accentColor
                  : Color(0xffE7EBEE),
            ),
            child: Icon(_icono[index],
                size: 25,
                color: _selectedIcon == index
                    ? Theme.of(context).primaryColor
                    : Color(0xffB4C1C4))),
      ),
    );
  }
}
