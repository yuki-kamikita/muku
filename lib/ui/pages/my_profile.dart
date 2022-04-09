import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 自分のプロフィール表示
class MyProfile extends HookConsumerWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      appBar: AppBar(title: const Text("プロフィール")),
      body: Center(
        child: Text("まだないよ"),
      ),
    );
  }

}
