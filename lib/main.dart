import 'package:answer_app/video_bloc.dart';
import 'package:better_player/better_player.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: MyHomePage(title: 'Video App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _videoBloc = VideoBloc();

  @override
  void dispose() {
    super.dispose();
    _videoBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: StreamBuilder(
        stream: _videoBloc.stateStream,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error),
            );
          } else if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data.length,
              itemBuilder: (context, index) {
                return Container(
                  height: 500,
                  margin: EdgeInsets.symmetric(vertical: 2.5),
                  child: AspectRatio(
                    aspectRatio: 1,
                    child: BetterPlayerListVideoPlayer(
                      BetterPlayerDataSource(
                        BetterPlayerDataSourceType.NETWORK,
                        "${snapshot.data[index]}",
                      ),
                      key: Key(snapshot.data[index].hashCode.toString()),
                      playFraction: 1,
                      autoPause: true,
                      autoPlay: true,
                      configuration: BetterPlayerConfiguration(
                        fit: BoxFit.cover,
                        aspectRatio: 0.5,
                        looping: true,
                        autoPlay: true,
                        controlsConfiguration:
                            BetterPlayerControlsConfiguration(
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
              },
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
