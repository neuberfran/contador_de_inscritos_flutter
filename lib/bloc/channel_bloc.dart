import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:contador_de_inscritos_flutter/models/channel_model.dart';
import 'package:contador_de_inscritos_flutter/repository/channel_repository.dart';
import './bloc.dart';

class ChannelBloc extends Bloc<ChannelEvent, ChannelState> {
  @override
  ChannelState get initialState => InitialChannelState();

  @override
  Stream<ChannelState> mapEventToState(
    ChannelEvent event,
  ) async* {
    if(event is GetChannel) {
      yield LoadingChannelState();
      final ChannelModel channel = await ChannelRepository.getChannel();
      yield LoadedChannelState(channel);

    }
  }


}


