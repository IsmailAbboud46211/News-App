import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'internet_state.dart';

class InternetCubit extends Cubit<InternetState> {
  StreamSubscription? _streamSubscription;
  InternetCubit() : super(InternetInitial());

  void connected() => emit(InternetConnected());
  void disconnected() => emit(InternetDisconnected());
  void checkConnection() {
    _streamSubscription = Connectivity().onConnectivityChanged.listen((result) {
      if (result[0] == ConnectivityResult.none) {
        disconnected();
      } else {
        connected();
      }
    });
  }

  @override
  Future<void> close() {
    _streamSubscription!.cancel();
    return super.close();
  }
}
