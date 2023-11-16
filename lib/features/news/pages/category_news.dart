// ignore_for_file: unused_field

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:umoja_v1/features/news/model/show_category.dart';

import '../services/show_category_news.dart';
import 'article_view.dart';


// ignore: must_be_immutable
class CategoryNews extends StatefulWidget {
  String name;
  CategoryNews({super.key, required this.name});

  @override
  State<CategoryNews> createState() => _CategoryNewsState();
}

class _CategoryNewsState extends State<CategoryNews> {
  List<ShowCategoryModel> categories = [];
  bool _loading = true;

  @override
  void initState() {
    super.initState();
    getNews();
  }

  getNews() async {
    ShowCategoryNews showCategoryNews = ShowCategoryNews();
    await showCategoryNews.getCategoriesNews(widget.name.toLowerCase());
    categories = showCategoryNews.categories;
    try {
      setState(() {
      _loading = false;
    });
  
    } on FlutterError {
      
    }
  }

  @override
  Widget build(BuildContext context) {
    final backgroundColor   = Theme.of(context).colorScheme.background;

    return Scaffold(
        appBar: AppBar(
          backgroundColor: backgroundColor,
          title: Text(
            widget.name,
            style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          elevation: 0.0,
        ),
        body: Container(
          margin:const  EdgeInsets.symmetric(horizontal: 10.0),
          child: ListView.builder(
              shrinkWrap: true,
              physics:const  ClampingScrollPhysics(),
              itemCount: categories.length,
              itemBuilder: (context, index) {
                return ShowCategory(
                  Image: categories[index].urlToImage!,
                  desc: categories[index].description!,
                  title: categories[index].title!,
                  url: categories[index].url!
                );
              }),
        ));
  }
}

// ignore: must_be_immutable
class ShowCategory extends StatelessWidget {
  String Image, desc, title, url;
  // ignore: non_constant_identifier_names
  ShowCategory({super.key, required this.Image, required this.desc, required this.title, required this.url});

  @override
  Widget build(BuildContext context) {
    final textColor = Theme.of(context).textTheme.bodyMedium;
    return GestureDetector(
      onTap: (){
        Navigator.push(context, MaterialPageRoute(builder: (context)=> ArticleView(blogUrl: url)));
      },
      // ignore: avoid_unnecessary_containers
      child: Container(
       
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: CachedNetworkImage(
                imageUrl: Image,
                width: MediaQuery.of(context).size.width,
                height: 200,
                fit: BoxFit.cover,
              ),
            ),
           const  SizedBox(
              height: 5.0,
            ),
            Text(
              title,
              maxLines: 2,
              style: textColor!.copyWith(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(desc, maxLines: 3,style: textColor,),
            const SizedBox(height: 20.0,),
          ],
        ),
      ),
    );
  }
}
