import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:keyboard_dismisser/keyboard_dismisser.dart';

import 'package:samrental/features/cars/presentation/bloc/single_car_bloc.dart';
import 'package:samrental/features/home/presentation/bloc/home/home_bloc.dart';

import '../widgets/reserve_sub_page.dart';

class ReservePage extends StatelessWidget {
  final String id;
  const ReservePage({required this.id, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KeyboardDismisser(
      child: BlocProvider(
        create: (context) => SingleCarBloc(),
        child: Builder(builder: (context) {
          return Scaffold(
            
            body: BlocBuilder<SingleCarBloc, SingleCarState>(
              builder: (context, state) {
                if (state.status == LoadingStatus.pure) {
                  context
                      .read<SingleCarBloc>()
                      .add(SingleCarStarted(id: id, onFailure: print));
                  return const SizedBox();
                } else if (state.status == LoadingStatus.loading) {
                  return const Center(child: CupertinoActivityIndicator());
                } else if (state.status == LoadingStatus.loadedWithSuccess) {
                  return const ReserveSubPage();
                } else {
                  return const SizedBox();
                }
              },
            ),
          );
        }),
      ),
    );
  }
}
