class ProductModel {
  int? count;
  List<Results>? results;

  ProductModel({this.count, this.results});

  ProductModel.fromJson(Map<String, dynamic> json) {
    count = json['count'];
    if (json['results'] != null) {
      results = <Results>[];
      json['results'].forEach((v) {
        results!.add(new Results.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['count'] = this.count;
    if (this.results != null) {
      data['results'] = this.results!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Results {
  int? id;
  String? name;
  String? image;
  String? size;
  String? price;
  String? createAt;
  int? collection;

  Results(
      {this.id,
      this.name,
      this.image,
      this.size,
      this.price,
      this.createAt,
      this.collection});

  Results.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    size = json['size'];
    price = json['price'];
    createAt = json['create_at'];
    collection = json['collection'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['size'] = this.size;
    data['price'] = this.price;
    data['create_at'] = this.createAt;
    data['collection'] = this.collection;
    return data;
  }
}
