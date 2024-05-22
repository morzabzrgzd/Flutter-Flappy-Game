import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/events.dart';
import 'package:flame/game.dart';
import 'package:flame/src/text/renderers/text_renderer.dart';
import 'package:flame/timer.dart';
import 'package:flapy_game/components/background.dart';
import 'package:flapy_game/components/bird.dart';
import 'package:flapy_game/components/ground.dart';
import 'package:flapy_game/components/pipe_group.dart';
import 'package:flapy_game/game/configuration.dart';
import 'package:flutter/material.dart';

class FlapyBirdGame extends FlameGame with TapDetector, HasCollisionDetection {
  late Bird bird;
  Timer interval = Timer(Config.pipeInterval, repeat: true);
  bool isHit = false;
  late TextComponent score;

  @override
  FutureOr<void> onLoad() {
    addAll([
      Background(),
      Ground(),
      bird = Bird(),
      PipeGroup(),
      score = buildScore(),
    ]);

    interval.onTick = () => add(PipeGroup());
  }

  @override
  void onTap() {
    super.onTap();
    bird.fly();
  }

  @override
  void update(double dt) {
    super.update(dt);
    interval.update(dt);
    score.text = 'Score: ${bird.score}';
  }

  TextComponent<TextRenderer> buildScore() {
    return TextComponent(
      text: 'Score: 0',
      position: Vector2(size.x / 2, size.y / 2 * 0.2),
      anchor: Anchor.center,
      textRenderer: TextPaint(
        style: const TextStyle(
          fontSize: 40,
          fontWeight: FontWeight.bold,
          fontFamily: 'Game',
        ),
      ),
    );
  }
}
