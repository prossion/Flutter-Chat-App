import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_social_app/futures/domain/usecases/get_current_uid_usecase.dart';
import 'package:flutter_social_app/futures/domain/usecases/is_sign_in_usecase.dart';
import 'package:flutter_social_app/futures/domain/usecases/sign_out_usecase.dart';
import 'package:flutter_social_app/futures/presentation/bloc/auth/auth_event.dart';
import 'package:flutter_social_app/futures/presentation/bloc/auth/auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final IsSignInUseCase isSignInUseCase;
  final SignOutUseCase signOutUseCase;
  final GetCurrentUIDUseCase getCurrentUIDUseCase;

  AuthBloc(
      {required this.isSignInUseCase,
      required this.signOutUseCase,
      required this.getCurrentUIDUseCase})
      : super(AuthInitialState()) {
    on<AppStartedEvent>((event, emit) async {
      try {
        // ignore: unused_local_variable
        bool isSignIn = await isSignInUseCase.call();
        // print(isSignIn);
        if (isSignIn = true) {
          final uid = await getCurrentUIDUseCase.call();
          emit(AuthenticatedState(uid: uid));
        } else {
          emit(UnAunthenticatedState());
        }
      } catch (_) {
        emit(UnAunthenticatedState());
        rethrow;
      }
    });
    on<LoggedInEvent>((event, emit) async {
      try {
        final uid = await getCurrentUIDUseCase.call();
        // print("user Id $uid");
        emit(AuthenticatedState(uid: uid));
      } catch (_) {
        // print("user Id null");
        emit(UnAunthenticatedState());
        rethrow;
      }
    });
    on<LoggetOutEvent>((event, emit) async {
      try {
        await signOutUseCase.call();
        emit(UnAunthenticatedState());
      } catch (_) {
        emit(UnAunthenticatedState());
        rethrow;
      }
    });
  }
}
