import 'dart:developer';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fruit_market/Home/Model/home_model.dart';

import '../../Home/Model/cubit.dart';
import '../details_page.dart';

class CustomSearchDelegate extends SearchDelegate {
  HomeCubit homeCubit = HomeCubit();

  final List<HomeModel> Search ;

  CustomSearchDelegate(this.Search);

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {


    List<HomeModel> matchQuery = [];
    log(Search.toString());
    for (var model in Search) {
      if (model.title!.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(model);
        log(Search.toString());
        log(matchQuery.toString());
      }
    }
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: ListView.builder(

        itemCount: matchQuery.length,
        itemBuilder: (context, index) {
          var result = matchQuery[index];
          return SafeArea(
            child: ListTile(
              title: Text(result.title ?? ''),
              subtitle: Text(result.price ?? ''),
              // Add more widget elements as needed
              onTap: () {
                // Perform the desired action when the item is tapped
                // For example, navigate to a details page or execute a function
                // You can access the selected result via `result` variable
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsWidget(
                      itemId: result.itemId,
                      title: result.title,
                      image: result.image,
                      description: result.description,
                      price: result.price,
                    ),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<HomeModel> matchQuery = [];
    log(Search.toString());
    for (var model in Search) {
      if (model.title!.toLowerCase().contains(query.toLowerCase())) {
        matchQuery.add(model);
      }
    }
    return Padding(
      padding: EdgeInsets.all(10),
      child: SafeArea(
        child: ListView.builder(

          itemCount: matchQuery.length,
          itemBuilder: (context, index) {
            var result = matchQuery[index];
            return ListTile(
              title: Text(result.title ?? ''),
              subtitle: Text('${result.price ?? ''} JD'),
              // Add more widget elements as needed
              onTap: () {
                // Perform the desired action when the item is tapped
                // For example, navigate to a details page or execute a function
                // You can access the selected result via `result` variable
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsWidget(
                      itemId: result.itemId,
                      title: result.title,
                      image: result.image,
                      description: result.description,
                      price: result.price,
                    ),
                  ),
                );
              },

            );
          },
        ),
      ),
    );
  }

}
