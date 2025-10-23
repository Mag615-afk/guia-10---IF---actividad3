import '../models/festivity.dart';
import '../services/mock_service.dart';

class FestivityViewModel {
  final MockService _service = MockService();

  Future<List<Festivity>> getFestivities() {
    return _service.fetchFestivities();
  }

  Future<Festivity?> getFestivityById(String id) {
    return _service.getFestivityById(id);
  }
}
