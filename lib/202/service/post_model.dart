
class PostModelService {
/*
{
  "userId": 1,
  "id": 1,
  "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
  "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
} 
*/

  int? userId;
  int? id;
  String? title;
  String? body;

  PostModelService({
    this.userId,
    this.id,
    this.title,
    this.body,
  });
  PostModelService.fromJson(Map<String, dynamic> json) {
    userId = json['userId']?.toInt();
    id = json['id']?.toInt();
    title = json['title']?.toString();
    body = json['body']?.toString();
  }
  //! SERVİSTEN ALIP VERİR BURAYA KOD YAZMA 
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['userId'] = userId;
    data['id'] = id;
    data['title'] = title;
    data['body'] = body;
    return data;
  }
}
