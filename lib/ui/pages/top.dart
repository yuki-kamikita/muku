import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import 'package:muku/ui/pages/battle_archive.dart';
import 'package:muku/ui/pages/my_profile.dart';
import 'package:muku/ui/pages/next_action.dart';
import 'package:muku/ui/pages/settings/theme_selector.dart';
import 'package:muku/ui/pages/user_search.dart';

/// ボトムナビゲーションとドロワー
class Top extends HookConsumerWidget {
  const Top({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _bottomNavigationIndex = useState(0);
    final _pages = <Widget>[
      const NextAction(),
      const BattleArchive(),
      const UserSearch(),
      const MyProfile()
    ];

    return Scaffold(
      body: Center(
        child: _pages[_bottomNavigationIndex.value]
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(LineIcons.alternateMapMarked),
            label: '行動選択',
          ),
          BottomNavigationBarItem(
            icon: Icon(LineIcons.fire),
            label: '戦闘結果',
          ),
          BottomNavigationBarItem(
            icon: Icon(LineIcons.search),
            label: '検索',
          ),
          BottomNavigationBarItem(
            icon: Icon(LineIcons.user),
            label: 'プロフィール',
          ),
        ],
        currentIndex: _bottomNavigationIndex.value,
        type: BottomNavigationBarType.fixed,
        onTap: (int index) => _bottomNavigationIndex.value = index
      ),
      drawerEdgeDragWidth: MediaQuery.of(context).size.width,
      drawer: Drawer(
        child: ListView(
          children: <Widget>[
            DrawerHeader(
              child: Text('Muku Project'),
            ),
            ListTile(
              title: Text("テーマ切り替え"),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ThemeSelector()),
                ),
              },
            ),
            Divider(),
            ListTile(
              title: Text("プライバシーポリシー"),
              onTap: () => {},
            ),
            ListTile(
              title: Text("このアプリについて"),
              onTap: () => {
                showAboutDialog(
                  context: context,
                  applicationIcon: const Icon(LineIcons.code), // とりあえず
                  applicationName: "ムク",
                  applicationVersion: "0.0.0",
                  applicationLegalese: "よしなにして",
                ),
              },
            ),
            Divider(),
            ListTile(
              title: Text("アカウント連携"),
              onTap: () => {},
            ),
            ListTile(
              title: Text("ログアウト"),
              onTap: () => {},
            ),
          ],
        ),
      ),
    );
  }
}