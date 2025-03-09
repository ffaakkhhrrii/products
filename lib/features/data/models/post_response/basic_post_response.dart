import 'package:json_annotation/json_annotation.dart';

part 'basic_post_response.g.dart';

@JsonSerializable()
class BasicPostResponse {
    @JsonKey(name: "id")
    int id;
    @JsonKey(name: "title")
    String title;

    BasicPostResponse({
        required this.id,
        required this.title,
    });

    factory BasicPostResponse.fromJson(Map<String, dynamic> json) => _$BasicPostResponseFromJson(json);

    Map<String, dynamic> toJson() => _$BasicPostResponseToJson(this);
}
