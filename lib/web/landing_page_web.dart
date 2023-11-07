import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
// import 'package:google_fonts/google_fonts.dart';
// import 'package:google_fonts/google_fonts.dart';
import 'package:kingsberg/component.dart';
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';

class LandingPageWeb extends StatefulWidget {
  const LandingPageWeb({Key? key}) : super(key: key);

  @override
  State<LandingPageWeb> createState() => _LandingPageWebState();
}

class _LandingPageWebState extends State<LandingPageWeb> {
  var logger = Logger();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var heightDevice = MediaQuery.of(context).size.height;
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
      body: ListView(children: [
        //First page
        Container(
          height: heightDevice - 56,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                      decoration: BoxDecoration(
                          color: Colors.grey,
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(20.0),
                            topRight: Radius.circular(20.0),
                            bottomRight: Radius.circular(20.0),
                          )),
                      padding: EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 20.0),
                      child: SansBold("Hello I'm", 15)),
                  SizedBox(height: 15.0),
                  SansBold("John Wick", 55.0),
                  Sans("Proficient Assassin ", 30),
                  SizedBox(height: 15.0),
                  Row(
                    children: [
                      Icon(Icons.email),
                      SizedBox(width: 15.0),
                      Sans("johnathanwick@gmail.com", 15),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    children: [
                      Icon(Icons.call),
                      SizedBox(width: 20.0),
                      Sans("+1 888 888 999", 15.0),
                    ],
                  ),
                  SizedBox(height: 10.0),
                  Row(
                    children: [
                      Icon(Icons.location_city),
                      SizedBox(width: 20),
                      Sans("New York", 15.0),
                    ],
                  ),
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
        //Second page
        Container(
          height: heightDevice / 1.5,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset("assets/John_web.jpg", height: widthDevice / 1.9),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SansBold("About me", 40),
                  SizedBox(height: 15),
                  Sans("Hello! I'm John Wick I specialize in killing people",
                      15),
                  Sans(
                      "I strive to ensure astounding performance with state of",
                      15),
                  Sans("the art security for your life and your loved ones.",
                      15),
                  SizedBox(height: 10),
                  Row(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            style: BorderStyle.solid,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        padding: EdgeInsets.all(7.0),
                        child: Sans("Marksmanship", 15.0),
                      ),
                      SizedBox(width: 7),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            style: BorderStyle.solid,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        padding: EdgeInsets.all(7.0),
                        child: Sans("Determination", 15.0),
                      ),
                      SizedBox(width: 7),
                      Container(
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.grey,
                            style: BorderStyle.solid,
                            width: 2.0,
                          ),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        padding: EdgeInsets.all(7.0),
                        child: Sans(" Pain Tolerance", 15.0),
                      ),
                    ],
                  )
                ],
              ),
            ],
          ),
        ),
        //Third section
        Container(
          height: heightDevice / 1.5,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SansBold("What i do ?", 40.0),
              Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
// crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    AnimatedCard(
                        imagePath: "assets/john_3.jpg", text: "Executioner"),
                    AnimatedCard(
                        imagePath: "assets/john_4.jpg",
                        text: "Lots of Killing",
                        fit: BoxFit.contain,
                        reverse: true),
                    AnimatedCard(
                      imagePath: "assets/john_5.jpg",
                      text: "Assassination ",
                    ),
                    AnimatedCard(
                      imagePath: "assets/john_7.jpg",
                      text: " Magnificent Driving ",
                      fit: BoxFit.contain,
                      reverse: true,
                    ),
                  ]),
            ],
          ),
        ),

        //Forth section
        Container(
          height: heightDevice,
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SansBold("Contact me", 40.0),
                SansBold("(Better If you stayed away)", 10.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        // Column(
                        //   crossAxisAlignment: CrossAxisAlignment.start,
                        //   children: [
                        //     Sans("First name", 16.0),
                        //     SizedBox(height: 5.0),
                        //     SizedBox(
                        //       width: 350.0,
                        //       child: TextFormField(
                        //         decoration: InputDecoration(
                        //           enabledBorder: OutlineInputBorder(
                        //             borderSide: BorderSide(color: Colors.grey),
                        //             borderRadius:
                        //                 BorderRadius.all(Radius.circular(10)),
                        //           ),
                        //           focusedBorder: OutlineInputBorder(
                        //             borderSide: BorderSide(
                        //                 color: Colors.grey, width: 2.0),
                        //             borderRadius:
                        //                 BorderRadius.all(Radius.circular(15.0)),
                        //           ),
                        //           hintText: "Please enter your name",
                        //           hintStyle: GoogleFonts.poppins(fontSize: 14),
                        //         ),
                        //       ),
                        //     ),
                        //   ],
                        // ),
                        TextForm(
                          width: 350.0,
                          heading: "First name",
                          hintText: "Please type your first name",
                          controller: _firstNameController,
                          validator: (text) {
                            if (text.toString().isEmpty) {
                              return "First name is required";
                            }
                          },
                        ),

                        SizedBox(height: 15.0),
                        TextForm(
                          heading: "Email",
                          width: 350.0,
                          hintText: "Please enter your email address",
                          controller: _emailController,
                          validator: (text) {
                            if (text.toString().isEmpty) {
                              return "Email is required";
                            }
                          },
                        ),
                      ],
                    ),
                    Column(
                      children: [
                        TextForm(
                          heading: "Last name",
                          width: 350.0,
                          hintText: "Please enter your last name",
                          controller: _lastNameController,
                        ),
                        SizedBox(height: 15.0),
                        TextForm(
                          width: 350.0,
                          hintText: "Please type your phone number",
                          heading: "Contact number",
                          controller: _phoneController,
                        )
                      ],
                    )
                  ],
                ),
                TextForm(
                  heading: "Message",
                  width: widthDevice / 1.5,
                  hintText: "Please type your message",
                  maxLines: 10,
                  controller: _messageController,
                  validator: (text) {
                    if (text.toString().isEmpty) {
                      return "Message is required";
                    }
                  },
                ),
                MaterialButton(
                  elevation: 20.0,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0)),
                  height: 60.0,
                  minWidth: 200.0,
                  color: Colors.teal,
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
                  child: SansBold("Submit", 20.0),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 20.0),
      ]),
    );
  }
}
//
