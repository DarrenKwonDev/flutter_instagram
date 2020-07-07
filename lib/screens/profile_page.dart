import 'package:com/constants/size.dart';
import 'package:com/utils/profile_img_path.dart';
import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  bool _menuOpened = false;
  Size _size;
  double menuWidth;
  int duration = 200;

  get _getProfileHeader => Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(common_gap),
            child: CircleAvatar(
              radius: 40,
              backgroundImage:
                  NetworkImage(getProfileImgPath("usernamestring")),
            ),
          ),
          Expanded(
            child: Table(
              children: [
                TableRow(children: [
                  _getStatusValueWidget("123"),
                  _getStatusValueWidget('3456'),
                  _getStatusValueWidget('768'),
                ]),
                TableRow(children: [
                  _getStatusLabelWidget("Posts"),
                  _getStatusLabelWidget("Follwers"),
                  _getStatusLabelWidget("Following"),
                ]),
              ],
            ),
          )
        ],
      );

  Widget _getStatusLabelWidget(String value) => Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: common_s_gap),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(value,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.w300)),
          ),
        ),
      );

  Widget _getStatusValueWidget(String value) => Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: common_s_gap),
          child: FittedBox(
            fit: BoxFit.scaleDown,
            child: Text(value,
                textAlign: TextAlign.center,
                style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ),
      );

  @override
  Widget build(BuildContext context) {
    _size = MediaQuery.of(context).size;
    menuWidth = _size.width / 1.5;

    return Scaffold(
      body: Stack(
        children: <Widget>[_sideMenu(), _profile()],
      ),
    );
  }

  // 누르면 옆에서 튀어나옵니다.
  Widget _sideMenu() {
    return AnimatedContainer(
      duration: Duration(milliseconds: duration),
      color: Colors.grey[200],
      curve: Curves.easeInOut,
      // 메뉴가 열리면 화면의 가로 길이에서 메뉴의 크기 만큼 뺀 공간을 주어서 보이게 만듭니다.
      // 열리지 않았다면 현재 화면 길이 만큼 _profile이 차지하고 있으니 0을 주어도 무방합니다
      transform: Matrix4.translationValues(
          _menuOpened ? _size.width - menuWidth : 0, 0, 0),
      child: SafeArea(
        child: SizedBox(
          width: menuWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              FlatButton(onPressed: () {}, child: Text("DarrenKwon"))
            ],
          ),
        ),
      ),
    );
  }

  Widget _profile() {
    return AnimatedContainer(
      duration: Duration(milliseconds: duration),
      color: Colors.white,
      curve: Curves.easeInOut,
      // 메뉴가 열리면 메뉴의 길이 만큼 왼쪽으로 밀어냅니다. 안 열리면 굳이 애니메이션을 줄 필요없으니 0
      transform: Matrix4.translationValues(_menuOpened ? -menuWidth : 0, 0, 0),
      child: SafeArea(
        child: Column(
          children: <Widget>[
            _usernameIconButton(),
            Expanded(
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverList(
                    delegate: SliverChildListDelegate([
                      _getProfileHeader,
                      _username(),
                      _userbio(),
                      __editProfileBtn()
                    ]),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding __editProfileBtn() {
    return Padding(
                      padding: const EdgeInsets.all(common_gap),
                      child: OutlineButton(
                          onPressed: () {},
                          borderSide: BorderSide(color: Colors.black45),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6)
                          ),
                          child: Text("Edit Profile",
                              style: TextStyle(fontWeight: FontWeight.bold))),
                    );
  }

  Padding _userbio() {
    return Padding(
                      padding: const EdgeInsets.only(left: common_gap),
                      child: Text("Bio from User. So Say something",
                          style: TextStyle(fontWeight: FontWeight.w400)),
                    );
  }

  Padding _username() {
    return Padding(
                      padding: const EdgeInsets.only(left: common_gap),
                      child: Text("User Real Name",
                          style: TextStyle(fontWeight: FontWeight.bold)),
                    );
  }

  Row _usernameIconButton() {
    return Row(
      children: <Widget>[
        Expanded(
            child: Padding(
          padding: const EdgeInsets.only(left: common_gap),
          child: Text("DarrenKwon",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20)),
        )),
        IconButton(
          icon: Icon(Icons.menu),
          onPressed: () {
            setState(() {
              _menuOpened = !_menuOpened;
            });
          },
        )
      ],
    );
  }
}
