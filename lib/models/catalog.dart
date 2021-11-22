class CatalogModel {
  static List<Item> items = [
    // Item(
    //     id: 001,
    //     name: "iPhone 12 pro",
    //     desc: "Apple iPhone 12th generation",
    //     price: 999,
    //     color: "#33505a",
    //     image: "https://m.media-amazon.com/images/I/71MHTD3uL4L.jpg")
  ];

  //get item by ID
  static Item getByID(int id) =>
      items.firstWhere((element) => element.id == id, orElse: null);

  //get item by position
  static Item getByPosition(int pos) => items[pos];
}

class Item {
  final int id;
  final String name;
  final String desc;
  final num price;
  final String color;
  final String image;

  Item(
      {required this.id,
      required this.name,
      required this.desc,
      required this.price,
      required this.color,
      required this.image});

  //json file na data n mapping karva mate use karvama ave 6 ahiya map atla mate 6 k apdo data map ma tranfrm thay6 atla mate map ma 6 and string atle 6 k json file ma apdi bathi key string ma 6 and jo int string bathu begu hoy to tame dynamic lakhi sako jem apde bija ma 6 and bija parameter ma dynamic no matalab data dynamic ma rese koi amne kbr nathi k pa6i te kai rite kam karse anu and have varo avse factory no ama use atle tahy 6 km k apde batha variable n final karela 6 and bijo use factory apdne help karse constructor choose karva ma vadhare janvu hoy to dart.dev or codepur.dev ma
  factory Item.fromMap(Map<String, dynamic> map) {
    return Item(
        id: map["id"],
        name: map["name"],
        desc: map["desc"],
        price: map["price"],
        color: map["color"],
        image: map["image"]);
  }

//encodeing method
  toMap() => {
        "id": id,
        "name": name,
        "desc": desc,
        "price": price,
        "color": color,
        "image": image,
      };
}
