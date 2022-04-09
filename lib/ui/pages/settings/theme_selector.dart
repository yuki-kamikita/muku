import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:line_icons/line_icons.dart';
import 'package:muku/main.dart';

/// テーマ切り替え
class ThemeSelector extends HookConsumerWidget {
  const ThemeSelector({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {

    return Scaffold(
      appBar: AppBar(title: const Text("テーマ切り替え")),
      body: Center(
          child: Column(
            children: [
              Card(
                child: ListTile(
                  leading: ConstrainedBox(
                      constraints: const BoxConstraints.expand(width: 0.0),
                      child: const Icon(LineIcons.moon)),
                  title: const Text('ダークモード'),
                  subtitle: const Text('暗くするよ'),
                  onTap: () => {
                    ref.watch(themeModeProvider.state).update((state) => ThemeMode.dark)
                  },
                ),
              ),
              Card(
                child: ListTile(
                  leading: ConstrainedBox(
                      constraints: const BoxConstraints.expand(width: 0.0),
                      child: const Icon(LineIcons.sun)),
                  trailing: const Icon(LineIcons.sun),
                  title: const Text('ライトモード'),
                  subtitle: const Text('明るくするよ'),
                  onTap: () => {
                    ref.watch(themeModeProvider.state).update((state) => ThemeMode.light)
                  },
                ),
              ),

            ],
          )
      ),
    );
  }

}
