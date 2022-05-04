import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import 'package:smartmoney/domain/domain.dart';

class CategoryLists extends StatefulWidget {
  CategoryLists({Key? key}) : super(key: key);

  @override
  State<CategoryLists> createState() => _CategoryListsState();
}

class _CategoryListsState extends State<CategoryLists> {
  var categories =[];
  var accessToken;

  getToken() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString('access_token');
  }

  void getCategories(token) async {
    var url = Uri.http(
      domain,
      '/api/getCategories',
    );

    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
      'Authorization': 'Bearer $token'
    };

    // Await the http get response, then decode the json-formatted response.
    var response = await http.post(url, headers: requestHeaders);
    if (response.statusCode == 200) {
      // categories = jsonDecode(response.body)['data'];
      categories = jsonDecode(response.body)['data'];
      // categories.cast<String>();
      // categoryLIst = Map<String, dynamic>.from(json.decode(response.body))['data'].cast<String>();
      // print(categories);
    } else {
      print('Request failed with status: ${response.statusCode}.');
    }

    setState(() {});
  }

  refresh() {
    getToken().then((value) {
      // await Future.delayed(const Duration(seconds: 2));
      accessToken = value;
      getCategories(accessToken);
      // getExpense(accessToken);
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    refresh();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView.builder(
        physics: const AlwaysScrollableScrollPhysics(
            parent: BouncingScrollPhysics()),
        itemCount: categories.length,
        itemBuilder: (context, i) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: FloatingActionButton.extended(
              heroTag: null,
              elevation:0.0,
              onPressed: () {
                Navigator.pop(context, ['${categories[i]["name"]}', '${categories[i]["id"]}']);
              }, label: Text('${categories[i]["name"]}'),),
          );
        },
      ),
    );
  }
}
