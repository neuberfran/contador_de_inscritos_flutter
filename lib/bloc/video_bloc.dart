import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:contador_de_inscritos_flutter/models/video_model.dart';
import 'package:contador_de_inscritos_flutter/repository/video_repository.dart';
import './bloc.dart';

class VideoBloc extends Bloc<VideoEvent, VideoState> {
  @override
  VideoState get initialState => InitialVideoState();

  @override
  Stream<VideoState> mapEventToState(
    VideoEvent event,
  ) async* {

    if(event is GetVideo) {
      yield LoadingVideoState();
      final VideoModel videoModel = await VideoRepository.getMyLastVideo();
      yield LoadedVideoState(videoModel);
    }

  }



  }
