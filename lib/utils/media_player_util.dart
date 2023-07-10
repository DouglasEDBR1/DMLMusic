import 'dart:io';

class MediaPlayerUtil {

  static imageFile(String asset){
    String path = asset;
    File imageFile = File(path);
    return imageFile;
  }

}