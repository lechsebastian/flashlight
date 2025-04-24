import 'package:flashlight/pages/cubit/flashlight_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class FlashLight extends StatelessWidget {
  const FlashLight({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => FlashlightCubit(),
      child: BlocBuilder<FlashlightCubit, FlashlightState>(
        builder: (context, state) {
          return Scaffold(
            body: AnimatedContainer(
              duration: const Duration(milliseconds: 500),
              color: state.isTurnedOn ? Colors.grey.shade900 : Colors.white,
              child: Center(
                child: IconButton(
                  onPressed: () {
                    context.read<FlashlightCubit>().toggleFlashlight(context);
                  },
                  icon: const Icon(
                    Icons.power_settings_new,
                    size: 120,
                  ),
                  color: state.isTurnedOn ? Colors.white : Colors.black,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
