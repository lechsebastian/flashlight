import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meta/meta.dart';
import 'package:torch_light/torch_light.dart';

part 'flashlight_state.dart';

class FlashlightCubit extends Cubit<FlashlightState> {
  FlashlightCubit() : super(const FlashlightState(isTurnedOn: false));

  Future<void> toggleFlashlight(BuildContext context) async {
    final scaffoldMessenger = ScaffoldMessenger.of(context);
    try {
      if (state.isTurnedOn) {
        await TorchLight.disableTorch();
      } else {
        await TorchLight.enableTorch();
      }
      emit(FlashlightState(isTurnedOn: !state.isTurnedOn));
    } on PlatformException catch (e, stackTrace) {
      log('Platform exception: ${e.message}', error: e, stackTrace: stackTrace);
      scaffoldMessenger.showSnackBar(
        SnackBar(
          content: Text(
            'Nie udało się przełączyć latarki: ${e.message}',
          ),
        ),
      );
    } catch (e, stackTrace) {
      log('Unknown exception: $e', error: e, stackTrace: stackTrace);
      scaffoldMessenger.showSnackBar(
        const SnackBar(
          content: Text(
            'Wystąpił nieoczekiwany błąd',
          ),
        ),
      );
    }
  }
}
