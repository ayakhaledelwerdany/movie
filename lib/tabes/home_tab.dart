import 'package:flutter/material.dart';
import 'package:movie/model/category_model.dart';
import 'package:movie/model/up_coming_model.dart';
import 'package:movie/screens/details_screen.dart';
import 'package:movie/shared/components/constants.dart';
import 'package:movie/shared/remote/api.dart';

class HomeTab extends StatefulWidget {
  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  // late Future<List<Popular>> popular;
  // late Future<List<Latest>> latest;
  //late Future<List<Similar>> similar;
  @override
  void initState() {
    super.initState();
    //  popular = Api().getPopular();
    // latest = Api().getLatest();
    // similar = Api().getSimilar();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff121312),
        body: SingleChildScrollView(
          child: Column(children: [
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
                  return Row(
                    children: <Widget>[
                      Expanded(
                        child: Container(
                          decoration: const BoxDecoration(
                            color: Colors.black,
                          ),
                          height: 270,
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
                                      //    height: 280,
                                      width: 370,
                                      child: Padding(
                                        padding: const EdgeInsets.only(
                                            bottom: 8,
                                            top: 2,
                                            left: 4,
                                            right: 4),
                                        child: Stack(
                                          children: [
                                            Stack(children: [
                                              Image.network(
                                                '${Constants.imagePath}${snapshot.data?.results?[index].backdropPath}',
                                                fit: BoxFit.cover,
                                              ),
                                              Center(
                                                  child: IconButton(
                                                      onPressed: () {
                                                        Navigator.pushNamed(
                                                            context,
                                                            DetailsScreen
                                                                .routeName,
                                                            arguments: Genres);
                                                      },
                                                      icon: const Icon(
                                                        Icons
                                                            .play_circle_fill_rounded,
                                                        color: Colors.white,
                                                        size: 48,
                                                      ))),
                                            ]),
                                            Align(
                                              alignment: AlignmentDirectional
                                                  .bottomStart,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    top: 48, left: 8),
                                                child: Stack(
                                                  children: [
                                                    Image.network(
                                                      '${Constants.imagePath}${snapshot.data?.results?[index].posterPath}',
                                                      fit: BoxFit.cover,
                                                      height: 200,
                                                      width: 130,
                                                    ), ////
                                                    Stack(
                                                      children: [
                                                        const Positioned(
                                                          top: -5,
                                                          left: -8,
                                                          child: Icon(
                                                            Icons.bookmark,
                                                            color:
                                                                Colors.black87,
                                                            size: 38,
                                                          ),
                                                        ),
                                                        Positioned(
                                                          top: -10,
                                                          left: -12,
                                                          child: IconButton(
                                                              onPressed: () {},
                                                              icon: const Icon(
                                                                Icons.add,
                                                                color: Colors
                                                                    .white,
                                                                size: 18,
                                                              )),
                                                        ),
                                                      ],
                                                    )
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.end,
                                              children: [
                                                Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Center(
                                                      child: Text(
                                                        snapshot
                                                                .data
                                                                ?.results?[
                                                                    index]
                                                                .originalTitle ??
                                                            "",
                                                        style: const TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                    const SizedBox(
                                                      height: 6,
                                                    ),
                                                    Center(
                                                      child: Text(
                                                        snapshot
                                                                .data
                                                                ?.results?[
                                                                    index]
                                                                .releaseDate ??
                                                            "",
                                                        style: const TextStyle(
                                                            fontSize: 10,
                                                            color:
                                                                Colors.white54),
                                                      ), //
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              }),
                        ),
                      ),
                    ],
                  );
                }),
            FutureBuilder(
                future: Api.getUpComing(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text("something went wrong"));
                  }
                  //var results = snapshot.data?.res ?? [];
                  return Row(children: <Widget>[
                    Container(
                        decoration: const BoxDecoration(
                          color: Color(0xff282A28),
                        ),
                        height: 200,
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
                                    "Up Coming",
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
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: SizedBox(
                                              width: 100,
                                              child: Padding(
                                                padding: const EdgeInsets.only(
                                                    bottom: 2,
                                                    left: 4,
                                                    right: 4),
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
                                                            color:
                                                                Colors.black87,
                                                            size: 38,
                                                          ),
                                                          Positioned(
                                                            top: -6,
                                                            left: -4,
                                                            child: IconButton(
                                                                onPressed:
                                                                    () {},
                                                                icon:
                                                                    const Icon(
                                                                  Icons.add,
                                                                  color: Colors
                                                                      .white,
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
                        ]))
                  ]);
                }),
            const SizedBox(
              height: 25,
            ),
            FutureBuilder(
                future: Api.getRecomended(),
                builder: (context, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return Center(child: CircularProgressIndicator());
                  }
                  if (snapshot.hasError) {
                    return Center(child: Text("something went wrong"));
                  }
                  //var results = snapshot.data?.res ?? [];
                  return Row(children: <Widget>[
                    Container(
                        decoration: const BoxDecoration(
                          color: Color(0xff282A28),
                        ),
                        height: 250,
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
                                    textAlign: TextAlign.start,
                                    "Recomended",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 15,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          // ],
                          //  ),

                          Container(
                            decoration: BoxDecoration(color: Color(0xff282A28)),
                            height: 200,
                            child: ListView.builder(
                                shrinkWrap: true,
                                scrollDirection: Axis.horizontal,
                                itemBuilder: (
                                  context,
                                  index,
                                ) {
                                  return GestureDetector(
                                      onTap: () {},
                                      child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          child: Card(
                                            shadowColor: Colors.black,
                                            color: Color(0xff282A28),
                                            elevation: 12,
                                            child: Container(
                                                width: 100,
                                                //     height: 140,
                                                child: Padding(
                                                  padding:
                                                      const EdgeInsets.only(
                                                          left: 6, right: 6),
                                                  child: Column(
                                                    children: [
                                                      Stack(
                                                        children: [
                                                          Image.network(
                                                            //'${snapshot.data?.backdropPath}',
                                                            '${Constants.imagePath}${snapshot.data?.results?[index].posterPath}',
                                                            fit: BoxFit.cover,
                                                          ),
                                                          Stack(
                                                            children: [
                                                              const Icon(
                                                                Icons.bookmark,
                                                                color: Colors
                                                                    .black87,
                                                                size: 40,
                                                              ),
                                                              Positioned(
                                                                top: -6,
                                                                left: -4,
                                                                child:
                                                                    IconButton(
                                                                        onPressed:
                                                                            () {},
                                                                        icon:
                                                                            const Icon(
                                                                          Icons
                                                                              .add,
                                                                          color:
                                                                              Colors.white,
                                                                          size:
                                                                              18,
                                                                        )),
                                                              ),
                                                            ],
                                                          )
                                                        ],
                                                      ),
                                                      Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: Row(
                                                          children: [
                                                            const Icon(
                                                              Icons.star,
                                                              color: Colors
                                                                  .amberAccent,
                                                              size: 15,
                                                            ),
                                                            Text(
                                                              snapshot
                                                                      .data
                                                                      ?.results?[
                                                                          index]
                                                                      .voteAverage
                                                                      .toString() ??
                                                                  "",
                                                              style: const TextStyle(
                                                                  fontSize: 12,
                                                                  color: Colors
                                                                      .white),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: Text(
                                                          snapshot
                                                                  .data
                                                                  ?.results?[
                                                                      index]
                                                                  .originalTitle ??
                                                              "",
                                                          maxLines: 2,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 10,
                                                                  color: Colors
                                                                      .white),
                                                        ),
                                                      ),
                                                      Align(
                                                        alignment:
                                                            Alignment.topLeft,
                                                        child: Text(
                                                          snapshot
                                                                  .data
                                                                  ?.results?[
                                                                      index]
                                                                  .releaseDate
                                                                  .toString()
                                                                  .substring(
                                                                      0, 10) ??
                                                              "",
                                                          style:
                                                              const TextStyle(
                                                                  fontSize: 10,
                                                                  color: Colors
                                                                      .white),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                )),
                                          )));
                                }),
                          )
                        ]))
                  ]);
                }),
            const SizedBox(
              height: 25,
            )
          ]),
        ));
  }
}
