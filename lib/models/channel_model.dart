
import 'package:equatable/equatable.dart';

class ChannelModel extends Equatable {

  String id;
  int viewCount;
  int commentCount;
  int subscriberCount;
  int videoCount;

  ChannelModel({
    this.id, this.viewCount, this.commentCount,
    this.subscriberCount, this.videoCount
  }) : super([ id, viewCount, commentCount,
    subscriberCount, videoCount]);

  ChannelModel.fromJson(Map<String, dynamic> data)
      : this.id = data['id'],
        this.viewCount = int.parse(data['viewCount']),
        this.commentCount = int.parse(data['commentCount']),
        this.subscriberCount = int.parse(data['subscriberCount']),
        this.videoCount = int.parse(data['videoCount']);
}