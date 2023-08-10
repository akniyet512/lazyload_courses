class PostModel {
  final int userID;
  final int id;
  final String title;
  final String body;

  PostModel({
    required this.userID,
    required this.id,
    required this.title,
    required this.body,
  });

  static PostModel fromJson(Map<String, dynamic> json) {
    return PostModel(
      userID: json["userId"],
      id: json["id"],
      title: json["title"],
      body: json["body"],
    );
  }

  Map<String, dynamic> toJson(PostModel post) {
    return {
      "userId": userID,
      "id": id,
      "title": title,
      "body": body,
    };
  }
}
