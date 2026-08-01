import 'package:equatable/equatable.dart';

/// Pure domain entity representing an authenticated user.
class UserEntity extends Equatable {
  final String id;
  final String name;
  final String email;
  final String role;
  final bool isBlocked;
  final bool isVerified;
  final String? phone;
  final String? avatarUrl;

  const UserEntity({
    required this.id,
    required this.name,
    required this.email,
    required this.role,
    this.isBlocked = false,
    this.isVerified = true,
    this.phone,
    this.avatarUrl,
  });

  bool get isCitizen => role == 'citizen';
  bool get isStaff => role == 'staff';
  bool get isAdmin => role == 'admin';

  @override
  List<Object?> get props => [
        id,
        name,
        email,
        role,
        isBlocked,
        isVerified,
        phone,
        avatarUrl,
      ];
}
