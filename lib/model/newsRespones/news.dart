import 'package:news/model/sourceResponse/Source.dart';



/// source : {"id":null,"name":"Lifehacker.com"}
/// author : "Khamosh Pathak"
/// title : "Use This Extension to Block Sponsored Ads on YouTube"
/// description : "There are many ways to watch YouTube ad-free (I highly recommend YouTube Premium). But even if you shell out $13.99 per month to remove autoplay ads on YouTube, you still can’t get rid of sponsorship ads. No matter how you watch YouTube, a popular creator may…"
/// url : "https://lifehacker.com/use-this-extension-to-block-sponsored-ads-on-youtube-1850932708"
/// urlToImage : "https://i.kinja-img.com/image/upload/c_fill,f_auto,fl_progressive,g_center,h_675,pg_1,q_80,w_1200/d0d5695105b38a7a32bab928fbf10793.jpg"
/// publishedAt : "2023-10-17T16:00:00Z"
/// content : "There are many ways to watch YouTube ad-free (I highly recommend YouTube Premium). But even if you shell out $13.99 per month to remove autoplay ads on YouTube, you still cant get rid of sponsorship … [+1811 chars]"

class News {
  News({
      this.source, 
      this.author, 
      this.title, 
      this.description, 
      this.url, 
      this.urlToImage, 
      this.publishedAt, 
      this.content,});

  News.fromJson(dynamic json) {
    source = json['source'] != null ? Source.fromJson(json['source']) : null;
    author = json['author'];
    title = json['title'];
    description = json['description'];
    url = json['url'];
    urlToImage = json['urlToImage'];
    publishedAt = json['publishedAt'];
    content = json['content'];
  }
  Source? source;
  String? author;
  String? title;
  String? description;
  String? url;
  String? urlToImage;
  String? publishedAt;
  String? content;
News copyWith({  Source? source,
  String? author,
  String? title,
  String? description,
  String? url,
  String? urlToImage,
  String? publishedAt,
  String? content,
}) => News(  source: source ?? this.source,
  author: author ?? this.author,
  title: title ?? this.title,
  description: description ?? this.description,
  url: url ?? this.url,
  urlToImage: urlToImage ?? this.urlToImage,
  publishedAt: publishedAt ?? this.publishedAt,
  content: content ?? this.content,
);
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (source != null) {
      map['source'] = source?.toJson();
    }
    map['author'] = author;
    map['title'] = title;
    map['description'] = description;
    map['url'] = url;
    map['urlToImage'] = urlToImage;
    map['publishedAt'] = publishedAt;
    map['content'] = content;
    return map;
  }

}