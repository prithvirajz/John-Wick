// import 'dart:js';

//import 'package:js/js.dart';
import 'package:flutter/material.dart';
import 'package:kingsberg/common/blog.dart';
import 'package:kingsberg/mobile/about_mobile.dart';

import 'package:kingsberg/mobile/contact_mobile.dart';
import 'package:kingsberg/mobile/landing_page_mobile.dart';
import 'package:kingsberg/mobile/works_mobile.dart';
import 'package:kingsberg/web/about_web.dart';

import 'package:kingsberg/web/contact_web.dart';
import 'package:kingsberg/web/landing_page_web.dart';
import 'package:kingsberg/web/works_web.dart';

class Routes {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxWidth > 800) {
              return LandingPageWeb();
            } else
              return LandingPageMobile();
          }),
        );
      case '/contact':
        return MaterialPageRoute(
            builder: (_) => LayoutBuilder(builder: (context, constraints) {
                  if (constraints.maxWidth > 800) {
                    return ContactWeb();
                  } else
                    return ContactMobile();
                }),
            settings: settings);
      case '/about':
        return MaterialPageRoute(
            builder: (_) => LayoutBuilder(builder: (context, constraints) {
                  if (constraints.maxWidth > 800) {
                    return AboutWeb();
                  } else
                    return AboutMobile();
                }),
            settings: settings);
      case '/blog':
        return MaterialPageRoute(builder: (_) => Blog(), settings: settings);
      case '/works':
        return MaterialPageRoute(
            builder: (_) => LayoutBuilder(builder: (context, constraints) {
                  if (constraints.maxWidth > 800) {
                    return WorksWeb();
                  } else
                    return WorksMobile();
                }),
            settings: settings);
      default:
        return MaterialPageRoute(
          settings: settings,
          builder: (_) => LayoutBuilder(builder: (context, constraints) {
            if (constraints.maxWidth > 800) {
              return LandingPageWeb();
            } else
              return LandingPageMobile();
          }),
        );
    }
  }
}
