import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:demo_ecommerce/models/watch.dart';
import 'package:demo_ecommerce/watch_details.dart';

class HomePage extends StatefulWidget{
  const HomePage({Key? key}) : super(key: key);


  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin{
  List<Map<String, dynamic>> watches = [
    {
      "icon" : Icons.watch,
      "text" : "Watches",
    },
    {
      "icon" : Icons.alarm,
      "text" : "Clocks",
    },
    {
      "icon" : Icons.punch_clock,
      "text" : "Smart",
    }
  ];
  late final TabController _tabController = TabController(
      length: 4, vsync: this
  );

  List<Watches> watchLists = WatchesList;

  @override
  Widget build(BuildContext buildContext){
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              height: 310,
              child: Row(
                children: [
                  sideBarList(),
                  watchAdsContainer(),
                ],
              ),
            ),
            Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    "Category",
                    style: TextStyle(
                      height: 0.8,
                      fontSize: 80,
                      fontWeight: FontWeight.w600,
                      color: Colors.grey.withOpacity(0.2)
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                        "category",
                        style: TextStyle(
                            fontSize: 25,
                            fontWeight: FontWeight.w600,
                            color: Colors.deepPurple.shade900,
                        ),
                      ),
                    ),
                    TabBar(
                      controller: _tabController,
                        labelPadding: const EdgeInsets.symmetric(vertical: 4, horizontal: 7.5),
                        indicatorColor: Colors.transparent,
                        tabs: [
                          tabBarTitles("All"),
                          tabBarTitles("Classic"),
                          tabBarTitles("Analog"),
                          tabBarTitles("Digital"),
                        ]
                    ),
                    SingleChildScrollView(
                      child: Container(
                        height: 260,
                        child: TabBarView(
                          controller: _tabController,
                          children: [
                            allWatchesList(),
                            Center(child: Text("Classic"),),
                            Center(child: Text("Analog"),),
                            Center(child: Text("Digital"),),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget allWatchesList() => Padding(
    padding: const EdgeInsets.all(10.0),
    child: GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 2,
        childAspectRatio: 1.2,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
      ),

      itemCount: watchLists.length,
      itemBuilder: (context, index){
        final watch = watchLists[index];
        return GestureDetector(
          onTap: (){
            Navigator.of(context).push(
              MaterialPageRoute(builder: (context) => WatchDetails()),
            );
          },
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
              color: Colors.grey.shade300,
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                image: AssetImage(watch.image),
                fit: BoxFit.contain,
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: const [
                    CircleAvatar(
                      radius: 9,
                      backgroundColor: Colors.amber,
                      child: Icon(
                        Icons.favorite_border,
                        size: 15,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(width: 5,),
                    CircleAvatar(
                      radius: 9,
                      backgroundColor: Colors.white,
                      child: Icon(
                        Icons.shopping_cart,
                        size: 15,
                        color: Colors.black,
                      ),
                    )
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 20,
                      width: 40,
                      alignment: Alignment.center,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.horizontal(
                          left: Radius.circular(20),
                          right: Radius.circular(20),
                        )
                      ),
                      child:  Text(
                        watch.price.toString(),
                        style: const TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                    Container(
                      height: 16,
                      width: 60,
                      child: RatingBar.builder(

                          initialRating: watch.rating,
                          direction: Axis.horizontal,
                          itemSize: 12,
                          allowHalfRating: true,
                          onRatingUpdate: (rating){
                            setState(() {
                              watch.rating = rating;
                            });
                          },
                          itemBuilder: (context, _){
                            return const Icon(
                              Icons.star,
                              color: Colors.amber,
                            );
                          },

                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },

    ),
  );

  Widget tabBarTitles(String title) => Container(
    height: 30,
    width: 70,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: Colors.deepPurple.shade900,
      borderRadius: const BorderRadius.horizontal(
        left: Radius.circular(40),
        right: Radius.circular(40),
      )
    ),
    child: Text(
      title,
      style: const TextStyle(
        color: Colors.white,
      ),
    ),
  );

  Widget watchAdsContainer() => Expanded(
    child: Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Colors.deepPurple.shade900,
            Colors.black
          ]
        ),
        borderRadius: const BorderRadius.only(
          bottomLeft:  Radius.circular(150),
          topRight: Radius.circular(30),

        )
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: const [
              Icon(Icons.menu, color: Colors.white,),
              SizedBox(width: 10,),
              Icon(Icons.search, color: Colors.white,),
              SizedBox(width: 10,),
              Icon(Icons.shopping_cart, color: Colors.white,),
              SizedBox(width: 10,),
            ],
          ),
          const SizedBox(height: 15,),
          const Text(
            "Grand Sale, Starts Now",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600,
              fontSize: 25,
            ),
          ),
          const SizedBox(height: 10,),
          RichText(
            text: const TextSpan(
                text : "15% ",
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.w600
                ),
                children: [
                  TextSpan(
                      text: "Off",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 22,
                      )
                  )
                ]
            ),

          ),
          Transform(
            transform: Matrix4.rotationY(0.02),
            child: Container(
              height: 150,
              width: 220,
              decoration: const BoxDecoration(

                image: DecorationImage(
                  image: AssetImage("images/3.png"),
                  //fit: BoxFit.cover,
                ),

              ),
            ),
          )
        ],
      ),
    ),
  );

  Widget sideBarList() => Column(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Padding(
        padding: const EdgeInsets.all(25.0),
        child: RichText(
          text: TextSpan(
            text : "e".toUpperCase(),
            style: const TextStyle(
              color: Colors.amber,
              fontSize: 22,
              fontWeight: FontWeight.w600
            ),
            children: [
              TextSpan(
                text: "buy".toUpperCase(),
                style: const TextStyle(
                  color: Colors.black,
                  fontSize: 22,
                )
              )
            ]
          ),

        ),
      ),
      Container(
        height: 230,
        width: 70,
        child: ListView.builder(
          itemCount: watches.length,
          itemBuilder: (context, index){
            final watch = watches[index];
            return Container(
              height: 60,
              margin: const EdgeInsets.only(bottom: 15 ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.horizontal(
                  right: Radius.circular(12),
                )
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Icon(
                    watch["icon"],
                    color: Colors.grey,
                  ),
                  Text(
                    watch['text'],
                    style: const TextStyle(
                      fontSize: 13
                    ),
                  )
                ],
              ),
            );
          },
        ),
      )
    ],
  );
}