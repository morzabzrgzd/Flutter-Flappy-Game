import 'package:flame/game.dart';
import 'package:flapy_game/game/assets.dart';
import 'package:flapy_game/game/flapy_bird_game.dart';
import 'package:flutter/material.dart';

class GameOverScreen extends StatelessWidget {
  final FlapyBirdGame game;
  static const String id = 'gameover';
  const GameOverScreen({super.key, required this.game});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.black45,
      child: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Score: ${game.bird.score}',
              style: const TextStyle(
                fontSize: 60,
                fontFamily: 'Game',
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Image.asset(Assets.gameOver),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              onPressed: onRestart,
              child: const Text(
                'Restart',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }

  void onRestart() async {
    await game.overlays.remove('gameover');
    game.bird.reset();
    game.resumeEngine();
  }
}
