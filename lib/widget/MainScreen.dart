import 'package:flame/game.dart';
import 'package:flame_sample_project/game/HardcoreCollisionGame.dart';
import 'package:flame_sample_project/game/PopPushGame.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('PopPushGame'),
      ),
      body: Center(
          child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ElevatedButton(
            child: Text('팝푸시'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => GameWidget(game: PopPushGame())),
              );
            },
          ),
          ElevatedButton(
            child: Text('충돌'),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        GameWidget(game: HardcoreCollisionGame())),
              );
            },
          ),
        ],
      )),
    );
  }
}
