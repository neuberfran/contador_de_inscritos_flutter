import 'dart:convert';

import 'package:contador_de_inscritos_flutter/models/video_model.dart';
import 'package:contador_de_inscritos_flutter/utils/global.dart';
import 'package:http/http.dart' as http;

class VideoRepository {

  static Future<VideoModel>  getMyLastVideo() async {
      http.Response  response = await http.get(Global.getMyLastVideoUrl());

      var parsedJson = json.decode(response.body);

      Map<String, dynamic> mapJson = Map.castFrom(parsedJson);

      var items = mapJson['items'];
      Map<String, dynamic> itemsMap = Map.castFrom(items[0]);
      Map<String, dynamic> snippetMap = itemsMap['snippet'];
      Map<String, dynamic> idMap = itemsMap['id'];
      Map<String, dynamic> thumbNailMap = snippetMap['thumbnails'];
      Map<String, dynamic> highQualityThumbNailMap = thumbNailMap['high'];

      http.Response videoStatisticsResponse = await http.get(Global.getMyLastVideoStatisticsUrl(idMap['videoId']));

      var parsedStatisticsJson = json.decode(videoStatisticsResponse.body);

      Map<String, dynamic> mapJsonStatistics = Map.castFrom(parsedStatisticsJson);
      var itemsStatistics = mapJsonStatistics['items'];
      Map<String, dynamic> itemsStatisticsMap = Map.castFrom(itemsStatistics[0]);
      Map<String, dynamic> statisticsMap = itemsStatisticsMap['statistics'];


      Map<String, dynamic> videoMap = Map();
      videoMap['videoId'] = idMap['videoId'];
      videoMap['title'] = snippetMap['title'];
      videoMap['url'] = highQualityThumbNailMap['url'];
      videoMap['likeCount'] = statisticsMap['likeCount'];
      videoMap['viewCount'] = statisticsMap['viewCount'];
      videoMap['dislikeCount'] = statisticsMap['dislikeCount'];



      return  VideoModel.fromJson(videoMap);
  }


}