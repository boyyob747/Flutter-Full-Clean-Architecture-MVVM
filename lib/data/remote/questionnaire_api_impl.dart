import 'dart:convert';

import 'package:flutter_app_clean_architecture/data/model/questionnaire.dart';
import 'package:flutter_app_clean_architecture/data/remote/questionnaire_api.dart';
import 'package:http/http.dart';

class QuestionnaireApiImpl implements QuestionnaireApi{
  @override
  Future<List<Questionnaire>> getQuestionnaireList() async{
        try{
      final response = await get('https://surveyapimockup.azurewebsites.net/api/v1/questionnaires');
      if (response.statusCode == 200) {
        Map<String, dynamic> mapResponse = json.decode(response.body);
        var list = mapResponse['pokemon'] as List;
        return list.map((value) => Questionnaire.fromJson(value)).toList();
      }else{
        throw Exception("Error Code: ${response.statusCode}");
      }
    }catch(e){
      throw Exception("There was a problem with the connection");
    }
  }
}