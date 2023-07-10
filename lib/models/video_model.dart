class Video{

  String? id;
  String? title;
  String? description;
  String? image;
  String? channel;

  Video({this.id, this.title, this.description, this.image, this.channel,});


  // ##################  Convertendo dados Json  ###############

  //Construtor com Factory funciona como o static, a diferneça é que o retorno é de apenas um único objeto
  //Usando apenas uma instância tendo uma economia de memoria ram
  factory Video.fromJson(Map<String, dynamic> json){
    return Video(
      id: json['id']['videoId'],
      title: json['snippet']['title'],
      image: json['snippet']['thumbnails']['high']['url'],
      description: json['snippet']['description'],
      channel: json['snippet']['channelTitle'],
    );
  }

}