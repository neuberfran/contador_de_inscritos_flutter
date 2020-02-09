
import 'dart:convert';

import 'package:contador_de_inscritos_flutter/models/channel_model.dart';
import 'package:contador_de_inscritos_flutter/utils/global.dart';
import 'package:http/http.dart' as http;


class ChannelRepository {

  static Future<ChannelModel> getChannel() async {

    http.Response response = await http.get(Global.getMyChannelUrl());

    var parsedJson = json.decode(response.body);
    Map<String, dynamic> mapJson = Map.castFrom(parsedJson);
    var items = mapJson['items'];
    Map<String, dynamic> itemsMap = Map.castFrom(items[0]);
    Map<String, dynamic> statisticsMap = itemsMap['statistics'];

    Map<String, dynamic> channelMap = Map();
    channelMap['id'] = itemsMap['id'];
    channelMap['viewCount'] = statisticsMap['viewCount'];
    channelMap['commentCount'] = statisticsMap['commentCount'];
    channelMap['subscriberCount']= statisticsMap['subscriberCount'];
    channelMap['videoCount'] = statisticsMap['videoCount'];

    return ChannelModel.fromJson(channelMap);

  }


}