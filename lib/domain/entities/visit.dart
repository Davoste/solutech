// domain/entities/visit.dart
class Visit {
  final int id;
  final int customerId;
  final DateTime visitDate;
  final String status;
  final String location;
  final String notes;
  final List<int> activitiesDone;
  final DateTime createdAt;

  Visit({
    required this.id,
    required this.customerId,
    required this.visitDate,
    required this.status,
    required this.location,
    required this.notes,
    required this.activitiesDone,
    required this.createdAt,
  });
}
