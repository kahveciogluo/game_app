import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:game_app/provider/game_provider.dart';
import 'package:game_app/utils/date_util.dart';
import 'package:game_app/utils/redirect_util.dart';

class GameDetailView extends StatelessWidget {
  final GameProvider provider;
  const GameDetailView({super.key, required this.provider});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          // Background image
          if (provider.game.backgroundImage != null)
            CachedNetworkImage(
              imageUrl: provider.game.backgroundImage!,
              imageBuilder: (context, imageProvider) => Container(
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(10)),
                  image:
                      DecorationImage(image: imageProvider, fit: BoxFit.cover),
                ),
              ),
              progressIndicatorBuilder: (context, url, downloadProgress) =>
                  Center(
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
            ),
          const SizedBox(height: 10),
          // Name
          Text(
            provider.game.name ?? '',
            style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w800),
          ),
          const SizedBox(height: 10),
          // Released Date
          Text(
              'Released Date: ${DateUtil.dateFormatAsDDMMYYYY(provider.game.released!)}'),
          const SizedBox(height: 10),
          // Update Date
          Text(
              'Last Update: ${DateUtil.dateFormatAsDDMMYYYY(provider.game.updated!)}'),
          const SizedBox(height: 10),
          // Website
          ElevatedButton(
            onPressed: () => RedirectUtil.openUrl(provider.game.website!),
            style: ButtonStyle(
                backgroundColor:
                    MaterialStateProperty.all<Color>(Colors.amber)),
            child: const Text(
              'Go To Website',
              style: TextStyle(color: Colors.black87, fontSize: 12),
            ),
          ),
          const SizedBox(height: 5),
          // Description
          Html(
            data: provider.game.description?.toString() ?? '',
            style: {
              "body": Style(
                fontSize: FontSize(16),
                fontWeight: FontWeight.w300,
              ),
            },
          ),
          const SizedBox(height: 10),
        ],
      ),
    ));
  }
}
