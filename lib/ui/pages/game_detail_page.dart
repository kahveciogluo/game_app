import 'package:flutter/material.dart';
import 'package:game_app/provider/provider_status.dart';
import 'package:game_app/provider/game_provider.dart';
import 'package:game_app/ui/widgets/game_detail_view.dart';
import 'package:game_app/ui/widgets/provider_status_view.dart';
import 'package:provider/provider.dart';

class GameDetailPage extends StatefulWidget {
  final int gameId;
  const GameDetailPage({super.key, required this.gameId});

  @override
  State<GameDetailPage> createState() => _GameDetailPageState();
}

class _GameDetailPageState extends State<GameDetailPage> {
  @override
  Widget build(BuildContext context) {
    final provider = context.watch<GameProvider>();

    return Scaffold(
        appBar: AppBar(
          title: const Text('Game Detail',
              style: TextStyle(color: Colors.black87, fontSize: 16)),
          iconTheme: const IconThemeData(color: Colors.black87),
          backgroundColor: Colors.amber,
        ),
        body: provider.status == ProviderStatusType.success
            ? GameDetailView(provider: provider)
            : ProviderStatusView(
                status: provider.status,
              ));
  }
}
