import 'package:cached_network_image/cached_network_image.dart';
import 'package:contador_de_inscritos_flutter/bloc/bloc.dart';
import 'package:contador_de_inscritos_flutter/models/channel_model.dart';
import 'package:contador_de_inscritos_flutter/models/video_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

class MainPage extends StatefulWidget {
  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {

  final _channelBloc = ChannelBloc();
  final _videoBloc = VideoBloc();

  @override
  Widget build(BuildContext context) {

    final RefreshController _refreshController = RefreshController();


    return WillPopScope(
      onWillPop: doesntAllowReturn,
      child: Scaffold(
        body: SmartRefresher(
          controller: _refreshController,
          enablePullDown: true,
          onRefresh: () {
            this._channelBloc.dispatch(GetChannel());
            this._videoBloc.dispatch(GetVideo());
            _refreshController.refreshCompleted();
          },
          child: Column(
            children: <Widget>[
              Container(
                  margin: EdgeInsets.fromLTRB(0, 50, 0, 20),
                  child: Center(
                    child: Image(
                      width: 150,
                      alignment: Alignment.center,
                      image: AssetImage('assets/images/logo_ytb_lapadev.png'),
                    ),
                  )),
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Padding(
                              padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
                              child:  Text(
                                "Inscritos:",
                                style: TextStyle(fontWeight: FontWeight.bold,
                                    fontSize: 24),
                              ),
                            ),

                            Text(
                              "Visualizações:",
                              style: TextStyle(fontWeight: FontWeight.bold,
                                  fontSize: 24),
                            )
                          ],
                        ),
                      )
                  ),
                  BlocBuilder(
                    bloc: _channelBloc,
                    builder: (BuildContext context, ChannelState state) {
                      if (state is InitialChannelState) {
                        return _buildInitialContainer();
                      } else if (state is LoadingChannelState) {
                        return _buildLoading();
                      } else if (state is LoadedChannelState) {
                        return _buildLoadedChannelContainer(state.channelModel);
                      } else {
                        return _buildLoading();
                      }
                    },
                  )
                ],
              ),
              Padding(
                padding: EdgeInsets.fromLTRB(10, 15, 10, 10),
                child: Divider(
                  color: Theme.of(context).dividerColor,
                ),
              ),
              BlocBuilder(
                bloc: _videoBloc,
                builder: (BuildContext context, VideoState state) {
                  if (state is InitialVideoState) {
                    return _buildInitialContainer();
                  } else if (state is LoadingVideoState) {
                    return _buildLoading();
                  } else if (state is LoadedVideoState) {
                    return _buildVideoRow(state.videoModel);
                  } else {
                    return _buildLoading();
                  }
                },
              )
            ],
          ),
        )
      ),
    );
  }

  Future<bool> doesntAllowReturn() async {
    return await false;
  }

  Container _buildInitialContainer() {
    return Container(child: Text(''));
  }

  Container _buildLoading() {
    return Container(
      margin: EdgeInsets.fromLTRB(10, 0, 0, 0),
      child: Center(
        child: CircularProgressIndicator(
          strokeWidth: 1,
        ),
      ),
    );
  }

  Container _buildLoadedChannelContainer(ChannelModel channel) {

    return Container(
      padding: EdgeInsets.fromLTRB(40, 0, 0, 0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Padding(
            padding: EdgeInsets.fromLTRB(0, 0, 0, 10),
            child:  Text(channel.subscriberCount.toString()
              , style: TextStyle(
                  fontSize: 22
              ),),
          ),
          Text(
            channel.viewCount.toString(),
            style: TextStyle(
                fontSize: 22
            ),
          ),
        ],
      ),
    );
  }

  Row _buildVideoRow(VideoModel videoModel) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Container(
          margin: EdgeInsets.fromLTRB(25, 0, 0, 0),
          child: Center(
            child: Image(
              width: 120,
              image: CachedNetworkImageProvider(videoModel.image),
            ),
          )
        ),
        Flexible(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.fromLTRB(5, 0, 0, 0),
                child: Text(
                  videoModel.title,
                  textAlign: TextAlign.start,
                  style: TextStyle(fontSize: 16),
                ) ,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 5),
                child: Row(
                  children: <Widget>[
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 5, 0, 3),
                          child: Text(
                            'Visualizacões: ',
                            textAlign: TextAlign.start,
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                        ),
                        Text(
                          'Likes: ',
                          textAlign: TextAlign.start,
                          style: TextStyle(
                              fontSize: 14, fontWeight: FontWeight.bold),
                        )
                      ],
                    ),
                    Column(
                      children: <Widget>[
                        Padding(
                          padding: EdgeInsets.fromLTRB(0, 5, 0, 3),
                          child:  Text(
                            videoModel.viewCount.toString(),
                            textAlign: TextAlign.start,
                            style: TextStyle(fontSize: 13),
                          ),
                        ),
                        Text(
                          videoModel.likeCount.toString(),
                          textAlign: TextAlign.start,
                          style: TextStyle(fontSize: 13),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        )
      ],
    );
  }

  @override
  void initState() {
    super.initState();
    _channelBloc.dispatch(GetChannel());
    _videoBloc.dispatch(GetVideo());
  }

  @override
  void dispose() {
    super.dispose();
    _channelBloc.dispose();
    _videoBloc.dispose();
  }
}
