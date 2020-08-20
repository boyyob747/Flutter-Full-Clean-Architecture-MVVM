import 'package:flutter_app_clean_architecture/data/model/questionnaire.dart';

abstract class QuestionnaireRepository {
  Future<List<Questionnaire>> getQuestionnaireList();
}