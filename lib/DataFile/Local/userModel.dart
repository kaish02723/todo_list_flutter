

class UserTaskModel {
  final int? id;
  final String title;
  final String description;

  UserTaskModel({this.id, required this.title, required this.description});

  Map<String,dynamic> toMap(){
    return {
      'id':id,
      'title':title,
      'description':description
    };
  }

  factory UserTaskModel.formMap(Map<String,dynamic>map){
    return UserTaskModel(title: map['title'], description: map['description']);
  }
}