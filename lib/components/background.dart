import 'dart:async';

import 'package:flame/components.dart';
import 'package:flame/flame.dart';
import 'package:flapy_game/game/assets.dart';
import 'package:flapy_game/game/flapy_bird_game.dart';

class Background extends SpriteComponent with HasGameRef<FlapyBirdGame> {
  Background();

  @override
  FutureOr<void> onLoad() async {
    final background = await Flame.images.load(Assets.backgorund);
    size = gameRef.size;
    sprite = Sprite(background);
  }
}
