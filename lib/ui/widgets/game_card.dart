import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:game_app/provider/game_provider.dart';
import 'package:game_app/ui/pages/game_detail_page.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';

class GameCard extends StatelessWidget {
  final GameProvider provider;
  final int index;

  const GameCard({super.key, required this.provider, required this.index});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        provider.getGameDetail(gameId: provider.games[index].id!);
        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  GameDetailPage(gameId: provider.games[index].id!)),
        );
      },
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            // Background image
            Flexible(
              child: (provider.games[index].backgroundImage != null)
                  ? CachedNetworkImage(
                      imageUrl: provider.games[index].backgroundImage!,
                      imageBuilder: (context, imageProvider) => Container(
                        height: 200,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10)),
                          image: DecorationImage(
                              image: imageProvider, fit: BoxFit.cover),
                        ),
                      ),
                      progressIndicatorBuilder:
                          (context, url, downloadProgress) => Center(
                        child: CircularProgressIndicator(
                          value: downloadProgress.progress,
                          color: Colors.black87,
                        ),
                      ),
                      errorWidget: (context, url, error) => const Icon(
                        Icons.error,
                        size: 10,
                        color: Colors.amber,
                      ),
                    )
                  : Container(
                      height: 200,
                      decoration: const BoxDecoration(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10))),
                    ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  // Name
                  Expanded(
                    flex: 4,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          provider.games[index].name ?? '',
                          style: const TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w700),
                        ),
                        const SizedBox(height: 8),
                        // Genre
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Image.asset('assets/images/types.png',
                                width: 16, height: 16),
                            const SizedBox(width: 5),
                            Text(
                              provider.games[index].genres?[0].name ?? '',
                              style: const TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w500),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 10),
                  // Rating
                  if (provider.games[index].rating != null)
                    Expanded(
                      flex: 1,
                      child: CircularPercentIndicator(
                          radius: 16,
                          lineWidth: 2,
                          backgroundColor: Colors.amber,
                          percent: provider.games[index].rating! / 5,
                          progressColor: Colors.green,
                          center: Text(
                            provider.games[index].rating!.toStringAsFixed(1),
                            style: const TextStyle(fontSize: 10),
                          )),
                    )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
