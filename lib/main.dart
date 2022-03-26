import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'model/firebase/authentication.dart';
import 'ui/pages/home.dart';

// main関数を非同期にして、Firebaseのinitializeが完了したら画面を描画する
// initialize完了したら画面再描画、にしたい
void main() async{
  WidgetsFlutterBinding.ensureInitialized(); // main関数で非同期にするときに必要？
  await Firebase.initializeApp();
  Authentication().signInWithAnonymously();  // 匿名ログイン TODO:通常のログインを作るときに再設計
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}
