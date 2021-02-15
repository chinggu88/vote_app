import 'dart:async';
import 'dart:io';
import 'package:audioplayers/audio_cache.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:get/get.dart';

class VoteAudio extends GetxController {
  AudioCache player = AudioCache(prefix: 'assets/audios/');
  var advancedPlayer = AudioPlayer();
  var reultaudio = AudioPlayer();
  var bytes;

  void loadsound() async {}

  void playsound() async {
    bytes = await (await player.load('ddiring.mp3')).readAsBytes();
    advancedPlayer.playBytes(bytes);
  }

  void stopsound() async {
    // advancedPlayer.setReleaseMode(ReleaseMode.STOP);
    advancedPlayer.stop();
  }
}
