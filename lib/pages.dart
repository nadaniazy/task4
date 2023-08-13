import 'package:flutter/material.dart';
import 'package:flutter_carousel_slider/carousel_slider.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:task3/Content.dart';

class Pages extends StatelessWidget {
  Pages({Key? key}) : super(key: key);
  List page = [
    Content(
        text: "Joker",
        text2: "this is joker",
        text3: "joker",
        image: "assets/images/images.jpg"),
    Content(
        text: "Joker",
        text2: "this is joker",
        text3: "joker",
        image: "assets/images/imm.jpg"),
    Content(
        text: "Joker",
        text2: "this is joker",
        text3: "joker",
        image: "assets/images/uu.jpg"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.red,
        body: SafeArea(
          child: CarouselSlider.builder(
              viewportFraction: 0.5,
              scrollDirection: Axis.horizontal,
              scrollPhysics: BouncingScrollPhysics(),
              slideBuilder: (index) {
                return buildStack(page[index]);
              },
              itemCount: page.length),
        ));
  }

  Widget buildStack(Content content) {
    return Column(
      children: [
        Text(
          "${content.text}".toUpperCase(),
          style: TextStyle(
              fontSize: 40, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: 10,
        ),
        Text(
          "${content.text2}",
          style: TextStyle(color: Colors.white),
        ),
        SizedBox(
          height: 10,
        ),
        RatingBar.builder(
          initialRating: 3,
          itemSize: 13,
          direction: Axis.horizontal,
          allowHalfRating: true,
          itemCount: 5,
          itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
          itemBuilder: (context, _) => Icon(
            Icons.star,
            color: Colors.amber,
          ),
          onRatingUpdate: (rating) {
            print(rating);
          },
        ),
        ElevatedButton(
          onPressed: () {},
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text("start button"),
          ),
          style: ElevatedButton.styleFrom(primary: Colors.red),
        ),
        SizedBox(
          height: 10,
        ),
        Container(
          height: 300,
          width: 200,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image(
              image: AssetImage("${content.image}"),
              fit: BoxFit.fitHeight,
            ),
          ),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          "${content.text3}",
          style: TextStyle(color: Colors.white, fontSize: 22),
        ),
      ],
    );
  }
}
