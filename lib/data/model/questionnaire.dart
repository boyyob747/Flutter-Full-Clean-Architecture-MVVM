
import 'question.dart';

class Questionnaire {
  String sId;
  String id;
  String subject;
  int no;
  bool status;
  String registerBy;
  String registerDate;
  String updateBy;
  String updateDate;
  List<Question> questions;

  Questionnaire(
      {this.sId,
        this.id,
        this.subject,
        this.no,
        this.status,
        this.registerBy,
        this.registerDate,
        this.updateBy,
        this.updateDate,
        this.questions});

  Questionnaire.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    id = json['id'];
    subject = json['subject'];
    no = json['no'];
    status = json['status'];
    registerBy = json['register_by'];
    registerDate = json['register_date'];
    updateBy = json['update_by'];
    updateDate = json['update_date'];
    if (json['questions'] != null) {
      questions = new List<Question>();
      json['questions'].forEach((v) {
        questions.add(new Question.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['id'] = this.id;
    data['subject'] = this.subject;
    data['no'] = this.no;
    data['status'] = this.status;
    data['register_by'] = this.registerBy;
    data['register_date'] = this.registerDate;
    data['update_by'] = this.updateBy;
    data['update_date'] = this.updateDate;
    if (this.questions != null) {
      data['questions'] = this.questions.map((v) => v.toJson()).toList();
    }
    return data;
  }
}