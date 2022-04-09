import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final counterProvider = StateProvider((ref) => 0);

/// ユーザー検索
class UserSearch extends HookConsumerWidget {
  const UserSearch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      appBar: AppBar(title: const Text('ユーザー検索')),
      body: Center(
        child: Text("ユーザー検索"),
      ),
    );
  }

}
