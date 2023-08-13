import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class Otp extends StatefulWidget {
  const Otp({Key? key}) : super(key: key);

  @override
  State<Otp> createState() => _OtpState();
}

class _OtpState extends State<Otp> {
  double counter = 10;
  Timer? timer;
  bool colorbutton=false;

  void starttimer() {
    timer = Timer.periodic(Duration(seconds: 2), (timer) {
      setState(() {
        if (counter > 0) {
          counter--;
        } else {
          timer.cancel();
        }
      });
    });
  }
  void changebackground(){
    colorbutton=!colorbutton;
  }
  @override
  void initState() {
    super.initState();
    starttimer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey.withOpacity(0.4),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Verification code",
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 16),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                "We have sent the code vertification to",
                style: TextStyle(color: Colors.grey),
              ),
              Row(
                children: [
                  Text(
                    "*99******1233",
                    style: TextStyle(color: Colors.white),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  TextButton(
                      onPressed: () {}, child: Text("Chane phone number")),
                ],
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children:
                List.generate(4, (index) => SizedBox(
                  width: 64,
                  height: 68,
                  child: TextFormField(
                    decoration: InputDecoration(
                        hintStyle: TextStyle(color: Colors.blueGrey.shade700),
                        hintText: '0',
                        border: OutlineInputBorder(
                            borderSide: BorderSide(color: Colors.blueAccent),
                            borderRadius: BorderRadius.circular(10)),
                        filled: true,
                        fillColor: Colors.blueGrey.shade800),
                    keyboardType: TextInputType.number,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                    textAlign: TextAlign.center,
                    onChanged: (value) {
                      if (value.length == 1) {
                        FocusScope.of(context).nextFocus();
                      }
                    },
                    inputFormatters: [
                      FilteringTextInputFormatter.digitsOnly,
                      LengthLimitingTextInputFormatter(1),
                    ],
                  ),
                ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Center(
                  child: Text(
                    "Records code after  ${counter}",
                    style: TextStyle(color: Colors.grey),
                  )),
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        changebackground();
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 13,horizontal: 20),
                      child: Text(
                        "Record",
                        style: TextStyle(color:  colorbutton?Colors.white:Colors.blueAccent),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                        primary: colorbutton?Colors.blueAccent:Colors.blueGrey.shade900),),

                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        changebackground();
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 13,horizontal: 20),
                      child: Text("Confirm",style: TextStyle(color: colorbutton?Colors.blueAccent:Colors.white),),
                    ),
                    style: ElevatedButton.styleFrom(primary:colorbutton?Colors.blueGrey.shade900:Colors.blueAccent),
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
