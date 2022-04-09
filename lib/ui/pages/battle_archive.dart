import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final counterProvider = StateProvider((ref) => 0);

/// 戦闘結果
class BattleArchive extends HookConsumerWidget {
  const BattleArchive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      appBar: AppBar(title: const Text('戦闘結果')),
      body: Center(
        child: Text("戦闘結果"),
      ),
    );
  }

}
