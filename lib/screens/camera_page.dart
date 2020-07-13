import 'package:flutter/material.dart';

class CameraPage extends StatefulWidget {
  @override
  _CameraPageState createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  int _selectedIndex = 1;
  var _pageContoller = PageController(initialPage: 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: Text("Photo"),
        actions: <Widget>[
          IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.close),
          )
        ],
      ),
      body: PageView(
        controller: _pageContoller,
        onPageChanged: (index) {
          setState(() {
            _selectedIndex = index;
          });
        },
        children: <Widget>[
          Container(color: Colors.green),
          Container(color: Colors.purple),
          Container(color: Colors.yellowAccent),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => _onItemTapped(context, index),
        iconSize: 0,
        selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
        unselectedItemColor: Colors.grey[400],
        selectedItemColor: Colors.black,
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.grey[50],
        items: <BottomNavigationBarItem>[
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/grid.png')),
              title: Text("GALLEY")),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/grid.png')),
              title: Text("PHOTO")),
          BottomNavigationBarItem(
              icon: ImageIcon(AssetImage('assets/grid.png')),
              title: Text("VIDEO")),
        ],
      ),
    );
  }

  _onItemTapped(BuildContext context, int index) {
    _pageContoller.animateToPage(index,
        duration: Duration(milliseconds: 200), curve: Curves.easeInOut);
  }
}
