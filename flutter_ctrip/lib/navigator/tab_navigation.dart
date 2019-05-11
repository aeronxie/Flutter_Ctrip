import 'package:flutter/material.dart';
import 'package:flutter_ctrip/pages/journey_take_page.dart';
import 'package:flutter_ctrip/pages/home_page.dart';
import 'package:flutter_ctrip/pages/my_page.dart';
import 'package:flutter_ctrip/pages/customer_service_page.dart';
import 'package:flutter_ctrip/pages/itinerary_page.dart';

class TabNavigation extends StatefulWidget {
  @override
  _TabNavigationState createState() => _TabNavigationState();
}

class _TabNavigationState extends State<TabNavigation> {
  final Color _defaultColor = Colors.grey;
  final Color _activeColor = Colors.blue;

  int _currentIndex = 0;
  final _pageController = PageController(initialPage: 0);
  
  final Map<String,IconData> _items_map = {
    "首页":Icons.home,
    "行程":Icons.date_range,
    "旅拍":Icons.card_travel,
    "客服":Icons.mood,
    "我的":Icons.person
  };

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        children: <Widget>[
          HomePage(),
          ItineraryPage(),
          JourneyTakePage(),
          ServiePage(),
          MyPage()
        ],
        controller: _pageController,
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: _items(),
        selectedItemColor: _activeColor,
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        onTap: (index){
          _pageController.jumpToPage(index);
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }

  BottomNavigationBarItem _buildBarItem (String name,IconData icon) {
    return BottomNavigationBarItem(
      icon: Icon(icon,color: _defaultColor),
      activeIcon: Icon(icon,color: _activeColor),
      title: Text(name)
    );
  }

  List<BottomNavigationBarItem> _items () {
    List<BottomNavigationBarItem> items = [];
    _items_map.forEach((name,icon){items.add(_buildBarItem(name,icon));});
    return items;
  }
}