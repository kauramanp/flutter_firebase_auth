class NotesModel {
  final String? id;
  final String? title;
  final String? description;

  NotesModel({
    this.id,
    this.title,
    this.description,
  });

  factory NotesModel.fromJson(Map<String, dynamic> json) => NotesModel(
        id: json["id"],
        title: json["title"],
        description: json["description"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "description": description,
      };
}
