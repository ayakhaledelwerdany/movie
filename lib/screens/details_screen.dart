import 'package:flutter/material.dart';
import '../shared/components/constants.dart';
import '../shared/remote/api.dart';

class DetailsScreen extends StatelessWidget {
  static const String routeName = "Details";

  @override
  Widget build(BuildContext context) {
    // var genrs = ModalRoute.of(context)!.settings.arguments as Genres;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff514F4F),
          title: FutureBuilder(
              future: Api.getDetails(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text("something went wrong"));
                }
                //var results = snapshot.data?.res ?? [];
                return Row(
                  children: <Widget>[
                    Expanded(
                      child: SizedBox(
                          height: 20,
                          child: Center(
                            child: Align(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                snapshot.data?.originalTitle ?? "",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                          //    }
                          //),
                          ),
                    ),
                  ],
                );
              }),
        ),
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
            child: Column(children: [
          FutureBuilder(
              future: Api.getDetails(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text("something went wrong"));
                }
                //var results = snapshot.data?.res ?? [];
                return Column(
                  children: [
                    Container(
                        decoration: BoxDecoration(
                          color: Colors.black,
                        ),
                        height: 200,
                        width: double.infinity,
                        child: GestureDetector(
                            onTap: () {},
                            child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: SizedBox(
                                    // height: 250,
                                    width: 360,
                                    child: Stack(children: [
                                      Center(
                                        child: Image.network(
                                          '${Constants.imagePath}${snapshot.data?.backdropPath}',
                                          //    fit: BoxFit.cover,
                                        ),
                                      ),
                                    ]))))

                        // )
                        ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.black,
                      ),
                      height: 240,
                      child: SizedBox(
                        height: 200,
                        width: 360,
                        child: Align(
                          alignment: Alignment.topLeft,
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              //       mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    snapshot.data?.originalTitle ?? "",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ),
                                SizedBox(
                                  height: 5,
                                ),
                                Align(
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                    snapshot.data?.releaseDate ?? "",
                                    style: TextStyle(
                                        color: Colors.white60, fontSize: 10),
                                  ),
                                ),
                                SizedBox(
                                  height: 6,
                                ),
                                Row(
                                  children: [
                                    Stack(children: [
                                      Image.network(
                                        '${Constants.imagePath}${snapshot.data?.posterPath}',
                                        fit: BoxFit.cover,
                                        height: 160,
                                        width: 110,
                                      ), ////
                                      Stack(
                                        children: [
                                          const Positioned(
                                            // top: -5,
                                            // left: -8,
                                            child: Icon(
                                              Icons.bookmark,
                                              color: Colors.black87,
                                              size: 38,
                                            ),
                                          ),
                                          Positioned(
                                            top: -8,
                                            left: -6,
                                            child: IconButton(
                                                onPressed: () {},
                                                icon: const Icon(
                                                  Icons.add,
                                                  color: Colors.white,
                                                  size: 18,
                                                )),
                                          ),
                                        ],
                                      )
                                    ]),
                                    Column(
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Container(
                                            constraints: BoxConstraints(
                                                maxWidth: 210, maxHeight: 180),
                                            child: Text(
                                              snapshot.data?.overview ?? "",
                                              maxLines: 9,
                                              overflow: TextOverflow.ellipsis,
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 12),
                                            ),
                                          ),
                                        ),
                                        Row(
                                          children: [
                                            Icon(
                                              Icons.star,
                                              size: 18,
                                              color: Colors.amber,
                                            ),
                                            Text(
                                              snapshot.data?.voteAverage
                                                      .toString() ??
                                                  "",
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 13),
                                            )
                                          ],
                                        )
                                      ],
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                );
              }),
          FutureBuilder(
              future: Api.getPopular(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return Center(child: CircularProgressIndicator());
                }
                if (snapshot.hasError) {
                  return Center(child: Text("something went wrong"));
                }
                //var results = snapshot.data?.res ?? [];
                return Container(
                    decoration: const BoxDecoration(
                      color: Color(0xff282A28),
                    ),
                    height: 190,
                    width: 360,
                    child: Column(children: [
                      Container(
                        height: 40,
                        child: const Center(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                "More Like This",
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold),
                                textAlign: TextAlign.start,
                              ),
                            ),
                          ),
                        ),
                      ),
                      // ],
                      //  ),
                      Container(
                        height: 150,
                        child: ListView.builder(
                            shrinkWrap: true,

                            //  itemCount: snapshot.data!.length,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (
                              context,
                              index,
                            ) {
                              return GestureDetector(
                                  onTap: () {},
                                  child: ClipRRect(
                                      borderRadius: BorderRadius.circular(8),
                                      child: SizedBox(
                                          width: 100,
                                          child: Padding(
                                            padding: const EdgeInsets.only(
                                                bottom: 2, left: 4, right: 4),
                                            child: Column(
                                              children: [
                                                Stack(children: [
                                                  Image.network(
                                                    //'${snapshot.data?.backdropPath}',
                                                    '${Constants.imagePath}${snapshot.data?.results?[index].posterPath}',
                                                    fit: BoxFit.cover,
                                                  ),
                                                  Stack(
                                                    children: [
                                                      Icon(
                                                        Icons.bookmark,
                                                        color: Colors.black87,
                                                        size: 38,
                                                      ),
                                                      Positioned(
                                                        top: -6,
                                                        left: -4,
                                                        child: IconButton(
                                                            onPressed: () {},
                                                            icon: const Icon(
                                                              Icons.add,
                                                              color:
                                                                  Colors.white,
                                                              size: 18,
                                                            )),
                                                      ),
                                                    ],
                                                  )
                                                ])
                                              ],
                                            ),
                                          ))));
                            }),
                      )
                    ]));
              })
        ])));
  }
}
