import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
// ignore: must_be_immutable
class ArticleView extends StatefulWidget {
String blogUrl;
ArticleView({super.key, required this.blogUrl});

  @override
  State<ArticleView> createState() => _ArticleViewState();
}

class _ArticleViewState extends State<ArticleView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(
        title: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Umoja"),
            Text(
              "News",
              style: TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
            )
          ],
        ),
        centerTitle: true,
        elevation: 0.0,
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
      child: WebView(
        initialUrl:widget.blogUrl ,
        javascriptMode: JavascriptMode.unrestricted,
      ),
    ));
  }
}