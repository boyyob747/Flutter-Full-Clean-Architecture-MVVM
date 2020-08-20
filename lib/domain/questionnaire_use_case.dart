import 'package:flutter_app_clean_architecture/data/repository/questionnaire_repo.dart';
import 'package:flutter_app_clean_architecture/domain/base_use_case.dart';
import 'package:flutter_app_clean_architecture/data/model/questionnaire.dart';

class QuestionnaireUseCase extends BaseUseCase<List<Questionnaire>> {
  QuestionnaireRepository repo;
  QuestionnaireUseCase(QuestionnaireRepository repo) {
    this.repo = repo;
  }
  @override
  Future<List<Questionnaire>> fetchData() {
    return this.repo.getQuestionnaireList();
  }
}