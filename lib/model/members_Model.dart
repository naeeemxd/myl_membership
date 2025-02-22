class Member {
  String? voterId;
  String? membershipNumber;
  String? name;
  String? mobileNumber;
  String? fatherName;
  String? address;
  String? district;
  String? dob;
  int? age;
  String? bloodGroup;
  String? imagePath;

  Member({
    this.voterId,
    this.membershipNumber,
    this.name,
    this.mobileNumber,
    this.fatherName,
    this.address,
    this.district,
    this.dob,
    this.age,
    this.bloodGroup,
    this.imagePath,
  });

  // Convert Member object to a Map
  Map<String, dynamic> toMap() {
    return {
      'voterId': voterId,
      'membershipNumber': membershipNumber,
      'name': name,
      'mobileNumber': mobileNumber,
      'fatherName': fatherName,
      'address': address,
      'district': district,
      'dob': dob,
      'age': age,
      'bloodGroup': bloodGroup,
      'imagePath': imagePath,
    };
  }

  // Create Member object from a Map
  factory Member.fromMap(Map<String, dynamic> map) {
    return Member(
      voterId: map['voterId'],
      membershipNumber: map['membershipNumber'],
      name: map['name'],
      mobileNumber: map['mobileNumber'],
      fatherName: map['fatherName'],
      address: map['address'],
      district: map['district'],
      dob: map['dob'],
      age: map['age'],
      bloodGroup: map['bloodGroup'],
      imagePath: map['imagePath'],
    );
  }
}