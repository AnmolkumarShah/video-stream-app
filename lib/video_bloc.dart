import 'dart:async';

enum videoAction {
  play,
  pause,
}

class VideoBloc {
  // data links
  static const List<String> videoList = [
    "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
    "https://firebasestorage.googleapis.com/v0/b/tempproject-71fed.appspot.com/o/Cave%20-%2045340.mp4?alt=media&token=640c74d2-1132-46bf-8229-544eb8d310cb",
    "https://firebasestorage.googleapis.com/v0/b/tempproject-71fed.appspot.com/o/Forest%20-%2049981.mp4?alt=media&token=a6c76c05-911c-4fef-9142-2a498fbab3cb",
    "https://firebasestorage.googleapis.com/v0/b/tempproject-71fed.appspot.com/o/Meditation%20-%2047799.mp4?alt=media&token=c574077a-82f7-49d9-9acc-9d7b0282639c",
    "https://firebasestorage.googleapis.com/v0/b/tempproject-71fed.appspot.com/o/Youtube%20-%2041789.mp4?alt=media&token=9e97259f-8af8-446c-9b9b-dc350caa8d4c",
    "https://commondatastorage.googleapis.com/gtv-videos-bucket/sample/ForBiggerBlazes.mp4",
  ];

  // video links stream controller
  final _stateStreamController = StreamController<List<String>>();
  StreamSink<List<String>> get stateSink => _stateStreamController.sink;
  Stream<List<String>> get stateStream => _stateStreamController.stream;

  // event stream controller
  final _eventStreamController = StreamController<videoAction>();
  StreamSink<videoAction> get eventSink => _eventStreamController.sink;
  Stream<videoAction> get eventStream => _eventStreamController.stream;

  // constructor
  VideoBloc() {
    stateSink.add(videoList);
  }

  void dispose() {
    _stateStreamController.close();
    _eventStreamController.close();
  }
}
