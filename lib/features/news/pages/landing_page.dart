import 'package:flutter/material.dart';

import 'home.dart';

class NewsLandingPage extends StatefulWidget {
  const NewsLandingPage({super.key});

  @override
  State<NewsLandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<NewsLandingPage> {
  @override
  Widget build(BuildContext context) {
    final textStyle = Theme.of(context).textTheme.bodyMedium;
    // final iconColor = Theme.of(context).colorScheme.onBackground;
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
      child: Column(
        children: [
          Material(
            elevation: 3.0,
            borderRadius: BorderRadius.circular(30),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(30),
              child: Image.asset(
                "assets/building.jpg",
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 1.6,
                fit: BoxFit.cover,
              ),
            ),
          ),
          const SizedBox(
            height: 20.0,
          ),
          Text("News from around the\n        world for you",
              style: textStyle!
                  .copyWith(fontSize: 26.0, fontWeight: FontWeight.bold)),
          const SizedBox(
            height: 20.0,
          ),
          const Text(
            "Best time to read, take your time to read\n               a little more of this world",
            style: TextStyle(
                color: Colors.black45,
                fontSize: 18.0,
                fontWeight: FontWeight.w500),
          ),
          const SizedBox(
            height: 40.0,
          ),
          GestureDetector(
            onTap: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => const Home()));
            },
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 1.2,
              child: Material(
                borderRadius: BorderRadius.circular(30),
                elevation: 5.0,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 15.0),
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(30)),
                  child: const Center(
                    child: Text(
                      "Get Started",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 17.0,
                          fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
