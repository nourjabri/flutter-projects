class AddressModel {
  final String area;
  final String city;
  final String street;
  final String floor;
  final String building;

  AddressModel(
      {required this.city,
      required this.floor,
      required this.street,
      required this.building,
      required this.area});
  Map<String, dynamic> toMap() {
    return {
      "city": city,
      "floor": floor,
      "building": building,
      "street": street,
      "area": area,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic> map) {
    return AddressModel(
        city: map["city"],
        floor: map["floor"],
        street: map['street'],
        building: map["building"],
        area: map["area"]);
  }
}
