class VideoApi{

  static final youtube_key_api = Uri.parse('AIzaSyAbF23f66Gp6afubOM_FgpZulbm_dkHOOk');
  static final channel_id = Uri.parse('UCZFsg_pjXp-NyK3Eg1uhyMg');
  //static final base_url =  Uri.parse('https://www.googleapis.com/youtube/v3/');

  static Uri url(
      String search,
      String snippet,
      String typeVideo,
      String maxResult,
      String order,
      String keyYoutubeApi,
     // String channelID,
      String query
      ){
    var baseUrl = Uri.parse('https://www.googleapis.com/youtube/v3/$search$snippet$typeVideo$maxResult$order$keyYoutubeApi$query');
    return baseUrl;
  }


}