class EpisodesResult {
    final Info? info;
    final List<EpisodesModel>? results;

    EpisodesResult({
        this.info,
        this.results,
    });

    factory EpisodesResult.fromJson(Map<String, dynamic> json) => EpisodesResult(
        info: json["info"] == null ? null : Info.fromJson(json["info"]),
        results: json["results"] == null ? [] : List<EpisodesModel>.from(json["results"]!.map((x) => EpisodesModel.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "info": info?.toJson(),
        "results": results == null ? [] : List<dynamic>.from(results!.map((x) => x.toJson())),
    };
}

class Info {
    final int? count;
    final int? pages;
    final String? next;
    final dynamic prev;

    Info({
        this.count,
        this.pages,
        this.next,
        this.prev,
    });

    factory Info.fromJson(Map<String, dynamic> json) => Info(
        count: json["count"],
        pages: json["pages"],
        next: json["next"],
        prev: json["prev"],
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "pages": pages,
        "next": next,
        "prev": prev,
    };
}

class EpisodesModel {
    final int? id;
    final String? name;
    final String? airDate;
    final String? episode;
    final List<String>? characters;
    final String? url;
    final DateTime? created;

    EpisodesModel({
        this.id,
        this.name,
        this.airDate,
        this.episode,
        this.characters,
        this.url,
        this.created,
    });

    factory EpisodesModel.fromJson(Map<String, dynamic> json) => EpisodesModel(
        id: json["id"],
        name: json["name"],
        airDate: json["air_date"],
        episode: json["episode"],
        characters: json["characters"] == null ? [] : List<String>.from(json["characters"]!.map((x) => x)),
        url: json["url"],
        created: json["created"] == null ? null : DateTime.parse(json["created"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "air_date": airDate,
        "episode": episode,
        "characters": characters == null ? [] : List<dynamic>.from(characters!.map((x) => x)),
        "url": url,
        "created": created?.toIso8601String(),
    };
}
