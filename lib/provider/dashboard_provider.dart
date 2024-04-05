import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:frontend_vendor/model/dashboard_state.dart';

final dashboardProvider = StateNotifierProvider<DashBoardProvider, DashBoardState>((ref) {
  return DashBoardProvider();
});

final dashboardState = DashBoardState(dateTime: DateTime.now());

class DashBoardProvider extends StateNotifier<DashBoardState> {
  DashBoardProvider() : super(dashboardState);

  void incrementDate() {
    state = state.copyWith(dateTime: state.dateTime.add(const Duration(days: 1))); 
  }

  void decrementDate() {
    state = state.copyWith(dateTime: state.dateTime.subtract(const Duration(days: 1)));
  }
}
