import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:samrental/features/home/domain/entites/car.dart';

part 'filter_event.dart';

part 'filter_state.dart';

class FilterBloc extends Bloc<FilterEvent, FilterState> {
  FilterBloc()
      : super(const FilterState(
          status: FilterLoadingStatus.pure,
          cars: [],
          allTypeCars: true,
        )) {
    on<SelectCarTypesEvent>(
      (event, emit) {
        switch (event.type) {
          case CarsType.allCars:
            state.allTypeCars
                ? emit(state.copyWith(
                    allTypeCars: false,
                    standardType: false,
                    comfortType: false,
                    businessType: false,
                  ))
                : emit(state.copyWith(
                    allTypeCars: true,
                    standardType: true,
                    comfortType: true,
                    businessType: true,
                  ));
          case CarsType.standardType:
            state.standardType ?? false
                ? emit(state.copyWith(
                    standardType: !(state.standardType ?? false),
                    allTypeCars: (state.comfortType ?? false) ||
                            (state.businessType ?? false)
                        ? false
                        : true,
                  ))
                : emit(state.copyWith(
                    standardType: !(state.standardType ?? false),
                    allTypeCars: (state.comfortType ?? false) &&
                            (state.businessType ?? false)
                        ? true
                        : false,
                  ));
          case CarsType.comfortType:
            state.comfortType ?? false
                ? emit(state.copyWith(
                    comfortType: !(state.comfortType ?? false),
                    allTypeCars: (state.standardType ?? false) ||
                            (state.businessType ?? false)
                        ? false
                        : true,
                  ))
                : emit(state.copyWith(
                    comfortType: !(state.comfortType ?? false),
                    allTypeCars: (state.standardType ?? false) &&
                            (state.businessType ?? false)
                        ? true
                        : false,
                  ));
          case CarsType.businessType:
            state.businessType ?? false
                ? emit(state.copyWith(
                    businessType: !(state.businessType ?? false),
                    allTypeCars: (state.standardType ?? false) ||
                            (state.comfortType ?? false)
                        ? false
                        : true,
                  ))
                : emit(state.copyWith(
                    businessType: !(state.businessType ?? false),
                    allTypeCars: (state.comfortType ?? false) &&
                            (state.standardType ?? false)
                        ? true
                        : false,
                  ));
        }
      },
    );

    on<FilterButtonPressedEvent>((event, emit) async {
      emit(state.copyWith(status: FilterLoadingStatus.pure));
      if (state.allTypeCars) {
        emit(state.copyWith(
          cars: event.cars,
          status: FilterLoadingStatus.loadedWithSuccess,
        ));
      } else {
        List<CarEntity> list = [];
        for (int i = 0; i < event.cars.length; i++) {
          if (event.cars[i].type == 'standart' &&
              (state.standardType ?? false)) {
            list.add(event.cars[i]);
          }
          if (event.cars[i].type == 'comfort' && (state.comfortType ?? false)) {
            list.add(event.cars[i]);
          }
          if (event.cars[i].type == 'business' &&
              (state.businessType ?? false)) {
            list.add(event.cars[i]);
          }
        }

        emit(state.copyWith(
          cars: list,
          status: FilterLoadingStatus.loadedWithSuccess,
        ));
      }
    });
  }
}
