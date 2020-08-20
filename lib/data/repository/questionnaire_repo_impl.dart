import 'package:flutter_app_clean_architecture/data/model/questionnaire.dart';
import 'package:flutter_app_clean_architecture/data/remote/questionnaire_api.dart';
import 'package:flutter_app_clean_architecture/data/repository/questionnaire_repo.dart';

class QuestionnaireRepoImpl implements QuestionnaireRepository{
  QuestionnaireApi api;
  QuestionnaireRepoImpl ( QuestionnaireApi api) {
    this.api = api;
  }

  @override
  Future<List<Questionnaire>> getQuestionnaireList() {
    return api.getQuestionnaireList();
  }
}