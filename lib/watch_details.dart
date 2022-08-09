import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';

class WatchDetails extends StatefulWidget {
  const WatchDetails({Key? key}) : super(key: key);

  @override
  State<WatchDetails> createState() => _WatchDetailsState();
}

class _WatchDetailsState extends State<WatchDetails> with SingleTickerProviderStateMixin {
  bool isFavorite = false;
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SafeArea(
        child: Container(
          height: height,
          width: width,
          child: Stack(
            children: [
              Container(
                height: 380,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: [
                        Colors.deepPurple.shade900,
                        Colors.black
                      ]
                  )
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      detailsAppBar(),

                      Wrap(
                        direction: Axis.vertical,
                        spacing: 20,
                        children: [
                          imageViews("images/1.png"),
                          imageViews("images/2.png"),
                          imageViews("images/4.png"),
                        ],
                      ),
                      const SizedBox(height: 20,)
                    ],
                  ),
                ),
              ),

              Positioned(
                bottom: 0,
                child: Container(
                  height: 350,
                  width: width,
                  padding: EdgeInsets.fromLTRB(20, 35, 20, 20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(20),
                      topRight: Radius.circular(20),
                    )

                  ),
                  child: watchDetails(),
                ),
              ),
              Positioned(
                top: -20,
                left: -20,
                child: Image.asset(
                  "images/1.png",
                  fit: BoxFit.contain,
                  height: 420,
                  width: 320,
                ),
              ),
              Positioned(
                top: height/2 +10,
                right: 15,
                child: GestureDetector(
                  onTap: (){
                    setState(() {
                      isFavorite = !isFavorite;
                    });
                  },
                    child: Icon(
                          Icons.favorite,
                          color: isFavorite? Colors.red : Colors.grey,
                        )
                    ),

              )


            ],
          ),
        ),
      ),
    );
  }

  Widget watchDetails() => Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      const Text(
        "Modern",
        style: TextStyle(
          fontSize: 16,
          color: Colors.grey,
        ),
      ),
      const Text(
        "Boss Quartz Analog watch\n with Silicon Strap",
        style: TextStyle(
            fontSize: 23,
            color: Colors.black,
          fontWeight: FontWeight.w600
        ),
      ),
      Material(
        shadowColor: Colors.grey,
        elevation: 8,
        borderRadius:  BorderRadius.circular(12),
        child: DottedBorder(
          strokeWidth: 1.3,
          borderType: BorderType.RRect,
          radius: const Radius.circular(12),
          dashPattern: [4, 3],
          child: Container(
            height: 75,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 15),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  watchesData("Brand", "Boss"),
                  watchesData("Price", "\$150"),
                  watchesData("Warranty", "2 years"),
                ],
              ),
            ),
          ),
        ),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
           const Text(
            "Description",
            style: TextStyle(
              fontSize: 17,
              color: Colors.grey,
            ),
          ),
          Text(
            "Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum Lorem ipsum ",
            style: TextStyle(
              fontSize: 14,
              color: Colors.grey.shade700,
            ),
          ),
        ],
      ),
      Container(
        height: 45,
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          onPressed: (){

          },
          style: ElevatedButton.styleFrom(
            primary: Colors.amber,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8)
            )
          ),
          child: const Text(
            "Buy Now",
            style: TextStyle(
              color: Colors.white,
              fontSize: 19
            ),
          ),
        ),
      )

    ],

  );

  Widget watchesData(String title, String details) => Column(
    children: [
      Text(
        title,
        style: TextStyle(
          fontSize: 15,
          color: Colors.grey,
        ),
      ),
      Text(
        details,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,

        ),
      ),
    ],

  );


  Widget imageViews(String image) => Container(
    height: 60,
    width: 60,
    alignment: Alignment.center,
    decoration: BoxDecoration(
      color: Colors.white,
      border: Border.all(width: 2, color: Colors.amber),
      shape: BoxShape.circle,
    ),
    child: Image.asset(
      image,
      height: 45,
      width: 45,
      fit: BoxFit.contain,

    ),
  );


  Widget detailsAppBar() => Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      GestureDetector(
        onTap: (){
          Navigator.pop(context);
        },
        child: const Icon(Icons.arrow_back, color: Colors.white,)),
      Row(

        children: const [
          Icon(Icons.menu, color: Colors.white,),
          SizedBox(width: 10),
          Icon(Icons.search, color: Colors.white,),
          SizedBox(width: 10),
          Icon(Icons.shopping_cart, color: Colors.white,),
        ],
      )
    ],
  );


}