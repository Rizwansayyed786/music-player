import 'package:just_audio/just_audio.dart';

AudioPlayer _audioPlayer = AudioPlayer();

Future<void> playSong(String songPath) async {
  await _audioPlayer.setAsset(songPath);
  _audioPlayer.play();
}

void pauseSong() {
  _audioPlayer.pause();
}
