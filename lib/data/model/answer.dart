class Answer {
  String id;
  String subject;

  Answer({this.id, this.subject});

  Answer.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subject = json['subject'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['subject'] = this.subject;
    return data;
  }
}