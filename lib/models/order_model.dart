import 'package:open_fashion/models/product_model.dart';

class OrderModel {
  final List<AddressModel>? address;
  final PaymentModel? payment;
   ProductSlectedModel? products;
   double? total;
   

  OrderModel({this.address, this.payment, this.products, this.total});

  static OrderModel? order = OrderModel(
    address: [AddressModel(
      id: 1,
      firstName: "Iris",
      lastName: "Watson",
      address: "606-3727 Ullamcorper. Street",
      city: "Roseville",
      state: "NH",
      zipCode: "11523",
      phone: "(786) 713-8616"),]
  );
}

class AddressModel {
  final int id;
  final String? firstName;
  final String? lastName;
  final String? address;
  final String? city;
  final String? state;
  final String? zipCode;
  final String? phone;

  // Static counter for auto-incrementing IDs

  AddressModel({
    int? id,
    this.firstName,
    this.lastName,
    this.address,
    this.city,
    this.state,
    this.zipCode,
    this.phone,
  }) : id = id ?? _getNextId();
  
  // Helper method to get the next available ID
  static int _getNextId() {
    final addresses = OrderModel.order?.address;
    if (addresses == null || addresses.isEmpty) {
      return 1; // First address gets ID 1
    }
    return addresses.last.id + 1; // Get last ID and increment
  }
  
  String get fullName => "$firstName $lastName";
  String get fullAddress => "$address, $city, $state, $zipCode";
  
  // Create a copy with updated values
  AddressModel copyWith({
    int? id,
    String? firstName,
    String? lastName,
    String? address,
    String? city,
    String? state,
    String? zipCode,
    String? phone,
  }) {
    return AddressModel(
      id: id ?? this.id, // Keep existing ID unless specified
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      address: address ?? this.address,
      city: city ?? this.city,
      state: state ?? this.state,
      zipCode: zipCode ?? this.zipCode,
      phone: phone ?? this.phone,
    );
  }
}

class ProductSlectedModel extends ProductModel{
  ProductSlectedModel( {required this.quantity,required super.id, required super.image, required super.name, required super.price, required super.description});
  final int quantity ;
}

class PaymentModel {
  final String? nameOnCart;
  final String? cardNumber;
  final String? expMonth;
  final String? expDate;
  final String? cvv;

  PaymentModel(
    {this.nameOnCart,
    this.cardNumber,
    this.expMonth,
    this.expDate,
    this.cvv,}
  );

  String? get lastTwoNumber {
    if (cardNumber != null && cardNumber!.length >= 2) {
      return "****${cardNumber!.substring(cardNumber!.length - 2)}";
    }
    return null;
  }
}