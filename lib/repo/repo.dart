
import 'package:company_profile/modal/company.dart';

class RepoData
{
  static final Company bawp=new Company(
    name: "Build Apps With Piyush",
    about: "Our goal is to teach you the skills and equip you with the tools to become the best mobile developer and programmer you can be.We want you to make the well rounded developer.That's the mission",
    backdropPhoto: "assets/bawp_creator.jpg",
    courses: <Course>[
      new Course(
      title :"the complete android and java bootcamp",
      thumbnail: "assets/android_bootcamp.png",
      url: "https://www.udemy.com/course/android-app-development-with-java/"
      ),
      new Course(
        title: "kotlin android development materclass",
        thumbnail: "assets/kotlin.jpg",
        url: "https://www.udemy.com/course/android-oreo-kotlin-app-masterclass/"
      ),
      new Course(
        title: "java design patterns",
        thumbnail: "assets/java_design-pats.png",
        url: "https://www.udemy.com/course/design-patterns-java/"
      ),
      new Course(
        title: "the java 9 masterclass",
        thumbnail: "assets/java9_course.png",
        url: "https://www.udemy.com/course/java-the-complete-java-developer-course/"
      ),
      new Course(
        title: "android developer portfolio",
        thumbnail: "assets/android_portfolio.png",
        url: "https://www.udemy.com/course/complete-android-n-developer-course/"
      ), 
    ],
      location: "yehlanka,bangalore",
      logo: "assets/logo.png" 
  );
}