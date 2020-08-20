import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_clean_architecture/data/model/questionnaire.dart';
import 'package:flutter_app_clean_architecture/presentation/view_mode_questionnaire_list.dart';
import 'package:flutter_app_clean_architecture/widgets/circular_progress_indicator_widget.dart';
import 'package:flutter_app_clean_architecture/widgets/view_no_data.dart';

class ViewQuestionnaireList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: QuestionnaireListView(),
    );
  }
}

class QuestionnaireListView extends StatefulWidget {
  @override
  _QuestionnaireListViewState createState() => _QuestionnaireListViewState();
}

class _QuestionnaireListViewState extends State<QuestionnaireListView>
    with WidgetsBindingObserver {
  final ViewModelQuestionnaireList viewModel = ViewModelQuestionnaireList();
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<Questionnaire>>(builder: (context, snapshot) {
      // if (snapshot.connectionState == ConnectionState.waiting) {
      // }
      if (snapshot.hasError) {
        showSnackBar(context, snapshot.error.toString());
        return viewNoData();
      }
      if (snapshot.connectionState == ConnectionState.active) {
        var pokemonList = snapshot.data;
        if (null != pokemonList)
          return buildListViewWidget(pokemonList);
        else
          return viewNoData();
      }
      return circularProgressIndicator();
    });
  }

  Widget buildListViewWidget(List<Questionnaire> list) {
    return Flexible(
        child: new ListView.builder(
      padding: EdgeInsets.all(10),
      itemCount: list.length,
      itemBuilder: (BuildContext context, int index) {
        var item = list[index];
        return ListTile(
          dense: false,
          title: Text(item.subject),
          subtitle: Text(
            "",
            style: Theme.of(context).textTheme.caption,
          ),
          onTap: () {},
        );
      },
    ));
  }



  void showSnackBar(BuildContext context, String errorMessage) async {
    await Future.delayed(Duration.zero);
    Scaffold.of(context).showSnackBar(SnackBar(content: Text(errorMessage)));
  }

  @override
  void initState() {
    super.initState();
    fetchData();
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result != ConnectivityResult.none) {
        fetchData();
      }
    });
    WidgetsBinding.instance.addObserver(this);
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    if (state == AppLifecycleState.resumed) {
      fetchData();
    }
  }

  void fetchData() {
    viewModel.getQuestionnaireList();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    viewModel.closeObservable();
    super.dispose();
  }
}
