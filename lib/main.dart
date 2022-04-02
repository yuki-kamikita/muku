import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'model/firebase/authentication.dart';
import 'ui/pages/home.dart';
import 'ui/theme/lib_color_schemes.g.dart';

// main関数を非同期にして、Firebaseのinitializeが完了したら画面を描画する
// initialize完了したら画面再描画、にしたい
void main() async{
  WidgetsFlutterBinding.ensureInitialized(); // main関数で非同期にするときに必要？
  await Firebase.initializeApp();
  Authentication().signInWithAnonymously(); // 匿名ログイン TODO:通常のログインを作るときに再設計
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: seed, // もっと内容増えたらcolorSchemeと入れ替えて内容確認してみようかな
        // colorScheme: lightColorScheme,
      ),
      darkTheme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: seed,
          brightness: Brightness.dark
          // colorScheme: darkColorScheme,
      ), // https://itome.team/blog/2019/12/flutter-advent-calendar-day12/
      home: const Home(),
    );
  }
}
