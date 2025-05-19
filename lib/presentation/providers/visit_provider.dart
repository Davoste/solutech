import 'package:flutter/material.dart';
import 'package:visit_tracker/domain/usecases/add_visit.dart';
import '../../domain/usecases/get_visits.dart';

import '../../domain/entities/visit.dart';

class VisitProvider with ChangeNotifier {
  final GetVisits getVisits;
  final AddVisit addVisit;
  List<Visit> _visits = [];
  bool _isLoading = false;
  String? _error;

  VisitProvider(this.getVisits, this.addVisit);

  List<Visit> get visits => _visits;
  bool get isLoading => _isLoading;
  String? get error => _error;

  Future<void> fetchVisits() async {
    _isLoading = true;
    notifyListeners();
    try {
      _visits = await getVisits();
      _error = null;
    } catch (e) {
      _error = e.toString();
    }
    _isLoading = false;
    notifyListeners();
  }

  Future<void> addNewVisit(Visit visit) async {
    _isLoading = true;
    notifyListeners();
    try {
      await addVisit(visit);
      await fetchVisits();
      _error = null;
    } catch (e) {
      _error = e.toString();
    }
    _isLoading = false;
    notifyListeners();
  }
}
