class SimpsonsCharacter {
  final String name;
  final String text;
  final String firstUrl;
  final String imageUrl;
  final String description;

  SimpsonsCharacter( {
    required this.name,
    required this.firstUrl,
    required this.text,
    required this.imageUrl,
    required this.description,
  });

  factory SimpsonsCharacter.fromJson(Map<String, dynamic> json) {
    String text = json['Text'] ?? "";
    List<String> parts = text.split(" - ");
    String name = parts.isNotEmpty ? parts.first : "";

    return SimpsonsCharacter(
      text: text,
      name: name,
      imageUrl: json['Icon']['URL'] != null
          ? 'https://duckduckgo.com${json['Icon']['URL']}'
          : 'your_placeholder_image_url_here', // Provide a placeholder image URL
      description: json['Result'] ?? "",
      firstUrl: json["FirstURL"] ?? "", // If you need it, you can include it here
    );
  }
}

