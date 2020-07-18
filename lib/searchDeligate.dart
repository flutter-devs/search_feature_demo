import 'package:flutter/material.dart';

class SearchAppBarDelegate extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Search"),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () {
              showSearch(context: context, delegate: _SearchAppBarDelegate());
            },
          )
        ],
      ),
    );
  }
}

class _SearchAppBarDelegate extends SearchDelegate<String> {
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.close),
        onPressed: () {
          close(context, null);
        },
      ),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: Icon(Icons.arrow_back_ios),
      onPressed: () {
        close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Center(
      child: Text(
        query,
        style: TextStyle(
            color: Colors.blue, fontWeight: FontWeight.w900, fontSize: 30),
      ),
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    List<Item> items = [
      Item(title: 'apple'),
      Item(title: 'mango'),
      Item(title: 'banana'),
      Item(title: 'pineapple'),
      Item(title: 'orange'),
      Item(title: 'oranges'),
    ];
    List<Item> suggestionList = query.isEmpty
        ? items
        : items.where((element) => element.title.startsWith(query)).toList();
    return suggestionList.isEmpty
        ? Text("no result found")
        : ListView.builder(
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(suggestionList[index].title),
                onTap: () {
                  showResults(context);
                },
              );
            },
            itemCount: suggestionList.length,
          );
  }
}

class Item {
  final String title;

  Item({@required this.title});
}

List<Item> items = [
  Item(title: 'apple'),
  Item(title: 'mango'),
  Item(title: 'banana'),
  Item(title: 'pineapple'),
  Item(title: 'orange'),
  Item(title: 'oranges'),
];
