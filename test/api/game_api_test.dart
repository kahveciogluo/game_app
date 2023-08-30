import 'package:flutter_test/flutter_test.dart';
import 'package:game_app/models/games.dart';
import 'package:game_app/service/game_service.dart';

void main() {
  test('Get Games', () async {
    final response = await GameService.getGames();
    expect(response is Future<List<Games>>, false);
    expect(response is Future<List<Games>>?, false);
    expect(response.results!.isEmpty, false);
  });

  test('Get Game Detail', () async {
    final response = await GameService.getGameDetail(gameId: 1);
    expect(response is Games, false);
    expect(response.id, 1);
  });
}
