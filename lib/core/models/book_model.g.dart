// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BookModel _$BookModelFromJson(Map<String, dynamic> json) => BookModel(
      author: json['author'] as String?,
      country: json['country'] as String?,
      imageLink: json['imageLink'] as String?,
      language: json['language'] as String?,
      link: json['link'] as String?,
      pages: json['pages'] as int?,
      title: json['title'] as String?,
      year: json['year'] as int?,
    );

Map<String, dynamic> _$BookModelToJson(BookModel instance) => <String, dynamic>{
      'author': instance.author,
      'country': instance.country,
      'imageLink': instance.imageLink,
      'language': instance.language,
      'link': instance.link,
      'pages': instance.pages,
      'title': instance.title,
      'year': instance.year,
    };
