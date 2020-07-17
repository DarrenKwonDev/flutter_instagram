import 'package:camera/camera.dart';
import 'package:com/constants/size.dart';
import 'package:com/widgets/my_progress_indicator.dart';
import 'package:flutter/material.dart';

class CameraPage extends StatefulWidget {

  final CameraDescription camera;

  const CameraPage({Key key, @required this.camera}) : super(key: key);

  @override
  _CameraPageState createState() => _CameraPageState();

}

class _CameraPageState extends State<CameraPage> {
  int _selectedIndex = 1;
  var _pageContoller = PageController(initialPage: 1);

  CameraController _controller;
  Future<void> _initializeControllerFuture;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = CameraController(
      widget.camera,
      ResolutionPreset.medium,
    );
    _initializeControllerFuture = _controller.initialize();
  }

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
          _gellayPage(),
          _takePhotoPage(),
          _takeVideopagePage(),
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

  Widget _gellayPage() {
    return Container(
      color: Colors.green,
    );
  }

  Widget _takePhotoPage() {
    return FutureBuilder<void>(
      future: _initializeControllerFuture,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done)
        return Container(
          width: size.width,
          height: size.width,
          color: Colors.purple,
          child: ClipRect(
            child: OverflowBox(
              alignment: Alignment.topCenter,
              child: FittedBox(
                fit: BoxFit.fitWidth,
                child: Container(
                  width: size.width,
                  height: size.width /_controller.value.aspectRatio,
                  child: CameraPreview(_controller)
                ),
              )
            ),
          ),
        );
        return MyProgressIndicator();
      }
    );
  }

  Widget _takeVideopagePage() {
    return Container(
      color: Colors.blue,
    );
  }
}
