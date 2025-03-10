class FavoriteData {
  int? id;
  String? nameProduct;

  FavoriteData({this.id,this.nameProduct});

  Map<String, dynamic> toMap() {
    return {'id': id, 'name': nameProduct};
  }

  factory FavoriteData.fromMap(Map<String, dynamic> map) {
    return FavoriteData(
      id: map['id'],
      nameProduct: map['name'],
    );
  }

  
}