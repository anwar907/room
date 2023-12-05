class HotelModels {
  final List<Entry>? entries;

  HotelModels({
    this.entries,
  });

  factory HotelModels.fromJson(Map<String, dynamic> json) => HotelModels(
        entries:
            List<Entry>.from(json["entries"].map((x) => Entry.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "entries": List<dynamic>.from(entries!.map((x) => x.toJson())),
      };
}

class Entry {
  final String? hotelName;
  final int? rating;
  final String? city;
  final String? thumbnail;
  final double? guestrating;
  final Ratings? ratings;
  final String? mapurl;
  final List<Filter>? filters;
  final int? price;

  Entry({
    this.hotelName,
    this.rating,
    this.city,
    this.thumbnail,
    this.guestrating,
    this.ratings,
    this.mapurl,
    this.filters,
    this.price,
  });

  factory Entry.fromJson(Map<String, dynamic> json) => Entry(
        hotelName: json["hotelName"],
        rating: json["rating"],
        city: json["city"],
        thumbnail: json["thumbnail"],
        guestrating: json["guestrating"].toDouble(),
        ratings: Ratings.fromJson(json["ratings"]),
        mapurl: json["mapurl"],
        filters:
            List<Filter>.from(json["filters"].map((x) => Filter.fromJson(x))),
        price: json["price"],
      );

  Map<String, dynamic> toJson() => {
        "hotelName": hotelName,
        "rating": rating,
        "city": city,
        "thumbnail": thumbnail,
        "guestrating": guestrating,
        "ratings": ratings?.toJson(),
        "mapurl": mapurl,
        "filters": List<dynamic>.from(filters!.map((x) => x.toJson())),
        "price": price,
      };
}

class Filter {
  final String? name;

  Filter({
    this.name,
  });

  factory Filter.fromJson(Map<String, dynamic> json) => Filter(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

class Ratings {
  final double? no;
  final String? text;

  Ratings({
    this.no,
    this.text,
  });

  factory Ratings.fromJson(Map<String, dynamic> json) => Ratings(
        no: json["no"].toDouble(),
        text: json["text"],
      );

  Map<String, dynamic> toJson() => {
        "no": no,
        "text": text,
      };
}
