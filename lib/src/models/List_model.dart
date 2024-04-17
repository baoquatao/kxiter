class ListBook {
  String? title;
  List<String>? authors;
  String? localizedDescription;
  int? pages;
  String? language;
  String? imgUrl;
  String? publisher;
  String? published;
  List<String>? categories;
  List<Identifiers>? identifiers;

  ListBook(
      {this.title,
      this.authors,
      this.localizedDescription,
      this.pages,
      this.language,
      this.imgUrl,
      this.publisher,
      this.published,
      this.categories,
      this.identifiers});

  ListBook.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    authors = json['authors'].cast<String>();
    localizedDescription = json['localizedDescription'];
    pages = json['pages'];
    language = json['language'];
    imgUrl = json['imgUrl'];
    publisher = json['publisher'];
    published = json['published'];
    categories = json['categories'].cast<String>();
    if (json['identifiers'] != null) {
      identifiers = <Identifiers>[];
      json['identifiers'].forEach((v) {
        identifiers!.add(new Identifiers.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['authors'] = this.authors;
    data['localizedDescription'] = this.localizedDescription;
    data['pages'] = this.pages;
    data['language'] = this.language;
    data['imgUrl'] = this.imgUrl;
    data['publisher'] = this.publisher;
    data['published'] = this.published;
    data['categories'] = this.categories;
    if (this.identifiers != null) {
      data['identifiers'] = this.identifiers!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Identifiers {
  String? type;
  String? identifier;

  Identifiers({this.type, this.identifier});

  Identifiers.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    identifier = json['identifier'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['identifier'] = this.identifier;
    return data;
  }
}
