import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

class TabState {
  final int currentIndex; 
  TabState({required this.currentIndex});
}

@singleton
class TabCubit extends Cubit<TabState> {
  TabCubit() : super(TabState(currentIndex: 0)); 

  void setTabIndex(int index) {
    emit(TabState(currentIndex: index));
  }
}
