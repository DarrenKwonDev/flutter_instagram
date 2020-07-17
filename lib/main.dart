import 'package:com/constants/material_white_color.dart';
import 'package:com/data/provider/my_user_data.dart';
import 'package:com/firebase/firestore_provider.dart';
import 'package:com/main_page.dart';
import 'package:com/screens/auth_page.dart';
import 'package:com/widgets/my_progress_indicator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  return runApp(ChangeNotifierProvider<MyUserData>(
      create: (context) => MyUserData(), child: MyApp()));
}

bool isItFirstData = true;

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        theme: ThemeData(primarySwatch: white),
        home: StreamBuilder<FirebaseUser>(
            stream: FirebaseAuth.instance.onAuthStateChanged,
            builder: (context, snapshot) {
              if (isItFirstData) {
                isItFirstData = false;
                return MyProgressIndicator();
              } else {
                if (snapshot.hasData) {
                  firestoreProvider.attemptCreateuser(userKey: snapshot.data.uid, email: snapshot.data.email);
                  var myUserData = Provider.of<MyUserData>(context);
                  firestoreProvider.connectMyUserData(snapshot.data.uid).listen((user) {
                    myUserData.setuserData(user);
                  });
                  return MainPage();
                }
                return AuthPage();
              }
            }));
  }
}

// MainPage()는 테스트용
// 완성 후에는 아래 페이지로 변화시킬 것
// AuthPage()
