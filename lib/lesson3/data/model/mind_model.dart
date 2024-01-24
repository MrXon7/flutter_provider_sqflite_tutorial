class MindModel {
  String mind;
  String author;

  MindModel({
    required this.author,
    required this.mind,
  });

  factory MindModel.fromJson(Map<String, dynamic> json) {
    return MindModel(
        author: json["author"] ?? "Hechkim", mind: json["mind"] ?? "Tinch");
  }

  toJson() {
    return {
      "mind":mind,
      "author":author
    };
  }
}
