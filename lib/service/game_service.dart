import 'package:game_app/models/game.dart';
import 'package:game_app/models/games.dart';
import 'package:game_app/service/service_manager.dart';

class GameService {
  static Future<Games> getGames() async {
    final response = await ServiceManager.instance
        .apiCall<Games>('games', Games(), RequestType.get);

    return response;
  }

  static Future<Game> getGameDetail({required int gameId}) async {
    final response = await ServiceManager.instance
        .apiCall<Game>('games/$gameId', Game(), RequestType.get);
    return response;
  }
}
