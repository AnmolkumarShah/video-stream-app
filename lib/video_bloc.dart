import 'dart:async';

import 'package:answer_app/widgets/image_card.dart';
import 'package:flutter/material.dart';

import './widgets/video_card.dart';

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
  ];

  static const List<String> imageList = [
    "https://cdn.pixabay.com/photo/2020/12/06/14/30/castle-5808966__480.jpg",
    "https://cdn.pixabay.com/photo/2020/12/02/11/43/cat-5797290__480.jpg",
    "https://cdn.pixabay.com/photo/2020/12/07/17/36/christmas-5812446__480.png",
    "https://cdn.pixabay.com/photo/2020/12/08/18/36/tiger-5815247__480.jpg",
    "https://cdn.pixabay.com/photo/2020/11/24/12/23/flowering-dogwood-5772385__480.jpg",
  ];

  // video links stream controller
  final _stateStreamController = StreamController<List<Widget>>();
  StreamSink<List<Widget>> get stateSink => _stateStreamController.sink;
  Stream<List<Widget>> get stateStream => _stateStreamController.stream;

  // event stream controller
  final _eventStreamController = StreamController<videoAction>();
  StreamSink<videoAction> get eventSink => _eventStreamController.sink;
  Stream<videoAction> get eventStream => _eventStreamController.stream;

  // constructor
  VideoBloc() {
    final List<VideoCard> videos =
        videoList.map((link) => VideoCard(link)).toList();
    final List<ImageCard> images =
        imageList.map((link) => ImageCard(link)).toList();
    List<Widget> toShowList = [];
    toShowList.addAll(videos);
    toShowList.addAll(images);
    toShowList.shuffle();
    stateSink.add(toShowList);
  }

  void dispose() {
    _stateStreamController.close();
    _eventStreamController.close();
  }
}
