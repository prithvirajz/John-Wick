import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kingsberg/component.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutWeb extends StatefulWidget {
  const AboutWeb({Key? key}) : super(key: key);

  @override
  State<AboutWeb> createState() => _AboutWebState();
}

class _AboutWebState extends State<AboutWeb> {
  @override
  Widget build(BuildContext context) {
    tealContainer(String text) {
      return Container(
        decoration: BoxDecoration(
            border: Border.all(
              color: Colors.grey,
              style: BorderStyle.solid,
              width: 2.0,
            ),
            borderRadius: BorderRadius.circular(5.0)),
        padding: EdgeInsets.all(7.0),
        child: Text(
          text,
          style: GoogleFonts.openSans(fontSize: 15.0),
        ),
      );
    }

    var widthDevice = MediaQuery.of(context).size.width;
    return Scaffold(
      drawer: DrawersWeb(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0.0,
        iconTheme: IconThemeData(
          size: 25.0,
          color: Colors.black,
        ),
        title: TabsWebList(),
      ),
      body: ListView(
        //about me 1st section
        children: [
          SizedBox(
            height: 500.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SansBold("About me", 40.0),
                    SizedBox(height: 15.0),
                    Sans("Hello! I'm John Wick I specialize in killing people",
                        15.0),
                    Sans(
                        "I strive to ensure astounding performance with state of",
                        15.0),
                    Sans("the art security for your life and your loved ones.",
                        15.0),
                    SizedBox(height: 10.0),
                    Row(
                      children: [
                        tealContainer("Marksmanship"),
                        SizedBox(width: 7.0),
                        tealContainer("Determination"),
                        SizedBox(width: 7.0),
                        tealContainer("Pain Tolerance"),
                        SizedBox(width: 7.0),
                        tealContainer("Silent")
                      ],
                    )
                  ],
                ),
                CircleAvatar(
                  radius: 147.0,
                  backgroundColor: Colors.grey,
                  child: CircleAvatar(
                    radius: 143.0,
                    backgroundColor: Colors.grey,
                    child: CircleAvatar(
                      radius: 140.0,
                      backgroundImage: AssetImage("assets/john.jpg"),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // 2nd section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AnimatedCard(
                imagePath: "assets/john_3.jpg",
                height: 250.0,
                width: 250.0,
              ),
              SizedBox(
                width: widthDevice / 3,
                child: Column(
                  children: [
                    SansBold("Executioner", 30.0),
                    SizedBox(height: 15.0),
                    Sans(
                        "I'm an assassin with a strong code of conduct and a sense of honor within the assassin's community.",
                        15.0)
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 20.0),

          //3rd section
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              SizedBox(
                width: widthDevice / 3,
                child: Column(
                  children: [
                    SansBold("Assassination ", 30.0),
                    SizedBox(height: 15.0),
                    Sans(
                        "As an assassin, I have an extensive knowledge of various assassination techniques, including surveillance, disguises, and the elimination of targets with minimal collateral damage.",
                        15.0),
                  ],
                ),
              ),
              AnimatedCard(
                  imagePath: "assets/john_4.jpg",
                  height: 250.0,
                  width: 250.0,
                  reverse: true),
            ],
          ),
          SizedBox(height: 20.0),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              AnimatedCard(
                imagePath: "assets/john_7.jpg",
                height: 250.0,
                width: 250.0,
              ),
              SizedBox(
                width: widthDevice / 3,
                child: Column(
                  children: [
                    SansBold("Magnificent Driving", 30.0),
                    SizedBox(height: 15.0),
                    Sans(
                        "I'm  an expert driver and can engage in high-speed pursuits and evasive maneuvers.",
                        15.0),
                  ],
                ),
              )
            ],
          ),
          SizedBox(height: 40.0),
        ],
      ),
    );
  }
}
