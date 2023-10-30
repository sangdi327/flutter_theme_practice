import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:hydrated_bloc/hydrated_bloc.dart';

class ThemeCubit extends HydratedCubit<ThemeState> {
  ThemeCubit() : super(const ThemeState());

  void updateMode(ThemeMode mode, {bool isSaveLocalData = false}) {
    emit(state.copyWith(
      isDarkMode: mode == ThemeMode.dark,
      isSaveLocalData: isSaveLocalData,
    ));
  }

  @override
  ThemeState? fromJson(Map<String, dynamic> json) {
    return ThemeState.fromJson(json);
  }

  @override
  Map<String, dynamic>? toJson(ThemeState state) {
    return state.toJson();
  }
}

class ThemeState extends Equatable {
  final bool? isDarkMode;
  final bool isSaveLocalData;

  const ThemeState({
    this.isDarkMode,
    this.isSaveLocalData = false,
  });

  ThemeState copyWith({
    bool? isDarkMode,
    bool? isSaveLocalData,
  }) {
    return ThemeState(
      isDarkMode: isDarkMode ?? this.isDarkMode,
      isSaveLocalData: isSaveLocalData ?? this.isSaveLocalData,
    );
  }

  factory ThemeState.fromJson(Map<String, dynamic> json) => ThemeState(
        isDarkMode: json['isDarkMode'] as bool?,
        isSaveLocalData: json['isSaveLocalData'] as bool,
      );

  Map<String, dynamic> toJson() => {
        'isDarkMode': isDarkMode,
        'isSaveLocalData': isSaveLocalData,
      };

  ThemeMode get themeMode {
    return isDarkMode == null
        ? ThemeMode.light
        : isDarkMode!
            ? ThemeMode.dark
            : ThemeMode.light;
  }

  @override
  List<Object?> get props => [isDarkMode];
}
