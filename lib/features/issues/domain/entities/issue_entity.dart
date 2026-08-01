import 'package:equatable/equatable.dart';

/// Pure domain entity representing a public infrastructure issue report.
class IssueEntity extends Equatable {
  final String id;
  final String title;
  final String description;
  final String category;
  final String status;
  final int upvotes;
  final String authorEmail;
  final String? assignedStaffEmail;
  final double? latitude;
  final double? longitude;
  final String? imageUrl;
  final DateTime createdAt;

  const IssueEntity({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.status,
    required this.upvotes,
    required this.authorEmail,
    this.assignedStaffEmail,
    this.latitude,
    this.longitude,
    this.imageUrl,
    required this.createdAt,
  });

  @override
  List<Object?> get props => [
        id,
        title,
        description,
        category,
        status,
        upvotes,
        authorEmail,
        assignedStaffEmail,
        latitude,
        longitude,
        imageUrl,
        createdAt,
      ];
}
