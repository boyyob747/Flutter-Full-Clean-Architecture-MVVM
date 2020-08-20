import 'package:flutter_app_clean_architecture/data/model/questionnaire.dart';

abstract class QuestionnaireApi {
  Future<List<Questionnaire>> getQuestionnaireList();
}