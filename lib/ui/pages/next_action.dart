import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final counterProvider = StateProvider((ref) => 0);

/// 行動選択
class NextAction extends HookConsumerWidget {
  const NextAction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      appBar: AppBar(title: const Text('行動選択')),
      body: Center(
        child: Text("行動選択"),
      ),
    );
  }

}
