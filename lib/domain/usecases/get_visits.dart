// domain/usecases/get_visits.dart
import '../entities/visit.dart';
import '../repositories/visit_repository.dart';

class GetVisits {
  final VisitRepository repository;

  GetVisits(this.repository);

  Future<List<Visit>> call() async {
    return await repository.getVisits();
  }
}
