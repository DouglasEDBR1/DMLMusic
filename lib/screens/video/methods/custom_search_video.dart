import 'package:flutter/material.dart';

//  SearchDelegate é uma classe abstrata que tem um método sem corpo que precisamos delegar


class CustomSeachDelegate extends SearchDelegate<String> {
  @override
  ThemeData appBarTheme(BuildContext context) {
    return ThemeData(
      textTheme: const TextTheme(
        headline6: TextStyle(fontSize: 20.0, color: Colors.white),
      ),
      appBarTheme: const AppBarTheme(
        backgroundColor: Colors.black87,
      ),
      inputDecorationTheme: const InputDecorationTheme(
        border: InputBorder.none,
        hintStyle: TextStyle(fontSize: 22.0, color: Colors.grey),
      ),
      focusColor: Colors.white
    );
  }
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: (){
          query = '';
        },
        icon: const Icon(Icons.clear),
      )
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: (){
        close(context, '');
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    close(context, query);
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container(color: Colors.black87,);
  }


}