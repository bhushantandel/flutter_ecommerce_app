// To parse this JSON data, do
//
//     final topDealsModel = topDealsModelFromJson(jsonString);

import 'dart:convert';

DealsModel topDealsModelFromJson(String str) =>
    DealsModel.fromJson(json.decode(str));

String topDealsModelToJson(DealsModel data) => json.encode(data.toJson());

class DealsModel {
  SeoSettings? seoSettings;
  List<Deal>? deals;
  Event? event;

  DealsModel({
    this.seoSettings,
    this.deals,
    this.event,
  });

  factory DealsModel.fromJson(Map<String, dynamic> json) => DealsModel(
        seoSettings: json["seo_settings"] == null
            ? null
            : SeoSettings.fromJson(json["seo_settings"]),
        deals: json["deals"] == null
            ? []
            : List<Deal>.from(json["deals"]!.map((x) => Deal.fromJson(x))),
        event: json["event"] == null ? null : Event.fromJson(json["event"]),
      );

  Map<String, dynamic> toJson() => {
        "seo_settings": seoSettings?.toJson(),
        "deals": deals == null
            ? []
            : List<dynamic>.from(deals!.map((x) => x.toJson())),
        "event": event?.toJson(),
      };
}

class Deal {
  int? id;
  int? commentsCount;
  DateTime? createdAt;
  int? createdAtInMillis;
  String? imageMedium;
  Store? store;

  Deal({
    this.id,
    this.commentsCount,
    this.createdAt,
    this.createdAtInMillis,
    this.imageMedium,
    this.store,
  });

  factory Deal.fromJson(Map<String, dynamic> json) => Deal(
        id: json["id"],
        commentsCount: json["comments_count"],
        createdAt: json["created_at"] == null
            ? null
            : DateTime.parse(json["created_at"]),
        createdAtInMillis: json["created_at_in_millis"],
        imageMedium: json["image_medium"],
        store: json["store"] == null ? null : Store.fromJson(json["store"]),
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "comments_count": commentsCount,
        "created_at": createdAt?.toIso8601String(),
        "created_at_in_millis": createdAtInMillis,
        "image_medium": imageMedium,
        "store": store?.toJson(),
      };
}

class Store {
  String? name;

  Store({
    this.name,
  });

  factory Store.fromJson(Map<String, dynamic> json) => Store(
        name: json["name"],
      );

  Map<String, dynamic> toJson() => {
        "name": name,
      };
}

class Event {
  int? id;
  String? imageUrl;
  String? pageUrl;

  Event({
    this.id,
    this.imageUrl,
    this.pageUrl,
  });

  factory Event.fromJson(Map<String, dynamic> json) => Event(
        id: json["id"],
        imageUrl: json["image_url"],
        pageUrl: json["page_url"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "image_url": imageUrl,
        "page_url": pageUrl,
      };
}

class SeoSettings {
  String? seoTitle;
  String? seoDescription;
  String? webUrl;

  SeoSettings({
    this.seoTitle,
    this.seoDescription,
    this.webUrl,
  });

  factory SeoSettings.fromJson(Map<String, dynamic> json) => SeoSettings(
        seoTitle: json["seo_title"],
        seoDescription: json["seo_description"],
        webUrl: json["web_url"],
      );

  Map<String, dynamic> toJson() => {
        "seo_title": seoTitle,
        "seo_description": seoDescription,
        "web_url": webUrl,
      };
}
