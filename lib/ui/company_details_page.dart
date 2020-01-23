import 'package:company_profile/modal/company.dart';
import 'package:company_profile/ui/company_details_intro_animation.dart';
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

import 'course_card.dart';

class CompanyDetailsPage extends StatelessWidget {
  final Company company;
  final CompanyDetailsIntroAnimation animation;

  CompanyDetailsPage(
      {@required this.company, @required AnimationController controller})
      : animation = new CompanyDetailsIntroAnimation(controller);

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: AnimatedBuilder(
        animation: animation.controller,
        builder: _createAnimation,
      ),
    );
  }

  Widget _createAnimation(BuildContext context, Widget child) {
    return Stack(
      fit: StackFit.expand,
      children: <Widget>[
        new Opacity(
          opacity: animation.bgdropOpacity
              .value, //its difference gives different values of opacity
          child: Image.asset(company.backdropPhoto, fit: BoxFit.cover),
        ),
        BackdropFilter(
          filter: ui.ImageFilter.blur(
              sigmaX: animation.bgdropBlur.value,
              sigmaY: animation.bgdropBlur.value),
          child: new Container(
            color: Colors.black.withOpacity(0.1),
            child: _createContent(),
          ),
        ),
      ],
    );
  }

  Widget _createContent() {
    return new SingleChildScrollView( // one column means one column ka content
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          _createLogoAvatar(),
          _createAboutCompany(),
          _createCourseSCroller()
          ],
      ),
    );
  }

  Widget _createLogoAvatar() {
    return new Transform( 
      transform: new Matrix4.diagonal3Values(
          animation.avatarSize.value, animation.avatarSize.value, 1.0),
      alignment: Alignment.center,
      child: new Container(
        width: double.infinity,
        height: 110.0,
        margin: const EdgeInsets.only(top: 32.0, left: 19.0),
        padding: const EdgeInsets.all(3.0),
        child: Row(
          children: <Widget>[
            CircleAvatar(
              backgroundColor: Colors.blue,
              child: new Image.asset(
                company.logo,
                width: 100.0,
                height: 100.0,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                "Build Apps with Piyush",
                style: new TextStyle(
                    fontSize: 19 * animation.avatarSize.value + 5.0,
                    color: Colors.white70),
              ),
            )
          ],
        ),
      ),
    );
  }
  Widget _createAboutCompany()
  {
     return new Padding(
       padding: const EdgeInsets.only(top:14.0,left: 14.0,right:14.0),
       child: new Column(
         crossAxisAlignment: CrossAxisAlignment.start,
         children: <Widget>[
           new Text(
             company.name,
             style: new TextStyle(
               color: Colors.white.withOpacity(animation.nameOpacity.value),
               fontSize: 30.0*animation.avatarSize.value+2.0,
               fontWeight: FontWeight.bold
             ),
           ),
           new Text(
             company.location,
             style: new TextStyle(
               color: Colors.white54.withOpacity(animation.locationOpacity.value),
               fontWeight: FontWeight.w500
             ),
           ),
           //Line or divider
           new Container(
             color: Colors.white.withOpacity(0.90),
             margin: const EdgeInsets.symmetric(vertical: 14.0),
             width: animation.dividerWidth.value,
             height: 1.0,
           ),
           new Text(company.about,
             style: new TextStyle(
               color: Colors.white70.withOpacity(animation.aboutOpacity.value),
               height: 2.0,
               fontSize: 15.0
             ),
           ),
         ],
       ),
     );
  }

Widget _createCourseSCroller()
{
  return new Padding(
    padding: const EdgeInsets.only(top: 14.0),
    child: new Transform(
      transform: Matrix4.translationValues(animation.courseScrollerXTranslation.value, 0.0, 0.0),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: new SizedBox.fromSize(
          size: new Size.fromHeight(250.0),
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
               padding: const EdgeInsets.symmetric(horizontal: 7.0),
              itemCount: company.courses.length,
              itemBuilder: (BuildContext context,int index){
                var courses=company.courses[index];
                return new CourseCard(courses);
              }
            ),
          
        ),
      )
    ),
  );
}

}
