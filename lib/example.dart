

import 'package:flutter/material.dart';
class Example extends StatefulWidget {
  const Example({Key? key}) : super(key: key);

  @override
  State<Example> createState() => _ExampleState();
}

class _ExampleState extends State<Example> {
List images=["assets/images/images.jpg","assets/images/imm.jpg","assets/images/uu.jpg"];
  bool? ischecked=false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children:[
            Checkbox(
                activeColor: Colors.blueGrey,
                value: ischecked,
                onChanged: (value){
                  setState(() {
                    ischecked=value;
                  });
                }),
            Chip(label: Text("this is chip widget"),onDeleted: (){},),
            Expanded(
              child: PageView.builder(
                physics: BouncingScrollPhysics(),
                itemCount: images.length,
                  itemBuilder: (context,index){
                return Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                      image: NetworkImage("${images[index]}"),
                      fit: BoxFit.cover
                    )

                  )
                );
              }),
            )
          ]
        ),
      ),
    );
  }
}
