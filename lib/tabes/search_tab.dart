import 'package:flutter/material.dart';
import 'package:movie/model/popular_model.dart';
import 'package:movie/shared/remote/api.dart';

class SearchTab extends StatelessWidget {
  const SearchTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black,
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(24),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Expanded(
                    child: SizedBox(
                      height: 48,
                      width: 360,
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xff514F4F),
                            borderRadius: BorderRadius.circular(24),
                            border: Border.all(color: Colors.white),
                            shape: BoxShape.rectangle),
                        child: Row(
                          children: [
                            IconButton(
                                color: Colors.white,
                                onPressed: () {
                                  showSearch(
                                      context: context,
                                      delegate: CustomSrearchDelegate());
                                },
                                icon: Icon(Icons.search)),
                            Text(
                              "Search",
                              style: TextStyle(color: Colors.white24),
                            )
                          ],
                        ),

                        /*  decoration: InputDecoration(
                            filled: true,
                            fillColor: Color(0xff514F4F),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(24),
                                borderSide: BorderSide(color: Colors.white)),
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(24),
                                borderSide: BorderSide(color: Colors.white)),
                            label: Text(
                              "Search",
                              style: TextStyle(color: Colors.white24),
                            ),
                            prefixIcon: IconButton(
                              color: Colors.white,
                              onPressed: () {
                                showSearch(
                                    context: context,
                                    delegate: CustomSrearchDelegate());
                              },
                              icon: Icon(Icons.search),
                            )),*/ ///
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 150,
            ),
            Column(
              children: [
                Image.asset("assets/images/movies_icon.png"),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "No Movies Found",
                  style: TextStyle(color: Colors.white, fontSize: 10),
                ),
              ],
            )
          ],
        ));
  }
}

class CustomSrearchDelegate extends SearchDelegate {
  //var categories = CategoryModel.getCategories();
  // var categoryModel = CategoryModel.getCategories();

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
          color: Colors.black,
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.close))
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      color: Colors.black,
      icon: AnimatedIcon(
        icon: AnimatedIcons.menu_arrow,
        progress: transitionAnimation,
      ),
      onPressed: () {
        Navigator.pop(context);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return FutureBuilder(
        future: Api.getSearch(query),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("something went wrong"));
          }
          // var results = snapshot.data?.results ?? [];
          return Expanded(
            child: ListView.builder(itemBuilder: (context, index) {
              Row(
                children: [
                  Container(
                    height: 100,
                    width: 250,
                    child: Image.network(
                        snapshot.data?.results?[index].posterPath ?? ""),
                  ),
                  Column(
                    children: [
                      Text(snapshot.data?.results?[index].title ?? ""),
                      Text(snapshot.data?.results?[index].releaseDate ?? ""),
                      Text(snapshot.data?.results?[index].originalLanguage ??
                          ""),
                    ],
                  )
                ],
              );
            }),
          );
        });
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return FutureBuilder(
        future: Api.getSearch(query),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }
          if (snapshot.hasError) {
            return Center(child: Text("something went wrong!"));
          }
          //  var articles = snapshot.data?.results ?? [];
          return Expanded(
            child: ListView.builder(itemBuilder: (context, index) {
              Row(
                children: [
                  Container(
                    height: 100,
                    width: 250,
                    child: Image.network(
                        snapshot.data?.results?[index].posterPath ?? ""),
                  ),
                  Column(
                    children: [
                      Text(snapshot.data?.results?[index].title ?? ""),
                      Text(snapshot.data?.results?[index].releaseDate ?? ""),
                      Text(snapshot.data?.results?[index].originalLanguage ??
                          ""),
                    ],
                  )
                ],
              );
            }),
          );
        }));
  }
}
