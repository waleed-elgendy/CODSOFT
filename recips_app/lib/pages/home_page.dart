import 'package:flutter/material.dart';
import 'package:recips_app/helper/recips_list.dart';
import 'package:recips_app/pages/recipe_details_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFeaf4fc),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white70,
        actions: const [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: Icon(
              Icons.search_outlined,
              color: Colors.black,
            ),
          ),
        ],
      ),
      body: Container(
          color: Colors.white70,
          child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: SizedBox(
                  height: 60,
                  child: Row(
                    children: [
                      Text("Popular",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontSize: 26)),
                      Text(" meals",
                          style: TextStyle(
                              color: Colors.grey,
                              fontWeight: FontWeight.bold,
                              fontSize: 26)),
                    ],
                  ),
                ),
              ),
              Container(
                margin: const EdgeInsets.all(8.0),
                height: 230,
                width: 460,
                child: ListView.builder(
                  itemCount: popular.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: ((context, index) {
                    return InkWell(
                      onTap: () {
                         Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => RecipeDetailsPage(
                                  index: index ,
                                  pop: true,
                                )));
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          width: 400,
                          child: Card(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            elevation: 2,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                children: [
                                  SizedBox(
                                    height: index==1?160:180,
                                  //  width: 180,
                                     child: Image.asset(popular[index].image),
                                  ),
                                  Column(
                                    children: [
                                      const SizedBox(
                                        height: 50,
                                      ),
                                      Text(popular[index].title,
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 25)),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      const SizedBox(
                                        height: 60,
                                      ),
                                      Text(
                                          popular[index].calories.toString(),
                                          style: const TextStyle(
                                              color: Colors.black,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20))
                                    ],
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                ),
              ),
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 12),
                child: SizedBox(
                    height: 90,
                    child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("All meals",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 40)),
                            Text("delicacies food recipes",
                                style: TextStyle(
                                    color: Colors.grey,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20)),
                          ],
                        )
                      ],
                    )),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15.0),
                child: GridView.builder(
                  shrinkWrap : true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 5,
                    crossAxisSpacing: 5,
                    childAspectRatio: 0.8,
                  ),
                  itemCount: recipes.length,
                  scrollDirection: Axis.vertical,
                  itemBuilder: (context, index) {
                    return InkWell(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => RecipeDetailsPage(
                              index: index,
                              pop: false,
                            ),
                          ),
                        );
                      },
                      child: Card(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        elevation: 10,
                        shadowColor: Colors.white,
                        child:  Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                 SizedBox(
                                   width: double.infinity,
                                     height: 150,
                                     child: Image.asset(recipes[index].image)),
                                Text(recipes[index].title,
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 20)),
                              ]),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ],
          )),
    );
  }
}
