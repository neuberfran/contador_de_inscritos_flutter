import 'package:contador_de_inscritos_flutter/models/video_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class VideoState extends Equatable {
  VideoState([List props = const []]) : super(props);
}

class InitialVideoState extends VideoState {}

class LoadingVideoState extends VideoState {}

class LoadedVideoState extends VideoState {

  final VideoModel videoModel;

  LoadedVideoState(this.videoModel) : super([videoModel]);

}
