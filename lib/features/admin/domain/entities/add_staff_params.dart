import 'package:equatable/equatable.dart';

/// Parameters for creating a staff member account.
class AddStaffParams extends Equatable {
  final String name;
  final String email;
  final String password;
  final String? phone;
  final String? address;
  final String? photoUrl;

  const AddStaffParams({
    required this.name,
    required this.email,
    required this.password,
    this.phone,
    this.address,
    this.photoUrl,
  });

  Map<String, dynamic> toJson() => {
    'name': name,
    'email': email,
    'password': password,
    'phone': phone ?? '',
    'address': address ?? '',
    'photoURL': photoUrl ?? '',
  };

  @override
  List<Object?> get props => [name, email, password, phone, address, photoUrl];
}
