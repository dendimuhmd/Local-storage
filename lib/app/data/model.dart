import 'dart:developer';

class Notes{
int? id;
String title;
String description;
Notes({  this.id,required this.title,required this.description, });

factory Notes.fromMap(Map<String, dynamic>json){
  log(json['title']);
  return Notes(
    id:json['id'],
    title : json['title'],
    description : json['description'],);
}

Map<String, dynamic> toMap()=>{
  'id':id,
  "title" : title,
  'description':description,
};
}