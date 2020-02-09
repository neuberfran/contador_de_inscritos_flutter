import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ChannelEvent extends Equatable {

  ChannelEvent([List props = const[]]) : super(props);

}

class GetChannel extends ChannelEvent {
  String id;
  int viewCount;
  int commentCount;
  int subscriberCount;
  int videoCount;
  GetChannel() : super();

}

