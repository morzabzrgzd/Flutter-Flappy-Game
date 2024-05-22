import 'package:flame/game.dart';
import 'package:flapy_game/game/flapy_bird_game.dart';
import 'package:flapy_game/screens/game_over_screen.dart';
import 'package:flapy_game/screens/main_menu_screen.dart';
import 'package:flutter/material.dart';

void main() {
  final game = FlapyBirdGame();

  runApp(
    GameWidget(
      game: game,
      initialActiveOverlays: const [MainMenuScreen.id],
      overlayBuilderMap: {
        'mainmenu': (context, _) => MainMenuScreen(game: game),
        'gameover': (context, _) => GameOverScreen(game: game),
      },
    ),
  );
}
