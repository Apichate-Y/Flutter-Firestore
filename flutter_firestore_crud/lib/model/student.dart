class Student {
  String id;
  String name;
  String subject;

  Student({this.id, this.name, this.subject});

  Student.fromMap(Map<String, dynamic> data, String id) :
    id = id,
    name = data['name'],
    subject = data['subject'];
  

  Map<String, dynamic> toMap() {
    return {
      "name" : name,
      "subject":subject,
    };
  }
}
