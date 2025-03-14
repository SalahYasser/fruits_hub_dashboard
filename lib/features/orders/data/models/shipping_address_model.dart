import 'package:fruits_hub_dashboard/features/orders/domain/entities/data/shipping_address_entity.dart';

class ShippingAddressModel {
  String? name;
  String? email;
  String? address;
  String? city;
  String? phone;
  String? floor;

  ShippingAddressModel({
    this.name,
    this.email,
    this.address,
    this.city,
    this.phone,
    this.floor,
  });

  @override
  String toString() {
    return '$address $floor $city';
  }

  factory ShippingAddressModel.fromJson(Map<String, dynamic> json) {
    return ShippingAddressModel(
      name: json['name'],
      email: json['email'],
      address: json['address'],
      city: json['city'],
      phone: json['phone'],
      floor: json['floor'],
    );
  }

  toJson() {
    return {
      'name': name,
      'email': email,
      'address': address,
      'city': city,
      'phone': phone,
      'floor': floor,
    };
  }

  toEntity() {
    return ShippingAddressEntity(
      name: name,
      email: email,
      address: address,
      city: city,
      phone: phone,
      floor: floor,
    );
  }
}
