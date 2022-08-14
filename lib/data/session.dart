class Session {
  int id = 0;
  String description = "";
  int duration = 0;
  String date = "";
  Session(this.id , this.description, this.duration , this.date);

  Session.fromJson(Map<String,dynamic> obj){
    id = obj["id"];
    description = obj["description"];
    duration = obj["duration"];
    date = obj["date"];
  }
  Map<String , dynamic> toJson(){
    return {
      "id" : id,
      "description" : description,
      "duration" : duration,
      "date" : date
    };
  } 
}