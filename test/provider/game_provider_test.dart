import 'package:flutter_test/flutter_test.dart';
import 'package:game_app/provider/game_provider.dart';

void main() {
  var gameProvider = GameProvider();

  test('get game list', () async {
    await gameProvider.getGameList();
    expect(gameProvider.games.isNotEmpty, true);
  });

  test('get game detail', () async {
    await gameProvider.getGameDetail(gameId: 1);
    expect(gameProvider.game.id == 1, true);
  });
}
