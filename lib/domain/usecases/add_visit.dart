import 'package:visit_tracker/domain/entities/visit.dart';
import 'package:visit_tracker/domain/repositories/visit_repository.dart';

class AddVisit {
  final VisitRepository repository;

  AddVisit(this.repository);

  Future<void> call(Visit visit) async {
    await repository.addVisit(visit);
  }
}
