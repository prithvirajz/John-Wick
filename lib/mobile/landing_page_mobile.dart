import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:kingsberg/component.dart';
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';

class LandingPageMobile extends StatefulWidget {
  const LandingPageMobile({Key? key}) : super(key: key);

  @override
  State<LandingPageMobile> createState() => _LandingPageMobileState();
}

class _LandingPageMobileState extends State<LandingPageMobile> {
  var logger = Logger();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final formKey = GlobalKey<FormState>();
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

  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
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
        body: ListView(
          children: [
            //Intro , 1st section
            CircleAvatar(
              radius: 117.0,
              backgroundColor: Colors.grey,
              child: CircleAvatar(
                radius: 110.0,
                backgroundColor: Colors.white,
                backgroundImage: AssetImage("assets/john.jpg"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 25.0),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(20.0),
                                topRight: Radius.circular(20.0),
                                bottomRight: Radius.circular(20.0))),
                        padding: EdgeInsets.symmetric(
                            vertical: 10.0, horizontal: 20.0),
                        child: SansBold("Hello I'm", 15.0),
                      ),
                      SansBold("John Wick", 40.0),
                      SansBold("Assassin", 20.0)
                    ],
                  ),
                  SizedBox(height: 15.0),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Wrap(
                        direction: Axis.vertical,
                        spacing: 3.0,
                        children: [
                          Icon(Icons.email),
                          Icon(Icons.call),
                          Icon(Icons.location_pin),
                        ],
                      ),
                      SizedBox(width: 40.0),
                      Wrap(
                        direction: Axis.vertical,
                        spacing: 9.0,
                        children: [
                          Sans("johnathanwick@gmail.com", 15.0),
                          Sans("+1 888 888 999", 15.0),
                          Sans("New York", 15.0),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 90.0),
            //About me 2nd section

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SansBold("About me", 35.0),
                  Sans("Hello! I'm John Wick I specialize in killing people",
                      15.0),
                  Sans("I strive to ensure astounding performance with ", 15.0),
                  Sans(
                      "state of the art security for your life and your loved ones.",
                      15.0),
                  SizedBox(height: 10.0),
                  Wrap(
                    spacing: 7.0,
                    runSpacing: 7.0,
                    children: [
                      tealContainer("Marksmanship"),
                      tealContainer("Determination"),
                      tealContainer("Pain Tolerance"),
                      tealContainer("Professionalism")
                    ],
                  )
                ],
              ),
            ),
            SizedBox(height: 60.0),
            //3rd section
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SansBold("What I do", 35.0),
                AnimatedCard(
                    imagePath: "assets/john_3.jpg",
                    text: "Executioner",
                    width: 300.0),
                SizedBox(height: 35.0),
                AnimatedCard(
                    imagePath: "assets/john_4.jpg",
                    text: "Lots of Killing",
                    fit: BoxFit.contain,
                    reverse: true,
                    width: 300.0),
                SizedBox(height: 35.0),
                AnimatedCard(
                    imagePath: "assets/john_5.jpg",
                    text: "Assassination ",
                    width: 300.0),
                SizedBox(height: 35.0),
                AnimatedCard(
                    imagePath: "assets/john_7.jpg",
                    text: " Magnificent Driving ",
                    fit: BoxFit.contain,
                    reverse: true,
                    width: 300.0),
                SizedBox(height: 35.0),
                // 4th section
                Form(
                  key: formKey,
                  child: Wrap(
                    runSpacing: 20.0,
                    spacing: 20.0,
                    alignment: WrapAlignment.center,
                    children: [
                      SansBold("Contact me", 35.0),
                      TextForm(
                        heading: "First Name",
                        width: widthDevice / 1.4,
                        hintText: "Please type first name",
                        controller: _firstNameController,
                        validator: (text) {
                          if (text.toString().isEmpty) {
                            return "First name is required";
                          }
                        },
                      ),
                      TextForm(
                        heading: "Last Name",
                        width: widthDevice / 1.4,
                        hintText: "Please type last name",
                        controller: _lastNameController,
                      ),
                      TextForm(
                        heading: "Phone number",
                        width: widthDevice / 1.4,
                        hintText: "Please type phone number",
                        controller: _phoneController,
                      ),
                      TextForm(
                        heading: "Email",
                        width: widthDevice / 1.4,
                        hintText: "Please type email address",
                        controller: _emailController,
                        validator: (text) {
                          if (text.toString().isEmpty) {
                            return "Email is required";
                          }
                        },
                      ),
                      TextForm(
                        heading: "Message",
                        width: widthDevice / 1.4,
                        hintText: "Message",
                        maxLines: 10,
                        controller: _messageController,
                        validator: (text) {
                          if (text.toString().isEmpty) {
                            return "Message is required";
                          }
                        },
                      ),
                      MaterialButton(
                        onPressed: () async {
                          logger.d(_firstNameController.text);
                          final addData = new AddDataFirestore();
                          if (formKey.currentState!.validate()) {
                            if (await addData.addResponse(
                                _firstNameController.text,
                                _lastNameController.text,
                                _emailController.text,
                                _phoneController.text,
                                _messageController.text)) {
                              formKey.currentState!.reset();
                              DialogError(context, "Message sent successfully");
                            } else {
                              DialogError(context, "Message failed to sent");
                            }
                          }
                        },
                        elevation: 20.0,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        height: 60.0,
                        minWidth: widthDevice / 2.2,
                        color: Colors.grey,
                        child: SansBold("Submit", 20.0),
                      )
                    ],
                  ),
                ),
                SizedBox(height: 20.0)
              ],
            )
          ],
        ),
      ),
    );
  }
}
