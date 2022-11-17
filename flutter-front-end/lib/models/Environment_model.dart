class Environment {
  int? id;
  String city;
  double tempEnvironment;
  String airQuality;
  String state;
  String district;

  Environment({
    this.id,
    required this.airQuality,
    required this.city,
    required this.district,
    required this.state,
    required this.tempEnvironment,
  });

  Environment.fromJson(Map json)
      : id = json["id"],
        airQuality = json["airQuality"],
        city = json["city"],
        district = json["district"],
        state = json["state"],
        tempEnvironment = json["tempEnvironment"];
}
