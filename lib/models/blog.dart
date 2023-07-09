class Blog {
  final int id;
  final String title;
  final String subtitle;
  final String imageUri;
  final String uri;
  final int order;

  Blog({
    required this.id,
    required this.title,
    required this.subtitle,
    required this.imageUri,
    required this.uri,
    required this.order,
  });

  factory Blog.fromJson(Map<String, dynamic> json) {
    return Blog(
      id: json['id'],
      title: json['title'],
      subtitle: json['subtitle'],
      imageUri: json['image_uri'],
      uri: json['uri'],
      order: json['order'],
    );
  }
}
