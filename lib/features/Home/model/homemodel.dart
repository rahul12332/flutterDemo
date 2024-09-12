class UserListModel {
  dynamic userid;
  dynamic id;
  String title;
  String body;

  UserListModel({required this.title, required this.id, required this.body, required this.userid});

  factory UserListModel.fromJson(Map<String, dynamic> json) {
    return UserListModel(
      id: json['id'] as dynamic,
      body: json['body'] as String,
      title: json['title'] as String,
      userid: json['userId'] as dynamic,
    );
  }
}
