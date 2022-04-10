import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import 'package:muku/ui/pages/battle_archive.dart';
import 'package:muku/ui/pages/my_profile.dart';
import 'package:muku/ui/pages/next_action.dart';
import 'package:muku/ui/pages/settings/theme_selector.dart';
import 'package:muku/ui/pages/user_search.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:webview_flutter/webview_flutter.dart';

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
            const DrawerHeader(
              child: Text('Muku Project'),
            ),
            ListTile(
              title: const Text("テーマ切り替え"),
              onTap: () => {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const ThemeSelector()),
                ),
              },
            ),
            ListTile(
              title: const Text("ゲームシステム"),
              onTap: () => {},
            ),
            ListTile(
              title: const Text("開発者Twitter"),
              onTap: () => {
                launch("https://twitter.com/yuki_kamikita")
              },
            ),
            ListTile(
              title: const Text("公式Discore"),
              onTap: () => {},
            ),
            const Divider(),
            ListTile(
              title: const Text("アカウント連携"),
              onTap: () => {},
            ),
            ListTile(
              title: const Text("ログアウト"),
              onTap: () => {},
            ),
            const Divider(),
            ListTile(
              title: const Text("利用規約"),
              onTap: () => {},
            ),
            ListTile(
              title: const Text("プライバシーポリシー"),
              onTap: () => {
                // WebViewは画面作らないといけないらしくてだるいので一旦後回し
                // const WebView(
                //   initialUrl: 'https://github.com/yuki-kamikita/muku/wiki/%E3%83%97%E3%83%A9%E3%82%A4%E3%83%90%E3%82%B7%E3%83%BC%E3%83%9D%E3%83%AA%E3%82%B7%E3%83%BC',
                // )
                launch("https://github.com/yuki-kamikita/muku/wiki/%E3%83%97%E3%83%A9%E3%82%A4%E3%83%90%E3%82%B7%E3%83%BC%E3%83%9D%E3%83%AA%E3%82%B7%E3%83%BC")
              },
            ),
            ListTile(
              title: const Text("このアプリについて"),
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
            ListTile(
              title: const Text("開発者募集"),
              onTap: () => {
                launch('https://akaiyukiusagi.com/')
              },
            ),
          ],
        ),
      ),
    );
  }
}