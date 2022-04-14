import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 戦闘結果
class BattleArchive extends HookConsumerWidget {
  const BattleArchive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar(
            expandedHeight: MediaQuery.of(context).size.height,
            pinned: true,
            flexibleSpace:
                Image.asset('assets/images/dream.jpg', fit: BoxFit.cover),
          ),
          _turnWidget(context, 1),
          _turnWidget(context, 2),
          _turnWidget(context, 3),
          _turnWidget(context, 4),
          _turnWidget(context, 5),
          SliverStickyHeader(
            header: Container(
                height: 60.0,
                color: Theme.of(context).colorScheme.background,
                padding: EdgeInsets.symmetric(horizontal: 16.0),
                alignment: Alignment.centerLeft,
                child: Center(
                  child: Text(
                    'Fin',
                    style: GoogleFonts.parisienne(
                      textStyle: Theme.of(context).textTheme.titleLarge,
                      fontSize: 32.0,
                    ),
                  ),
                )),
          ),
        ],
      ),
    );
  }

  SliverStickyHeader _turnWidget(BuildContext context, int turn) {
    return SliverStickyHeader(
      header: Container(
          height: 60.0,
          color: Theme.of(context).colorScheme.background,
          padding: EdgeInsets.symmetric(horizontal: 16.0),
          alignment: Alignment.centerLeft,
          child: Center(
            child: Text(
              'Turn $turn',
              style: GoogleFonts.parisienne(
                textStyle: Theme.of(context).textTheme.titleLarge,
                fontSize: 32.0,
              ),
            ),
          )),
      sliver: SliverList(
        delegate: SliverChildBuilderDelegate(
          (context, i) => ListTile(
            leading: CircleAvatar(
              child: Text('0'),
            ),
            title: Text('行動 #$i'),
          ),
          childCount: 15,
        ),
      ),
    );
  }
}
