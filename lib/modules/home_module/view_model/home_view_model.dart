import 'package:flutter/material.dart';
import 'package:teste_tecnico_guia_de_moteis/core/architecture/result_architecture.dart';
import 'package:teste_tecnico_guia_de_moteis/core/enum/filter_suite_enum.dart';
import 'package:teste_tecnico_guia_de_moteis/core/extensions/motel_model_list_extension.dart';
import 'package:teste_tecnico_guia_de_moteis/core/models/motel_model.dart';
import 'package:teste_tecnico_guia_de_moteis/modules/home_module/repository/home_repository.dart';

class HomeViewModel extends ChangeNotifier {
  final HomeRepository _homeRepository;

  HomeViewModel(this._homeRepository);

  /// Vars
  bool _isLoading = false;
  String? _errorMessage;
  String _searchQuery = '';
  List<MotelModel> _motels = [];
  List<MotelModel> _filteredMotels = [];
  List<FilterSuiteEnum> _selectedFilters = [];

  List<FilterSuiteEnum> get selectedFilters => _selectedFilters;

  /// Getters
  bool get isLoading => _isLoading;

  String? get errorMessage => _errorMessage;

  List<MotelModel> get motels => _motels;

  List<MotelModel> get filteredMotels => _filteredMotels;

  String get searchQuery => _searchQuery;

  /// Functions
  void setLoading(bool value, {bool notifyChanges = false}) {
    _isLoading = value;

    if (notifyChanges) {
      notifyListeners();
    }
  }

  void setErrorMessage(String? message, {bool notifyChanges = false}) {
    _errorMessage = message;

    if (notifyChanges) {
      notifyListeners();
    }
  }

  void setSearchQuery(String value) {
    _searchQuery = value;
    notifyListeners();
  }

  void toggleFilter(FilterSuiteEnum filter) {
    if (filter == FilterSuiteEnum.filtros) return;

    final currentFilters = List<FilterSuiteEnum>.from(_selectedFilters);

    if (currentFilters.contains(filter)) {
      currentFilters.remove(filter);
    } else {
      currentFilters.add(filter);
    }

    _selectedFilters = currentFilters;
    _filteredMotels = _motels.filterBySuiteFilters(_selectedFilters);

    notifyListeners();
  }

  void clearAllFilters() {
    _selectedFilters = [];
    _filteredMotels = _motels;
    notifyListeners();
  }

  /// Async functions
  Future<void> fetchMotels() async {
    setLoading(true);
    setErrorMessage(null);

    final result = await _homeRepository.getMotels();

    switch (result) {
      case Success(value: final motels):
        _motels = motels;
        _filteredMotels = _motels;
      case Failure(exception: final e):
        setErrorMessage(e.toString());
    }

    setLoading(false);
    notifyListeners();
  }
}
