import 'package:flutter/material.dart';
import 'package:just_audio/just_audio.dart';
import 'package:music_player/pages/AudioPlayer.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  AudioPlayer _audioPlayer = AudioPlayer();

  List<String> songs = [
    'assets/songs/128-Abhi Mujh Mein Kahin - Agneepath 128 Kbps.mp3',
    'assets/songs/128-Abhi Na Jao Chhod Kar - Hum Dono (1962) 128 Kbps.mp3',
    'assets/songs/128-Agar Tum Mil JaoMale - Zeher 128 Kbps.mp3'
  ];

  int currentSongIndex = 0;

  void playNext() {
    if (currentSongIndex < songs.length - 1) {
      currentSongIndex++;
      playSong(songs[currentSongIndex]);
    }
  }

  void playPrevious() {
    if (currentSongIndex > 0) {
      currentSongIndex--;
      playSong(songs[currentSongIndex]);
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Music Player')),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              itemCount: songs.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text('Song ${index + 1}'),
                  onTap: () {
                    currentSongIndex = index;
                    playSong(songs[currentSongIndex]);
                  },
                );
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              IconButton(
                icon: Icon(Icons.skip_previous),
                onPressed: playPrevious,
              ),
              IconButton(
                icon: Icon(Icons.play_arrow),
                onPressed: () => playSong(songs[currentSongIndex]),
              ),
              IconButton(
                icon: Icon(Icons.pause),
                onPressed: pauseSong,
              ),
              IconButton(
                icon: Icon(Icons.skip_next),
                onPressed: playNext,
              ),
            ],
          ),
          StreamBuilder<Duration>(
            stream: _audioPlayer.positionStream,
            builder: (context, snapshot) {
              final position = snapshot.data ?? Duration.zero;
              return Slider(
                value: position.inSeconds.toDouble(),
                max: _audioPlayer.duration?.inSeconds.toDouble() ?? 1,
                onChanged: (value) {
                  _audioPlayer.seek(Duration(seconds: value.toInt()));
                },
              );
            },
          ),
        ],
      ),
    );
  }
}