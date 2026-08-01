import '../../domain/entities/user_entity.dart';

/// Data model representing user payload from JSON backend API.
class UserModel extends UserEntity {
  const UserModel({
    required super.id,
    required super.name,
    required super.email,
    required super.role,
    super.isBlocked = false,
    super.isVerified = true,
    super.phone,
    super.avatarUrl,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['_id']?.toString() ?? json['id']?.toString() ?? '',
      name: json['name']?.toString() ?? json['displayName']?.toString() ?? '',
      email: json['email']?.toString() ?? '',
      role: json['role']?.toString() ?? 'citizen',
      isBlocked: json['isBlocked'] as bool? ?? false,
      isVerified: json['isVerified'] as bool? ?? true,
      phone: json['phone']?.toString(),
      avatarUrl: json['avatarUrl']?.toString() ?? json['photoURL']?.toString(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'role': role,
      'isBlocked': isBlocked,
      'isVerified': isVerified,
      if (phone != null) 'phone': phone,
      if (avatarUrl != null) 'avatarUrl': avatarUrl,
    };
  }

  UserEntity toEntity() => this;
}
