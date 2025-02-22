import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:olx_clone/code/ambience/vars.dart';

class Ad {
  final String adId;
  final String postedBy;
  final String title;
  final String price;
  final String maker;
  final String category;
  final String model;
  final String year;
  final String condition;
  final String description;
  final int views;
  final List images;
  // approx location (lang, lat) of where the ad was posted
  final String postedAt;
  // final DateTime postedDate;
  final GeoPoint adUploadLocation;
  final List chats;

  const Ad({
    // this.postedDate,
    this.adId,
    this.postedBy,
    this.title,
    this.price,
    this.maker,
    this.category,
    this.model,
    this.year,
    this.condition,
    this.description,
    this.views,
    this.images,
    this.postedAt,
    this.adUploadLocation,
    this.chats,
  });

  factory Ad.fromDocument(DocumentSnapshot document) {
    Map<String, dynamic> data = document.data();
    return Ad(
      adId: document.id,
      title: data['title'] ?? 'no title',
      price: data['price'] ?? '0',
      maker: data['maker'] ?? '',
      model: data['model'] ?? '',
      year: data['year'] ?? '',
      condition: data['condition'] ?? '',
      description: data['description'] ?? '',
      views: data['views'] ?? 0,
      postedBy: data['postedBy'] ?? '',
      postedAt: data['postedAt'] ?? 'post date unknown',
      // images: data['images']?? ['https://ppc.tools/wp-content/themes/ppctools/img/no-thumbnail.jpg'],
      images:
          (data['images'] as List).isEmpty ? [noTumbnailUrl] : data['images'],
      chats: data['chats'] ?? [],
      adUploadLocation: data['adUploadLocation'] ?? GeoPoint(12, 12),
    );
  }

  Map<String, dynamic> toDocument() {
    return {
      'adId': this.adId,
      'postedBy': this.postedBy,
      'title': this.title,
      'price': this.price,
      'maker': this.maker,
      'model': this.model,
      'year': this.year,
      'condition': this.condition,
      'description': this.description,
      'views': this.views,
      'images': this.images,
      // 'postedAt': this.postedAt?.millisecondsSinceEpoch,
      'postedAt': this.postedAt,
      'chats': this.chats,
      'adUploadLocation': this.adUploadLocation,
    };
  }
}
