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
      id: json['_id']?.toString() ?? json['id']?.toString() ?? '',
      title: json['title']?.toString() ?? '',
      description: json['description']?.toString() ?? '',
      category: json['category']?.toString() ?? 'General',
      status: json['status']?.toString() ?? 'Pending',
      upvotes: (json['upvotes'] as num?)?.toInt() ?? 0,
      authorEmail:
          json['createdBy']?.toString() ??
          json['author_email']?.toString() ??
          json['user_email']?.toString() ??
          '',
      assignedStaffEmail: json['assignedStaff'] is Map
          ? (json['assignedStaff'] as Map)['email']?.toString()
          : json['assignedStaff']?.toString() ??
                json['assigned_staff_email']?.toString(),
      latitude: (json['latitude'] as num?)?.toDouble(),
      longitude: (json['longitude'] as num?)?.toDouble(),
      imageUrl:
          json['imageUrl']?.toString() ??
          json['photoURL']?.toString() ??
          json['image_url']?.toString(),
      createdAt:
          DateTime.tryParse(
            json['createdAt']?.toString() ??
                json['created_at']?.toString() ??
                '',
          ) ??
          DateTime.now(),
    );
  }

  Map<String, dynamic> toJson() => {
    'title': title,
    'description': description,
    'category': category,
    'status': status,
    'upvotes': upvotes,
    if (assignedStaffEmail != null) 'assignedStaff': assignedStaffEmail,
    if (latitude != null) 'latitude': latitude,
    if (longitude != null) 'longitude': longitude,
    if (imageUrl != null) 'imageUrl': imageUrl,
  };

  factory IssueModel.fromEntity(IssueEntity entity) => IssueModel(
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
