
class Global {

  static const API_KEY = "MY KEY uDq1ET1CBNTfcqlTInGs4";

  static const CHANNEL_ID = "UCrtzrNR9ftwW229DxtBG6Xw";

  static const BASE_URL  = "https://www.googleapis.com/youtube/v3/";

  static String getMyChannelUrl()  {
      return BASE_URL + "channels/?part=statistics&id=$CHANNEL_ID&key=$API_KEY";
  }

  static String getMyLastVideoUrl() {
    return BASE_URL +
        "search/?part=snippet&channelId=$CHANNEL_ID&maxResults=1&order=date&type=video&key=$API_KEY";
  }

  static String getMyLastVideoStatisticsUrl(String videoId){
    return BASE_URL +
         "videos?part=statistics&id=$videoId&key=$API_KEY";

  }




}