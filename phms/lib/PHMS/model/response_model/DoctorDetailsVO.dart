class DoctorDetailsVO {
  String? name;
  String? specialty;
  String? hospital;
  String? address;
  String? city;
  String? state;
  String? country;
  String? zipCode;
  String? phoneNumber;
  String? email;
  String? photoUrl;

  DoctorDetailsVO({
    this.name,
    this.specialty,
    this.hospital,
    this.address,
    this.city,
    this.state,
    this.country,
    this.zipCode,
    this.phoneNumber,
    this.email,
    this.photoUrl,
  });

  // Factory method to create a Doctor object from JSON
  factory DoctorDetailsVO.fromJson(Map<String, dynamic> json) {
    return DoctorDetailsVO(
      name: json['name'],
      specialty: json['specialty'],
      hospital: json['hospital'],
      address: json['address'],
      city: json['city'],
      state: json['state'],
      country: json['country'],
      zipCode: json['zipCode'],
      phoneNumber: json['phoneNumber'],
      email: json['email'],
      photoUrl: json['photoUrl'],
    );
  }

  // Method to convert a Doctor object to JSON
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'specialty': specialty,
      'hospital': hospital,
      'address': address,
      'city': city,
      'state': state,
      'country': country,
      'zipCode': zipCode,
      'phoneNumber': phoneNumber,
      'email': email,
      'photoUrl': photoUrl,
    };
  }
}