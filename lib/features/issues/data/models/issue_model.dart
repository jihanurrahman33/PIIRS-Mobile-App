import '../../domain/entities/issue_entity.dart';

/// Data layer model extending IssueEntity with JSON serialization.
class IssueModel extends IssueEntity {
  const IssueModel({
    required super.id,
    required super.title,
    required super.description,
    required super.category,
    required super.status,
    required super.upvotes,
    required super.authorEmail,
    super.assignedStaffEmail,
    super.latitude,
    super.longitude,
    super.imageUrl,
    required super.createdAt,
  });

  factory IssueModel.fromJson(Map<String, dynamic> json) {
    return IssueModel(
      id: json['_id'] as String? ?? json['id'] as String? ?? '',
      title: json['title'] as String? ?? '',
      description: json['description'] as String? ?? '',
      category: json['category'] as String? ?? 'General',
      status: json['status'] as String? ?? 'Pending',
      upvotes: json['upvotes'] as int? ?? 0,
      authorEmail: json['author_email'] as String? ??
          json['user_email'] as String? ??
          '',
      assignedStaffEmail: json['assigned_staff_email'] as String?,
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      imageUrl: json['image_url'] as String?,
      createdAt: json['created_at'] != null
          ? DateTime.parse(json['created_at'] as String)
          : DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'title': title,
      'description': description,
      'category': category,
      'status': status,
      'upvotes': upvotes,
      'author_email': authorEmail,
      if (assignedStaffEmail != null)
        'assigned_staff_email': assignedStaffEmail,
      if (latitude != null) 'latitude': latitude,
      if (longitude != null) 'longitude': longitude,
      if (imageUrl != null) 'image_url': imageUrl,
      'created_at': createdAt.toIso8601String(),
    };
  }

  factory IssueModel.fromEntity(IssueEntity entity) {
    return IssueModel(
      id: entity.id,
      title: entity.title,
      description: entity.description,
      category: entity.category,
      status: entity.status,
      upvotes: entity.upvotes,
      authorEmail: entity.authorEmail,
      assignedStaffEmail: entity.assignedStaffEmail,
      latitude: entity.latitude,
      longitude: entity.longitude,
      imageUrl: entity.imageUrl,
      createdAt: entity.createdAt,
    );
  }
}
