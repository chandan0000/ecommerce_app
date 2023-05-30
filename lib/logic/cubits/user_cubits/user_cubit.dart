import 'package:ecommerce/data/models/user_model.dart';
import 'package:ecommerce/data/repositories/user_repository.dart';
import 'package:ecommerce/logic/cubits/user_cubits/user_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserCubit extends Cubit<UserState> {
  UserCubit() : super(UserInitialState());
  final UserRepository _userRepository = UserRepository();
  void signIn({
    required String email,
    required String password,
  }) async {
    try {
      emit(UserLoadingState());
      UserModel userModel =
          await _userRepository.signIn(email: email, password: password);
      emit(UserLoggedInState(userModel));
    } catch (ex) {
      print(ex);
      emit(UserErrorState(ex.toString()));
    }
  }

  void createAccount({
    required String email,
    required String password,
  }) async {
    try {
      UserModel userModel =
          await _userRepository.createAccount(email: email, password: password);
      emit(UserLoggedInState(userModel));
    } catch (ex) {
      print(ex);
      emit(UserErrorState(ex.toString()));
    }
  }
}
