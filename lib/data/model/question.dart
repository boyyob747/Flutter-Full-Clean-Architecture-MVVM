
import 'answer.dart';

class Question {
  String id;
  String subject;
  List<Answer> answers;

  Question({this.id, this.subject, this.answers});

  Question.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    subject = json['subject'];
    if (json['answers'] != null) {
      answers = new List<Answer>();
      json['answers'].forEach((v) {
        answers.add(new Answer.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['subject'] = this.subject;
    if (this.answers != null) {
      data['answers'] = this.answers.map((v) => v.toJson()).toList();
    }
    return data;
  }
}