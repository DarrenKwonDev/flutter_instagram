import 'package:com/screens/feed_page.dart';
import 'package:com/screens/profile_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = [
    FeedPage(),
    Container(color: Colors.primaries[1],),
    Container(color: Colors.primaries[2],),
    Container(color: Colors.primaries[3],),
    ProfilePage()
  ];

  void  _onItemTapped(int index) {
    print(index);
    setState(() {
      _selectedIndex = index;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: IndexedStack(
          index: _selectedIndex,
          children: _widgetOptions,
        ),
      bottomNavigationBar: BottomNavigationBar(

        // 선택한 아이템의 레이블 표시할 건가? (왜냐하면 BottomNavigationBarItem의 title이 필수값이라서)
        showSelectedLabels: false,
        // 선택하지 않은 아이템의 레이블 표시할 건가?
        showUnselectedLabels: false,

        // 선택한 아이템의 색
        selectedItemColor: Colors.black,
        // 선택하지 않은 아이템의 색
        unselectedItemColor: Colors.grey[900],

        // animate and labels fade in when they are tapped.
        // 어차피 shifting, fixed 밖에 없습니다.
        type: BottomNavigationBarType.shifting,

        // 하단 바의 배경 색깔
        backgroundColor: Color.fromRGBO(249, 249, 249, 1),

        // 하단 바가 가질 아이템들
        items: [
          _buildBottomNavigationBarItem(activeIconPath: "assets/home_selected.png", iconPath: "assets/home.png"),
          _buildBottomNavigationBarItem(activeIconPath: "assets/search_selected.png", iconPath: "assets/search.png"),
          _buildBottomNavigationBarItem(iconPath: "assets/add.png"),
          _buildBottomNavigationBarItem(activeIconPath: "assets/heart_selected.png", iconPath: "assets/heart.png"),
          _buildBottomNavigationBarItem(activeIconPath: "assets/profile_selected.png", iconPath: "assets/profile.png"),
        ],

        // 선택한 아이템의 index
        currentIndex: _selectedIndex,

        // 아이템을 선택했을 때 할 액션
        onTap: (index) => _onItemTapped(index)
      ),
    );
  }
}

BottomNavigationBarItem _buildBottomNavigationBarItem({String activeIconPath, String iconPath}) {
  return BottomNavigationBarItem(
    // 선택되었을 때 사용할 아이콘
    activeIcon: activeIconPath == null ? null : ImageIcon(AssetImage(activeIconPath)),
    // 선택 안 되었을 때의 아이콘
    icon: ImageIcon(AssetImage(iconPath)),
    // BottomNavigationBarItem은 title 속성이 필수값입니다.
    title: Text(''),
  );
}

