import 'package:flutter/material.dart';
import 'package:movie/shared/remote/api.dart';

class BrowseTab extends StatelessWidget {
  const BrowseTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(12),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text(
                "Browse Category",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold),
              ),
              FutureBuilder(
                future: Api.getCategories(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text("something went wrong"));
                  }
                  return Container(
                    //color: Colors.amber,
                    height: 530,
                    child: GridView.builder(
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            mainAxisSpacing: 1,
                            crossAxisSpacing: 1),
                        itemBuilder: (
                          context,
                          index,
                        ) {
                          return GestureDetector(
                            onTap: () {},
                            child: SizedBox(
                              // height: 50,
                              width: 300,
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Stack(children: [
                                  Image.asset(
                                    "assets/images/browse.png",
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                    height: 200,
                                  ),
                                  Align(
                                    alignment: Alignment.center,
                                    child: Text(
                                      snapshot.data?.genres?[index].name ?? "",
                                      style: TextStyle(color: Colors.white),
                                    ),
                                  )
                                ]),
                              ),
                            ),
                          );
                        }),
                  );
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
