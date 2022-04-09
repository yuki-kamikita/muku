import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:muku/ui/pages/actions/destination.dart';

/// 行動選択
class NextAction extends HookConsumerWidget {
  const NextAction({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      appBar: AppBar(title: const Text("行動選択")),
      body: Center(
        child: Column(
          children: [
            Card(
              child: ListTile(
                title: Text('行先選択'),
                subtitle: Text('戦う相手を選ぶよ'),
                onTap: () => {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Destination()),
                  ),
                },
              ),
            ),
            Card(
              child: ListTile(
                title: Text('能力調整'),
                subtitle: Text('ステータスとスキルを変更するよ'),
              ),
            ),
            Card(
              child: ListTile(
                title: Text('戦闘設定'),
                subtitle: Text('戦闘に使うスキルの順番を決めるよ'),
              ),
            ),
          ],
        )
      ),
    );
  }

}
