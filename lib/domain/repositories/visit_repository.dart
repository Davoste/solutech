import '../entities/visit.dart';

abstract class VisitRepository {
  Future<List<Visit>> getVisits();
  Future<void> addVisit(Visit visit);
  // Add other methods as needed, e.g., for filtering or updating visits
}
