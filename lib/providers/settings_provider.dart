import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SettingsProvider with ChangeNotifier {
  bool _lowBatteryAlerts = true;
  bool _chargingCompleteAlerts = true;
  bool _promotionalUpdates = false;

  bool get lowBatteryAlerts => _lowBatteryAlerts;
  bool get chargingCompleteAlerts => _chargingCompleteAlerts;
  bool get promotionalUpdates => _promotionalUpdates;

  SettingsProvider() {
    loadSettings();
  }

  Future<void> loadSettings() async {
    final prefs = await SharedPreferences.getInstance();
    _lowBatteryAlerts = prefs.getBool('lowBatteryAlerts') ?? true;
    _chargingCompleteAlerts = prefs.getBool('chargingCompleteAlerts') ?? true;
    _promotionalUpdates = prefs.getBool('promotionalUpdates') ?? false;
    notifyListeners();
  }

  Future<void> _savePreference(String key, bool value) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(key, value);
  }

  void setLowBatteryAlerts(bool value) {
    _lowBatteryAlerts = value;
    _savePreference('lowBatteryAlerts', value);
    notifyListeners();
  }

  void setChargingCompleteAlerts(bool value) {
    _chargingCompleteAlerts = value;
    _savePreference('chargingCompleteAlerts', value);
    notifyListeners();
  }

  void setPromotionalUpdates(bool value) {
    _promotionalUpdates = value;
    _savePreference('promotionalUpdates', value);
    notifyListeners();
  }
}
