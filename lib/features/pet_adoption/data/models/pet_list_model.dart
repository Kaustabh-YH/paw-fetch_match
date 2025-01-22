class PetListModel {
  List<Pets>? pets;

  PetListModel({this.pets});

  PetListModel.fromJson(Map<String, dynamic> json) {
    if (json['pets'] != null) {
      pets = <Pets>[];
      json['pets'].forEach((v) {
        pets!.add(Pets.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (pets != null) {
      data['pets'] = pets!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Pets {
  int? id;
  String? name;
  String? category;
  bool? alreadyAdopted;
  String? location;
  String? imageUrl;

  Pets(
      {this.id, this.name,
        this.category,
        this.alreadyAdopted,
        this.location,
        this.imageUrl});

  Pets.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    category = json['category'];
    alreadyAdopted = json['already_adopted'];
    location = json['location'];
    imageUrl = json['image_url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['category'] = category;
    data['already_adopted'] = alreadyAdopted;
    data['location'] = location;
    data['image_url'] = imageUrl;
    return data;
  }
}
