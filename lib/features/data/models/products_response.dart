import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:products/features/domain/entities/product_data.dart';

part 'products_response.g.dart';

@JsonSerializable()
class ProductsResponse {
    @JsonKey(name: "products")
    List<Product> products;
    @JsonKey(name: "total")
    int total;
    @JsonKey(name: "skip")
    int skip;
    @JsonKey(name: "limit")
    int limit;

    ProductsResponse({
        required this.products,
        required this.total,
        required this.skip,
        required this.limit,
    });

    factory ProductsResponse.fromJson(Map<String, dynamic> json) => _$ProductsResponseFromJson(json);

    Map<String, dynamic> toJson() => _$ProductsResponseToJson(this);
    
}

@JsonSerializable()
class Product extends Equatable {
  @JsonKey(name: "id")
  int? id;

  @JsonKey(name: "title")
  String? title;

  @JsonKey(name: "description")
  String? description;

  @JsonKey(name: "category")
  String? category;

  @JsonKey(name: "price")
  double? price;

  @JsonKey(name: "discountPercentage")
  double? discountPercentage;

  @JsonKey(name: "rating")
  double? rating;

  @JsonKey(name: "stock")
  int? stock;

  @JsonKey(name: "tags")
  List<String>? tags;

  @JsonKey(name: "brand")
  String? brand;

  @JsonKey(name: "sku")
  String? sku;

  @JsonKey(name: "weight")
  int? weight;

  @JsonKey(name: "dimensions")
  Dimensions? dimensions;

  @JsonKey(name: "warrantyInformation")
  String? warrantyInformation;

  @JsonKey(name: "shippingInformation")
  String? shippingInformation;

  @JsonKey(name: "availabilityStatus")
  String? availabilityStatus;

  @JsonKey(name: "reviews")
  List<Review>? reviews;

  @JsonKey(name: "returnPolicy")
  String? returnPolicy;

  @JsonKey(name: "minimumOrderQuantity")
  int? minimumOrderQuantity;

  @JsonKey(name: "meta")
  Meta? meta;

  @JsonKey(name: "thumbnail")
  String? thumbnail;

  @JsonKey(name: "images")
  List<String>? images;

  Product({
    this.id,
    this.title,
    this.description,
    this.category,
    this.price,
    this.discountPercentage,
    this.rating,
    this.stock,
    this.tags,
    this.brand,
    this.sku,
    this.weight,
    this.dimensions,
    this.warrantyInformation,
    this.shippingInformation,
    this.availabilityStatus,
    this.reviews,
    this.returnPolicy,
    this.minimumOrderQuantity,
    this.meta,
    this.thumbnail,
    this.images,
  });

  factory Product.fromJson(Map<String, dynamic> json) => _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);

  @override
  List<Object?> get props {
    return [
      id,
      title,
      description,
      category,
      price,
      discountPercentage,
      rating,
      stock,
      tags,
      brand,
      sku,
      weight,
      dimensions,
      warrantyInformation,
      shippingInformation,
      availabilityStatus,
      reviews,
      returnPolicy,
      minimumOrderQuantity,
      meta,
      thumbnail,
      images,
    ];
  }

  ProductData toEntity() {
    return ProductData(
      id: id ?? 0,
      description: description ?? '',
      thumbnail: thumbnail ?? '',
      title: title ?? '',
      price: price?? 0.0
    );
  }
}

@JsonSerializable()
class Dimensions {
  @JsonKey(name: "width")
  double? width;

  @JsonKey(name: "height")
  double? height;

  @JsonKey(name: "depth")
  double? depth;

  Dimensions({
    this.width,
    this.height,
    this.depth,
  });

  factory Dimensions.fromJson(Map<String, dynamic> json) => _$DimensionsFromJson(json);

  Map<String, dynamic> toJson() => _$DimensionsToJson(this);
}

@JsonSerializable()
class Meta {
  @JsonKey(name: "createdAt")
  DateTime? createdAt;

  @JsonKey(name: "updatedAt")
  DateTime? updatedAt;

  @JsonKey(name: "barcode")
  String? barcode;

  @JsonKey(name: "qrCode")
  String? qrCode;

  Meta({
    this.createdAt,
    this.updatedAt,
    this.barcode,
    this.qrCode,
  });

  factory Meta.fromJson(Map<String, dynamic> json) => _$MetaFromJson(json);

  Map<String, dynamic> toJson() => _$MetaToJson(this);
}

@JsonSerializable()
class Review {
  @JsonKey(name: "rating")
  int? rating;

  @JsonKey(name: "comment")
  String? comment;

  @JsonKey(name: "date")
  DateTime? date;

  @JsonKey(name: "reviewerName")
  String? reviewerName;

  @JsonKey(name: "reviewerEmail")
  String? reviewerEmail;

  Review({
    this.rating,
    this.comment,
    this.date,
    this.reviewerName,
    this.reviewerEmail,
  });

  factory Review.fromJson(Map<String, dynamic> json) => _$ReviewFromJson(json);

  Map<String, dynamic> toJson() => _$ReviewToJson(this);
}