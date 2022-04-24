import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:muku/model/firebase/authentication.dart';

import 'ui/pages/top.dart';
import 'ui/theme/lib_color_schemes.g.dart';

// main関数を非同期にして、Firebaseのinitializeが完了したら画面を描画する
// initialize完了したら画面再描画、にしたい
void main() async {
  WidgetsFlutterBinding.ensureInitialized(); // main関数で非同期にするときに必要？
  await Firebase.initializeApp();
  Authentication().signInWithAnonymously(); // 匿名ログイン TODO:通常のログインを作るときに再設計
  runApp(const ProviderScope(child: MyApp()));
}

final themeModeProvider =
    StateProvider((ref) => ThemeMode.light); // FIXME: なんでここ切り替えると一瞬クラッシュするの

/// Themeの定義だけ
class MyApp extends HookConsumerWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return MaterialApp(
      themeMode: ref.watch(themeModeProvider), // ユーザー設定でここの値を変更できるようにすればいいな
      theme: ThemeData(
          useMaterial3: true,
          colorScheme: lightColorScheme,
          textTheme: GoogleFonts.yomogiTextTheme(
            Theme.of(context).textTheme,
          )),
      darkTheme: ThemeData(
          useMaterial3: true,
          colorScheme: darkColorScheme,
          textTheme: GoogleFonts.yomogiTextTheme(
            ThemeData(brightness: Brightness.dark).textTheme,
          )), // https://itome.team/blog/2019/12/flutter-advent-calendar-day12/
      home: const Top(),
    );
  }
}

// TODO: 接続情報をgitIgnoreにする
