import 'package:flutter/material.dart';
import 'package:get/get.dart';

class EnergyDashboardController extends GetxController {
  final isDataView = true.obs;
  final isTodayData = true.obs;
  final isExpanded = true.obs;
  final Rx<DateTime?> fromDate = Rx<DateTime?>(null);
  final Rx<DateTime?> toDate = Rx<DateTime?>(null);

  void toggleView(bool isData) {
    isDataView.value = isData;
  }

  void toggleDataType(bool isToday) {
    isTodayData.value = isToday;
  }

  void toggleExpanded() {
    isExpanded.value = !isExpanded.value;
  }

  Future<void> selectFromDate(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: fromDate.value ?? DateTime.now(),
      firstDate: DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (date != null) {
      fromDate.value = date;
    }
  }

  Future<void> selectToDate(BuildContext context) async {
    final date = await showDatePicker(
      context: context,
      initialDate: toDate.value ?? DateTime.now(),
      firstDate: fromDate.value ?? DateTime(2020),
      lastDate: DateTime.now(),
    );
    if (date != null) {
      toDate.value = date;
    }
  }

  void searchData() {
    if (fromDate.value != null && toDate.value != null) {
      Get.snackbar(
        'Searching',
        'Searching from ${fromDate.value!.toString().split(' ')[0]} to ${toDate.value!.toString().split(' ')[0]}',
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }

  double get gaugeProgress {
    if (isDataView.value) {
      return isTodayData.value ? 0.55 : 0.57;
    }
    return 0.65;
  }

  String get gaugeValue {
    if (isDataView.value) {
      return isTodayData.value ? '55.00' : '57.00';
    }
    return '8897455';
  }

  String get gaugeUnit {
    return isDataView.value ? 'kWh/Sqft' : 'tk';
  }
}