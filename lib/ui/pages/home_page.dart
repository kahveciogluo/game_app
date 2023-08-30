import 'package:flutter/material.dart';
import 'package:game_app/provider/provider_status.dart';
import 'package:game_app/provider/game_provider.dart';
import 'package:game_app/ui/widgets/game_card.dart';
import 'package:game_app/ui/widgets/provider_status_view.dart';
import 'package:provider/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<GameProvider>();
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text(
              'Games',
              style: TextStyle(color: Colors.black87, fontSize: 16),
            ),
            backgroundColor: Colors.amber,
          ),
          body: provider.status == ProviderStatusType.success
              // Game Cards
              ? Padding(
                  padding: const EdgeInsets.only(left: 5, right: 5, top: 10),
                  child: GridView.builder(
                      shrinkWrap: true,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 5),
                      itemCount: provider.games.length,
                      itemBuilder: (context, index) {
                        return GameCard(provider: provider, index: index);
                      }),
                )
              : ProviderStatusView(
                  status: provider.status,
                )),
    );
  }
}
