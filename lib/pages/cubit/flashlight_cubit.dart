import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
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
    } catch (message) {
      scaffoldMessenger.showSnackBar(
        SnackBar(content: Text('Error has been occured: $message')),
      );
    }
  }
}
