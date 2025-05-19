import 'package:visit_tracker/domain/entities/visit.dart';

class VisitModel {
  final int id;
  final int customerId;
  final String visitDate;
  final String status;
  final String location;
  final String notes;
  final List<String> activitiesDone;
  final String createdAt;

  VisitModel({
    required this.id,
    required this.customerId,
    required this.visitDate,
    required this.status,
    required this.location,
    required this.notes,
    required this.activitiesDone,
    required this.createdAt,
  });

  factory VisitModel.fromJson(Map<String, dynamic> json) => VisitModel(
    id: json['id'],
    customerId: json['customer_id'],
    visitDate: json['visit_date'],
    status: json['status'],
    location: json['location'],
    notes: json['notes'],
    activitiesDone: List<String>.from(json['activities_done']),
    createdAt: json['created_at'],
  );

  factory VisitModel.fromEntity(Visit visit) => VisitModel(
    id: visit.id,
    customerId: visit.customerId,
    visitDate: visit.visitDate.toIso8601String(),
    status: visit.status,
    location: visit.location,
    notes: visit.notes,
    activitiesDone: visit.activitiesDone.map((id) => id.toString()).toList(),
    createdAt: visit.createdAt.toIso8601String(),
  );

  Map<String, dynamic> toJson() => {
    'id': id,
    'customer_id': customerId,
    'visit_date': visitDate,
    'status': status,
    'location': location,
    'notes': notes,
    'activities_done': activitiesDone,
    'created_at': createdAt,
  };
}

extension VisitModelExtension on VisitModel {
  Visit toEntity() => Visit(
    id: id,
    customerId: customerId,
    visitDate: DateTime.parse(visitDate),
    status: status,
    location: location,
    notes: notes,
    activitiesDone: activitiesDone.map((id) => int.parse(id)).toList(),
    createdAt: DateTime.parse(createdAt),
  );
}
