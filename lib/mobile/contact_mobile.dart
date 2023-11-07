import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:kingsberg/component.dart';
import 'package:logger/logger.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactMobile extends StatefulWidget {
  const ContactMobile({Key? key}) : super(key: key);

  @override
  State<ContactMobile> createState() => _ContactMobileState();
}

class _ContactMobileState extends State<ContactMobile> {
  var logger = Logger();
  final TextEditingController _firstNameController = TextEditingController();
  final TextEditingController _lastNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var widthDevice = MediaQuery.of(context).size.width;
    return SafeArea(
      child: Scaffold(
        extendBodyBehindAppBar: true,
        backgroundColor: Colors.white,
        endDrawer: DrawersMobile(),
        body: NestedScrollView(
          headerSliverBuilder: (BuildContext context, bool innerBoxISScrolled) {
            return <Widget>[
              SliverAppBar(
                expandedHeight: 500.0,
                backgroundColor: Colors.white,
                iconTheme: IconThemeData(
                  size: 35.0,
                  color: Colors.black,
                ),
                flexibleSpace: FlexibleSpaceBar(
                  background: Image.asset(
                    "assets/contact_image.jpg",
                    fit: BoxFit.cover,
                  ),
                ),
              )
            ];
          },
          body: SingleChildScrollView(
            padding: EdgeInsets.symmetric(vertical: 25.0),
            child: Form(
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
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
