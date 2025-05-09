import 'package:bloc/bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class StatesCubit extends Cubit<int> {
  StatesCubit() : super(0);
  void changeState() {
    if (state < 4) {
      emit(state + 1);
    }
  }
}

// class rtatesCubit extends Cubit<int> {
//   rtatesCubit() : super(0);
//   int index = 0;
//   void changeState() {
//     if (index != 5) {
//       index++;
//       emit(index);
//     }
//   }
// }
