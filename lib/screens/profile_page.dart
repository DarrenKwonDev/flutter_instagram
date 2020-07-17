import 'package:cached_network_image/cached_network_image.dart';
import 'package:com/constants/size.dart';
import 'package:com/data/provider/my_user_data.dart';
import 'package:com/utils/profile_img_path.dart';
import 'package:com/widgets/profile_side_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with SingleTickerProviderStateMixin {
  AnimationController _animationController;
  bool _menuOpened = false;
  double menuWidth;
  int duration = 1000;
  int iconDuration = 1;
  AlignmentGeometry tabAlign = Alignment.centerLeft;
  bool iconLeft = true;
  bool iconSelected = true;
  double _gridMargin = 0;
  double _myImgGridMargin = size.width;

  @override
  void initState() {
    _animationController = AnimationController(
      vsync: this,
      duration: Duration(microseconds: duration),
    );
    super.initState();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

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

  get _getTabIconButtons => Row(
        children: <Widget>[
          Expanded(
              child: IconButton(
            icon: ImageIcon(
              AssetImage("assets/grid.png"),
              color: iconSelected ? Colors.black87 : Colors.black26,
            ),
            onPressed: () {
              setState(() {
                _setTab(true);
              });
            },
          )),
          Expanded(
              child: IconButton(
            icon: ImageIcon(
              AssetImage("assets/saved.png"),
              color: !iconSelected ? Colors.black87 : Colors.black26,
            ),
            onPressed: () {
              setState(() {
                _setTab(false);
              });
            },
          )),
        ],
      );

  get _getAnimatedSelectedBar => AnimatedContainer(
        duration: Duration(seconds: 1),
        alignment: tabAlign,
        curve: Curves.easeInOut,
        color: Colors.transparent,
        height: 1,
        width: size.width,
        child:
            Container(height: 1, width: size.width / 2, color: Colors.black87),
      );

  get _imageGrid => GridView.count(
        physics: NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        crossAxisCount: 3,
        childAspectRatio: 1,
        children: List.generate(30, (index) => _gridImgItem(index)),
      );

  _gridImgItem(int index) => CachedNetworkImage(
        fit: BoxFit.cover,
        imageUrl: "https://picsum.photos/id/$index/100/100",
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

  _setTab(bool tabLeft) {
    setState(() {
      if (tabLeft) {
        this.tabAlign = Alignment.centerLeft;
        this.iconSelected = true;
        this._gridMargin = 0;
        this._myImgGridMargin = size.width;
      } else {
        this.tabAlign = Alignment.centerRight;
        this.iconSelected = false;
        this._gridMargin = -size.width;
        this._myImgGridMargin = 0;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    menuWidth = size.width / 1.5;

    return Scaffold(
      body: Stack(
        children: <Widget>[
          _profile(),
          _sideMenu(),
        ],
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
      transform: Matrix4.translationValues(
          _menuOpened ? size.width - menuWidth : size.width, 0, 0),
      child: SafeArea(
        child: SizedBox(
          width: menuWidth,
          child: ProfileSideMEnu(),
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
                      _editProfileBtn(),
                      _getTabIconButtons,
                      _getAnimatedSelectedBar
                    ]),
                  ),
                  _getImageGrid(context)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Padding _editProfileBtn() {
    return Padding(
      padding: const EdgeInsets.all(common_gap),
      child: OutlineButton(
          onPressed: () {},
          borderSide: BorderSide(color: Colors.black45),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
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
        child: Consumer<MyUserData>(builder: (context, myUserData, child) {
//          print(myUserData.data.email);
          return Text(myUserData.data.email,
              style: TextStyle(fontWeight: FontWeight.bold));
        }));
  }

  _getImageGrid(BuildContext context) => SliverToBoxAdapter(
        child: Stack(
          children: <Widget>[
            AnimatedContainer(
              duration: Duration(seconds: iconDuration),
              curve: Curves.easeInOut,
              transform: Matrix4.translationValues(_gridMargin, 0, 0),
              child: _imageGrid,
            ),
            AnimatedContainer(
              duration: Duration(seconds: iconDuration),
              curve: Curves.easeInOut,
              transform: Matrix4.translationValues(_myImgGridMargin, 0, 0),
              child: _imageGrid,
            ),
          ],
        ),
      );

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
          icon: AnimatedIcon(
            icon: AnimatedIcons.menu_close,
            progress: _animationController,
            semanticLabel: "Show menu",
          ),
          onPressed: () {
            _menuOpened
                ? _animationController.reverse()
                : _animationController.forward();
            setState(() {
              _menuOpened = !_menuOpened;
            });
          },
        )
      ],
    );
  }
}
