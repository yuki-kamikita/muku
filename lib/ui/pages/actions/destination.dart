import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 行先選択
class Destination extends HookConsumerWidget {
  const Destination({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height,
            // toolbarHeight: 80,
            pinned: true,
            // elevation: 2,
            automaticallyImplyLeading: false, // 戻るボタン非表示 これどうしようかな
            flexibleSpace:
                Image.asset('assets/images/dream.jpg', fit: BoxFit.cover),
          ),
          SliverList(
            delegate:
                SliverChildBuilderDelegate((BuildContext context, int index) {
              return Container(
                  padding: EdgeInsets.all(16.0), child: Text('Row_$index'));
            }),
          )
        ],
      ),
    );
  }
}
