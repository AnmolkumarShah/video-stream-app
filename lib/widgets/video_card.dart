import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';

class VideoCard extends StatelessWidget {
  final String videoLink;
  VideoCard(this.videoLink);
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 500,
      margin: EdgeInsets.symmetric(vertical: 2.5),
      child: AspectRatio(
        aspectRatio: 1,
        child: BetterPlayerListVideoPlayer(
          BetterPlayerDataSource(
            BetterPlayerDataSourceType.NETWORK,
            "$videoLink",
          ),
          key: Key(videoLink.hashCode.toString()),
          playFraction: 1,
          autoPause: true,
          autoPlay: true,
          configuration: BetterPlayerConfiguration(
            fit: BoxFit.cover,
            aspectRatio: 0.5,
            looping: true,
            autoPlay: true,
            showPlaceholderUntilPlay: true,
            placeholder: Container(
              height: 500,
              width: double.infinity,
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [
                    Colors.blue,
                    Colors.red,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
              ),
            ),
            controlsConfiguration: BetterPlayerControlsConfiguration(
              enableProgressBar: false,
              controlBarColor: Colors.white54,
              enableFullscreen: false,
              enableOverflowMenu: false,
              enablePlayPause: true,
            ),
            errorBuilder: (context, errorMessage) {
              return Center(
                child: Column(
                  children: [
                    Icon(
                      Icons.error,
                      color: Colors.white,
                      size: 60,
                    ),
                    Text(
                      errorMessage,
                      style: TextStyle(color: Colors.white54),
                    ),
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
