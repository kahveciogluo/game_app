import 'package:flutter/material.dart';
import 'package:game_app/models/game.dart';
import 'package:game_app/models/games.dart';
import 'package:game_app/provider/provider_status.dart';
import 'package:game_app/service/game_service.dart';

class GameProvider extends ChangeNotifier {
  ProviderStatusType _status = ProviderStatusType.initialized;
  List<Result> _games = [];
  Game _game = Game();

  ProviderStatusType get status => _status;
  List<Result> get games => _games;
  Game get game => _game;

  GameProvider() {
    getGameList();
  }

  Future<void> getGameList() async {
    _status = ProviderStatusType.loading;
    _games = [];
    notifyListeners();
    try {
      final Games gameList = await GameService.getGames();
      if (gameList.results!.isNotEmpty) {
        _games = gameList.results!;
        _status = ProviderStatusType.success;
      } else {
        _status = ProviderStatusType.empty;
      }
    } catch (_) {
      _status = ProviderStatusType.failed;
    }
    notifyListeners();
  }

  Future<void> getGameDetail({required int gameId}) async {
    _status = ProviderStatusType.loading;
    _game = Game();
    notifyListeners();

    try {
      final Game g = await GameService.getGameDetail(gameId: gameId);
      _game = g;
      _status = ProviderStatusType.success;
    } catch (_) {
      _status = ProviderStatusType.failed;
    }
    notifyListeners();
  }
}
