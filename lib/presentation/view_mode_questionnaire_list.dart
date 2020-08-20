import 'package:flutter_app_clean_architecture/data/model/questionnaire.dart';
import 'package:flutter_app_clean_architecture/data/remote/questionnaire_api_impl.dart';
import 'package:flutter_app_clean_architecture/data/repository/questionnaire_repo_impl.dart';
import 'package:flutter_app_clean_architecture/domain/questionnaire_use_case.dart';
import 'package:rxdart/subjects.dart';

abstract class ViewModelQuestionnaireListIF {
  void getQuestionnaireList();
  void closeObservable();
}

class ViewModelQuestionnaireList extends ViewModelQuestionnaireListIF {
  var questionnaireListSubject = PublishSubject<List<Questionnaire>>();
  Stream<List<Questionnaire>> get questionnaireList => questionnaireListSubject.stream;
  QuestionnaireUseCase useCase = QuestionnaireUseCase(QuestionnaireRepoImpl(QuestionnaireApiImpl()));
  @override
  void closeObservable() {
    questionnaireListSubject.close();
  }

  @override
  void getQuestionnaireList() async{
    try {
      questionnaireListSubject = PublishSubject<List<Questionnaire>>();
      questionnaireListSubject.sink.add(await useCase.fetchData());
    } catch (e) {
      await Future.delayed(Duration(microseconds: 500));
      questionnaireListSubject.sink.addError(e);
    }
  }
}