import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 行先選択
class Destination extends HookConsumerWidget {
  const Destination({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      appBar: AppBar(title: const Text("行先")),
      body: Center(
        child: Text("どこにいく？"),
      ),
    );
  }

}
