import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scube_task_app/model/data_model.dart';

class DashboardController extends GetxController {
  final selectedTab = 0.obs;
  final isSourceSelected = true.obs;
  final scrollController = ScrollController();

  final List<String> tabTitles = ['Summary', 'SLD', 'Data'];

  final List<DataModel> solarData = [
    DataModel(label: 'Data 1', value: '55505.63'),
    DataModel(label: 'Data 2', value: '58805.63'),
  ];

  final List<DataModel> powerData = [
    DataModel(label: 'Live Power', value: '55505.63 kW'),
    DataModel(label: 'Today Energy', value: '58805.63 kWh'),
  ];

  void changeTab(int index) {
    selectedTab.value = index;
  }

  void toggleSource(bool isSource) {
    isSourceSelected.value = isSource;
  }

  @override
  void onClose() {
    scrollController.dispose();
    super.onClose();
  }
}