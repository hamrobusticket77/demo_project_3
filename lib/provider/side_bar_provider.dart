import 'package:flutter_riverpod/flutter_riverpod.dart';

class SideNavState {
  final bool isSidebarOpen;
  final int selectedIndex;

  SideNavState({required this.isSidebarOpen, required this.selectedIndex});

  SideNavState copyWith({bool? isSidebarOpen, int? selectedIndex}) {
    return SideNavState(
      isSidebarOpen: isSidebarOpen ?? this.isSidebarOpen,
      selectedIndex: selectedIndex ?? this.selectedIndex,
    );
  }
}

final defaultSideState = SideNavState(isSidebarOpen: true, selectedIndex: 0);

class SidebarProvider extends StateNotifier<SideNavState> {
  SidebarProvider() : super(defaultSideState);

  void changeSeletedIndex(int index) {
    state = state.copyWith(selectedIndex: index);
  }
}


final sidebarProvider=StateNotifierProvider<SidebarProvider,SideNavState>((ref){
  return SidebarProvider();
});