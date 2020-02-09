import 'package:contador_de_inscritos_flutter/models/channel_model.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ChannelState extends Equatable {
  ChannelState([List props = const []]) : super(props);
}

class InitialChannelState extends ChannelState {}

class LoadingChannelState extends ChannelState {}

class LoadedChannelState extends ChannelState {

  final ChannelModel channelModel;

  LoadedChannelState(this.channelModel) : super([channelModel]);

}
