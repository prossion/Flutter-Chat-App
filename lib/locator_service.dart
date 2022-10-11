import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_social_app/futures/data/datasources/remote/firebase_remote_data_source.dart';
import 'package:flutter_social_app/futures/data/datasources/remote/firebase_remote_data_source_impl.dart';
import 'package:flutter_social_app/futures/data/repositories/firebase_repository_impl.dart';
import 'package:flutter_social_app/futures/domain/repositories/firebase_repository.dart';
import 'package:flutter_social_app/futures/domain/usecases/delete_text_message_usecase.dart';
import 'package:flutter_social_app/futures/domain/usecases/delete_user_usecase.dart';
import 'package:flutter_social_app/futures/domain/usecases/join_chat_message_usecase.dart';
import 'package:flutter_social_app/futures/domain/usecases/usecase.dart';
import 'package:flutter_social_app/futures/presentation/bloc/bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:google_sign_in/google_sign_in.dart';

final sl = GetIt.instance;

Future<void> init() async {
  //Bloc
  sl.registerFactory<AuthBloc>(() => AuthBloc(
        isSignInUseCase: sl.call(),
        signOutUseCase: sl.call(),
        getCurrentUIDUseCase: sl.call(),
      ));
  sl.registerFactory<GroupBloc>(() => GroupBloc(
      getCreateGroupUseCase: sl.call(),
      getAllGroupsUseCase: sl.call(),
      joinGroupUseCase: sl.call(),
      groupUseCase: sl.call()));
  sl.registerFactory<CredentialBloc>(() => CredentialBloc(
        signUpUseCase: sl.call(),
        signInUseCase: sl.call(),
        forgotPasswordUseCase: sl.call(),
        getCreateCurrentUserUseCase: sl.call(),
        googleSignInUseCase: sl.call(),
      ));
  sl.registerFactory<UserBloc>(() => UserBloc(
        getAllUsersUsecase: sl.call(),
        getUpdateUserUseCase: sl.call(),
        getDeleteUserUseCase: sl.call(),
      ));
  sl.registerFactory<ChatBloc>(() => ChatBloc(
        sendTextMessageUseCase: sl.call(),
        getMessageUseCase: sl.call(),
        deleteTextMessageUseCase: sl.call(),
      ));
  sl.registerFactory<MyGroupBloc>(() => MyGroupBloc(
        updateDataFirestoreUseCase: sl.call(),
        joinChatMessageUseCase: sl.call(),
      ));
  sl.registerFactory<ThemeCubit>(
    () => ThemeCubit(initialTheme: sl.call()),
  );

  // UseCases
  sl.registerLazySingleton<GoogleSignInUseCase>(
      () => GoogleSignInUseCase(repository: sl.call()));
  sl.registerLazySingleton<ForgotPasswordUseCase>(
      () => ForgotPasswordUseCase(repository: sl.call()));
  sl.registerLazySingleton<GetCreateCurrentUserUseCase>(
      () => GetCreateCurrentUserUseCase(repository: sl.call()));
  sl.registerLazySingleton<GetCurrentUIDUseCase>(
      () => GetCurrentUIDUseCase(repository: sl.call()));
  sl.registerLazySingleton<IsSignInUseCase>(
      () => IsSignInUseCase(repository: sl.call()));
  sl.registerLazySingleton<SignInUseCase>(
      () => SignInUseCase(repository: sl.call()));
  sl.registerLazySingleton<SignUpUseCase>(
      () => SignUpUseCase(repository: sl.call()));
  sl.registerLazySingleton<SignOutUseCase>(
      () => SignOutUseCase(repository: sl.call()));
  sl.registerLazySingleton<GetAllUsersUsecase>(
      () => GetAllUsersUsecase(repository: sl.call()));
  sl.registerLazySingleton<GetUpdateUserUseCase>(
      () => GetUpdateUserUseCase(repository: sl.call()));
  sl.registerLazySingleton<GetMessageUseCase>(
      () => GetMessageUseCase(repository: sl.call()));
  sl.registerLazySingleton<SendTextMessageUseCase>(
      () => SendTextMessageUseCase(repository: sl.call()));
  sl.registerLazySingleton<GetCreateGroupUseCase>(
      () => GetCreateGroupUseCase(repository: sl.call()));
  sl.registerLazySingleton<GetAllGroupsUseCase>(
      () => GetAllGroupsUseCase(repository: sl.call()));
  sl.registerLazySingleton<JoinGroupUseCase>(
      () => JoinGroupUseCase(repository: sl.call()));
  sl.registerLazySingleton<UpdateGroupUseCase>(
      () => UpdateGroupUseCase(repository: sl.call()));
  sl.registerLazySingleton<UpdateDataFirestoreUseCase>(
      () => UpdateDataFirestoreUseCase(repository: sl.call()));
  sl.registerLazySingleton<JoinChatMessageUseCase>(
      () => JoinChatMessageUseCase(repository: sl.call()));
  sl.registerLazySingleton<DeleteTextMessageUseCase>(
      () => DeleteTextMessageUseCase(repository: sl.call()));
  sl.registerLazySingleton<DeleteUserUseCase>(
      () => DeleteUserUseCase(repository: sl.call()));

  // Repository
  sl.registerLazySingleton<FirebaseRepository>(
      () => FirebaseRepositoryImpl(remoteDataSource: sl.call()));

  // Remote Datasource
  sl.registerLazySingleton<FirebaseRemoteDataSource>(
      () => FirebaseRemoteDataSourceImpl(sl.call(), sl.call(), sl.call()));

  // External
  final auth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;
  final GoogleSignIn googleSignIn = GoogleSignIn();

  sl.registerLazySingleton(() => auth);
  sl.registerLazySingleton(() => firestore);
  sl.registerLazySingleton(() => googleSignIn);
}
