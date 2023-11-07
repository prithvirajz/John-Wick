import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kingsberg/component.dart';
import 'package:url_launcher/url_launcher.dart';

class AboutMobile extends StatefulWidget {
  const AboutMobile({Key? key}) : super(key: key);

  @override
  State<AboutMobile> createState() => _AboutMobileState();
}

class _AboutMobileState extends State<AboutMobile> {
  @override
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

  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          iconTheme: IconThemeData(size: 35.0, color: Colors.black),
        ),
        endDrawer: DrawersMobile(),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: ListView(
            children: [
              //Introduction 1st section
              CircleAvatar(
                radius: 117.0,
                backgroundColor: Colors.black,
                child: CircleAvatar(
                  radius: 113.0,
                  backgroundColor: Colors.grey,
                  child: CircleAvatar(
                      radius: 110.0,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage("assets/john.jpg")),
                ),
              ),
              SizedBox(height: 20.0),
              Padding(
                padding: EdgeInsets.only(left: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SansBold("About me", 35.0),
                    SizedBox(height: 10.0),
                    Sans("Hello! I'm John Wick I specialize in killing people",
                        15.0),
                    Sans(
                        "I strive to ensure astounding performance with state of",
                        15.0),
                    Sans("the art security for your life and your loved ones.",
                        15.0),
                    SizedBox(height: 15.0),
                    Wrap(
                      spacing: 7.0,
                      runSpacing: 7.0,
                      children: [
                        tealContainer("Marksmanship"),
                        tealContainer("Determination"),
                        tealContainer("Pain Tolerance"),
                      ],
                    )
                  ],
                ),
              ),
              SizedBox(
                height: 40.0,
              ),

              // 2nd section
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  AnimatedCard(imagePath: "assets/john_3.jpg", width: 200.0),
                  SizedBox(height: 20.0),
                  SansBold("Executioner", 20.0),
                  SizedBox(height: 10.0),
                ],
              ),
              Center(
                child: Sans(
                    "I'm an assassin with a strong code of conduct and a sense of honor within the assassin's community. ",
                    15.0),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20.0),
                  AnimatedCard(
                      imagePath: "assets/john_4.jpg",
                      width: 200.0,
                      reverse: true),
                  SizedBox(height: 30.0),
                  SansBold("Assassination ", 20.0),
                  SizedBox(height: 10.0),
                ],
              ),
              Center(
                child: Sans(
                    "As an assassin, I have an extensive knowledge of various assassination techniques, including surveillance, disguises, and the elimination of targets with minimal collateral damage.",
                    15.0),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 20.0),
                  AnimatedCard(
                    imagePath: "assets/john_7.jpg",
                    width: 200.0,
                  ),
                  SizedBox(height: 30.0),
                  SansBold(" Magnificent Driving ", 20.0),
                  SizedBox(height: 10.0),
                ],
              ),
              Center(
                child: Sans(
                    "I'm  an expert driver and can engage in high-speed pursuits and evasive maneuvers.",
                    15.0),
              ),
              SizedBox(height: 20.0),
            ],
          ),
        ),
      ),
    );
  }
}
