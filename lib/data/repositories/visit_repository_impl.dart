import 'package:visit_tracker/core/network/api_client.dart';

import '../models/visit_model.dart';
// import '../sources/api_client.dart';
import '../../domain/entities/visit.dart';
import '../../domain/repositories/visit_repository.dart';

class VisitRepositoryImpl implements VisitRepository {
  final ApiClient apiClient;

  VisitRepositoryImpl(this.apiClient);

  @override
  Future<List<Visit>> getVisits() async {
    final data = await apiClient.get('/visits');
    return (data as List)
        .map((json) => VisitModel.fromJson(json).toEntity())
        .toList();
  }

  @override
  Future<void> addVisit(Visit visit) async {
    final model = VisitModel.fromEntity(visit);
    await apiClient.post('/visits', model.toJson());
  }
}
