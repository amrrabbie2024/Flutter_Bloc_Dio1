part of 'bloc.dart';

class MNewsData {

  late final String status;
  late final int totalResults;
  late final List<MArticles> articles;

  MNewsData.fromJson(Map<String, dynamic> json){
    status = json['status'];
    totalResults = json['totalResults'];
    articles = List.from(json['articles']).map((e)=>MArticles.fromJson(e)).toList();
  }


}

class MArticles {

  late final Source source;
  late final String author;
  late final String title;
  late final Null description;
  late final String url;
  late final Null urlToImage;
  late final String publishedAt;
  late final Null content;

  MArticles.fromJson(Map<String, dynamic> json){
    source = Source.fromJson(json['source']);
    author = json['author'];
    title = json['title'];
    description = null;
    url = json['url'];
    urlToImage = null;
    publishedAt = json['publishedAt'];
    content = null;
  }


}

class Source {

  late final String id;
  late final String name;

  Source.fromJson(Map<String, dynamic> json){
    id = json['id']??"";
    name = json['name']??"";
  }


}