class AddProductRequest {
  final String title;

  AddProductRequest({required this.title});

  Map<String, dynamic> toJson() => {
        "title": title,
      };
}
