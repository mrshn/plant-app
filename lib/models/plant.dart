class PlantModel {
  int id;
  String name;
  DateTime createdAt;
  DateTime updatedAt;
  DateTime publishedAt;
  String title;
  int rank;
  PlantImage image;

  PlantModel({
    required this.id,
    required this.name,
    required this.createdAt,
    required this.updatedAt,
    required this.publishedAt,
    required this.title,
    required this.rank,
    required this.image,
  });

  factory PlantModel.fromJson(Map<String, dynamic> json) {
    return PlantModel(
      id: json['id'],
      name: json['name'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
      publishedAt: DateTime.parse(json['publishedAt']),
      title: json['title'],
      rank: json['rank'],
      image: PlantImage.fromJson(json['image']),
    );
  }
}

class PlantImage {
  int id;
  String name;
  String? alternativeText;
  String? caption;
  int width;
  int height;
  String? formats;
  String hash;
  String ext;
  String mime;
  double size;
  String url;
  String? previewUrl;
  String provider;
  String? providerMetadata;
  DateTime createdAt;
  DateTime updatedAt;

  PlantImage({
    required this.id,
    required this.name,
    this.alternativeText,
    this.caption,
    required this.width,
    required this.height,
    this.formats,
    required this.hash,
    required this.ext,
    required this.mime,
    required this.size,
    required this.url,
    this.previewUrl,
    required this.provider,
    this.providerMetadata,
    required this.createdAt,
    required this.updatedAt,
  });

  factory PlantImage.fromJson(Map<String, dynamic> json) {
    return PlantImage(
      id: json['id'],
      name: json['name'],
      alternativeText: json['alternativeText'],
      caption: json['caption'],
      width: json['width'],
      height: json['height'],
      formats: json['formats'],
      hash: json['hash'],
      ext: json['ext'],
      mime: json['mime'],
      size: json['size'].toDouble(),
      url: json['url'],
      previewUrl: json['previewUrl'],
      provider: json['provider'],
      providerMetadata: json['provider_metadata'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }
}
