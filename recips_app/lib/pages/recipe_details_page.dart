import 'package:flutter/material.dart';
import 'package:recips_app/helper/recips_list.dart';
import 'package:url_launcher/url_launcher.dart';

class RecipeDetailsPage extends StatelessWidget {
  const RecipeDetailsPage({Key? key, required this.index, required this.pop}) : super(key: key);
  final int index;
  final bool pop;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFeaf4fc),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white70,
        leading: IconButton(
          color: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(Icons.arrow_back_ios),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Container(
          color: Colors.white70,
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12),
              child: Text(pop?popular[index].title:recipes[index].title,
                  style: const TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 38)),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Container(
                padding: const EdgeInsets.only(left: 5),
                child: Text(pop?popular[index].description:recipes[index].description,
                    style: const TextStyle(
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                        fontSize: 20)),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              height: 280,
              width: 400,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: SizedBox(
                      height: 300,
                      width: 180,
                      child: Column(
                        children: [
                          const Text("Nutrition's ",
                              style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 31)),
                          const SizedBox(
                            height: 20,
                          ),
                          SizedBox(
                            height: 50,
                            width: 170,
                            child: Card(
                              color: Colors.white,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child: Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(pop?popular[index].calories.toString():recipes[index].calories.toString(),
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 23)),
                                    const Text("Calories kcal",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 50,
                            width: 170,
                            child: Card(
                              color: Colors.white,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child:  Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                        pop?popular[index].carb.toString():recipes[index].carb.toString(),
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 23)),
                                    const Text("Carb g",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: 50,
                            width: 170,
                            child: Card(
                              color: Colors.white,
                              elevation: 3,
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              child:  Padding(
                                padding: const EdgeInsets.only(left: 15.0),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                       pop? popular[index].protein.toString(): recipes[index].protein.toString(),
                                        style: const TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 23)),
                                    const Text("Protein g",
                                        style: TextStyle(
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 15)),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                   SizedBox(
                    height: 260,
                    width: 210,
                    child: Image.asset(pop?popular[index].image:recipes[index].image)
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 2,
            ),
            const Text("  Ingredients",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 31)),
            const SizedBox(
              height: 2,
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 16.0, right: 16.0, top: 16.0),
              child: Text(pop?popular[index].ingredient:recipes[index].ingredient,
                  style: TextStyle(
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.bold,
                      fontSize: 15)),
            ),
            Center(
              child: FloatingActionButton.extended(
                splashColor: Colors.blue,
                focusElevation: 10,
                elevation: 20,
                onPressed: () async {
                   final Uri url =
                      Uri.parse(pop?popular[index].url:recipes[index].url);
                  if (await launchUrl(url)) {
                    throw Exception('Could not launch $url');
                  }
                },
                icon: const Icon(Icons.play_circle),
                label: const Text("Watch Video"),
                backgroundColor: Colors.green,
              ),
            ),
            const SizedBox(
              height: 5,
            ),
            const Text("  Recipe preparation",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 31)),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(pop?popular[index].preparation:recipes[index].preparation,
                  style: TextStyle(
                      color: Colors.grey.shade600,
                      fontWeight: FontWeight.bold,
                      fontSize: 15)),
            ),
          ]),
        ),
      ),
    );
  }
}
