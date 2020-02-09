import 'package:equatable/equatable.dart';

class VideoModel  extends Equatable {

    String id;
    String title;
    String image;
    int viewCount;
    int likeCount;
    int dislikeCount;

    VideoModel({
        this.id, this.viewCount, this.title,
        this.likeCount, this.image, this.dislikeCount
    }) : super([ id, viewCount, title,
        likeCount, image, dislikeCount]);

    VideoModel.fromJson(Map<String, dynamic> data)cd
            this.viewCount = int.parse(data['viewCount']),
            this.title = data['title'],
            this.image = data['url'],
            this.likeCount = int.parse(data['likeCount']),
            this.dislikeCount = int.parse(data['dislikeCount']);



}