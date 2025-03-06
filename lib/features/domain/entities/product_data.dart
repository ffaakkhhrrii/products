import 'package:equatable/equatable.dart';

class ProductData extends Equatable {
  final int id;
  final String title;
  final String description;
  final String thumbnail;
  final double price;

  const ProductData({
    required this.id,
    required this.description,
    required this.thumbnail,
    required this.title,
    required this.price});

  @override
  List<Object?> get props {
    return [id, title, description, thumbnail, price];
  }
}
