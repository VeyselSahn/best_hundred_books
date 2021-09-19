import 'package:json_annotation/json_annotation.dart';
import 'package:vexana/vexana.dart';

part 'book_model.g.dart';

@JsonSerializable()
class BookModel extends INetworkModel<BookModel> {
  String? author;
  String? country;
  String? imageLink;
  String? language;
  String? link;
  int? pages;
  String? title;
  int? year;

  BookModel(
      {this.author,
      this.country,
      this.imageLink,
      this.language,
      this.link,
      this.pages,
      this.title,
      this.year});

  factory BookModel.fromJson(Map<String, dynamic> json) =>
      _$BookModelFromJson(json);

  @override
  BookModel fromJson(Map<String, dynamic> json) {
    return _$BookModelFromJson(json);
  }

  @override
  Map<String, dynamic> toJson() => _$BookModelToJson(this);
  @override
  String toString() {
    return toJson().toString();
  }
}
