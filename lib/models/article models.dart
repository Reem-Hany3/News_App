class ArticleModel {
  String? author;
  String? image;
  String? date;
  String? title;
  String? description;
  String? content;

  ArticleModel({
    this.author,
    this.image,
    this.title,
    this.date,
    this.description,
    this.content,
  });

  ArticleModel.fromJson(Map<String, dynamic> json) {
    author = json['author'];
    image = json['urlToImage'];
    title = json['title'];
    date = json['publishedAt'];
    description = json['description'];
    content = json['content'];
  }
}