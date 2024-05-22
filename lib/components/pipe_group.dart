import 'dart:async';
import 'dart:math';

import 'package:flame/components.dart';
import 'package:flame_audio/flame_audio.dart';
import 'package:flapy_game/components/pipe.dart';
import 'package:flapy_game/game/assets.dart';
import 'package:flapy_game/game/configuration.dart';
import 'package:flapy_game/game/flapy_bird_game.dart';
import 'package:flapy_game/game/pipe_position.dart';
import 'package:flutter/material.dart';

class PipeGroup extends PositionComponent with HasGameRef<FlapyBirdGame> {
  PipeGroup();

  final random = Random();
  @override
  FutureOr<void> onLoad() {
    position.x = gameRef.size.x;
    final heightMinusGround = gameRef.size.y - Config.groundHeight;
    final spacing = 100 + random.nextDouble() * (heightMinusGround / 4);
    final centerY =
        spacing + random.nextDouble() * (heightMinusGround - spacing);

    addAll([
      Pipe(height: centerY - spacing / 2, pipePosition: PipePosition.top),
      Pipe(
          height: heightMinusGround - (centerY + spacing / 2),
          pipePosition: PipePosition.bottom),
    ]);
  }

  @override
  void update(double dt) {
    super.update(dt);
    position.x -= Config.gameSpeed * dt;

    if (position.x < -20) {
      removeFromParent();
      print('Remove');
      updateScore();
    }
    if (game.isHit) {
      removeFromParent();
      gameRef.isHit = false;
    }
  }

  void updateScore() {
    gameRef.bird.score += 1;
    FlameAudio.play(Assets.point);
  }
}
