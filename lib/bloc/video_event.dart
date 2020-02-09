import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class VideoEvent extends Equatable {
  VideoEvent([List props = const[]]) : super(props);
}


class GetVideo extends VideoEvent {


  GetVideo() : super();

}

