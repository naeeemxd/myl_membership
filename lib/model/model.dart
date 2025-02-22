
class Councilor {
  String name, phone, district, panchayath, unit, age, blood, image;
  bool isSelected;

  Councilor({
    required this.name,
    required this.phone,
    required this.district,
    required this.panchayath,
    required this.unit,
    required this.age,
    required this.blood,
    required this.image,
    this.isSelected = false,
  });
}
