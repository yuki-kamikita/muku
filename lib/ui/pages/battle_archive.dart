import 'dart:convert';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// 戦闘結果
class BattleArchive extends HookConsumerWidget {
  const BattleArchive({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final _result = useFuture(_loadJson());

    return Scaffold(
      body: _result.hasData
          ? _create(context, _result.data!)
          : const CircularProgressIndicator(),
    );
  }

  SliverStickyHeader _turnDummyWidget(BuildContext context, int turn) {
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

  CustomScrollView _create(BuildContext context, Map<String, dynamic> result) {
    return CustomScrollView(
      slivers: [
        SliverAppBar(
          expandedHeight: 600,
          // expandedHeight: MediaQuery.of(context).size.height,
          pinned: true,
          flexibleSpace: Image.asset(result['image'], fit: BoxFit.cover),
        ),
        _turnWidget(context, result['characters'], result['results'][0]),
        _turnWidget(context, result['characters'], result['results'][1]),
        _turnDummyWidget(context, 1),
        _turnDummyWidget(context, 2),
        _turnDummyWidget(context, 3),
        _turnDummyWidget(context, 4),
        _turnDummyWidget(context, 5),
        SliverStickyHeader(
          header: Container(
              height: 60.0,
              color: Theme.of(context).colorScheme.background,
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
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
    );
  }

  SliverStickyHeader _turnWidget(BuildContext context,
      List<dynamic> characterList, Map<String, dynamic> result) {
    return SliverStickyHeader(
      header: Container(
          height: 60.0,
          color: Theme.of(context).colorScheme.background,
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          alignment: Alignment.centerLeft,
          child: Center(
            child: Text(
              'Turn ${result['turn']}',
              style: GoogleFonts.parisienne(
                textStyle: Theme.of(context).textTheme.titleLarge,
                fontSize: 32.0,
              ),
            ),
          )),
      sliver: SliverList(
        delegate: SliverChildListDelegate([
          Container(
            padding: const EdgeInsets.all(16),
            color: Theme.of(context).colorScheme.background,
            child: _statusWidget(context, characterList, result['status']),
          ),
          for (final action in result['action'])
            _actionRow(characterList, action)
        ]),
      ),
    );
  }

  Column _statusWidget(BuildContext context, List<dynamic> characterList,
      List<dynamic> statusList) {
    return Column(
      children: [
        for (final status in statusList)
          _statusRow(characterList[status['characterId']], status)
      ],
    );
  }

  Container _statusRow(
      Map<String, dynamic> character, Map<String, dynamic> status) {
    return Container(
      width: double.infinity,
      child: Text(
        "${character['name']} ${status['hp']}/${status['mhp']}",
        textAlign: (character['side'] == 0) ? TextAlign.left : TextAlign.right,
      ),
    );
  }

  ListTile _actionRow(
      List<dynamic> characterList, Map<String, dynamic> action) {
    return ListTile(
      leading: CircleAvatar(
        child: Text(characterList[action['characterId']]['side'].toString()),
      ),
      title: Text("${characterList[action['characterId']]['name']}の行動"),
      subtitle: Text(
          "${action['name']}\n${characterList[action['target']]['name']}に${action['text']}"),
    );
  }

  Future<Map<String, dynamic>> _loadJson() async {
    final _jsonString = await rootBundle.loadString('assets/json/battleSample');
    return jsonDecode(_jsonString);
  }
}
