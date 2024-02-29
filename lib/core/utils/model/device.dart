// ignore_for_file: non_constant_identifier_names

class Devices {
  late num? PricePerHourPS4;
  late num? PricePerHourPS5;
  late num? PricePerHourPC;
  late num? CountPC;
  late num? CountPS4;
  late num? CountPS5;

  Devices(
      {required this.PricePerHourPS4,
      required this.PricePerHourPS5,
      required this.PricePerHourPC,
      required this.CountPC,
      required this.CountPS4,
      required this.CountPS5});

  Devices.fromJson(Map<String, dynamic> json) {
    CountPC = json['CountPC'];
    CountPS4 = json['CountPS4'];
    CountPS5 = json['CountPS5'];
    PricePerHourPC = json['PricePerHourPC'];
    PricePerHourPS5 = json['PricePerHourPS5'];
    PricePerHourPS4 = json['PricePerHourPS4'];
  }
}
