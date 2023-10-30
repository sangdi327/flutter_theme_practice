import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:theme_practice/cubit/theme_cubit.dart';

import 'appfont.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Drawer(
        backgroundColor: Theme.of(context).drawerTheme.backgroundColor,
        width: MediaQuery.of(context).size.width * 0.8,
        child: Padding(
          padding: const EdgeInsets.all(25),
          child: BlocBuilder<ThemeCubit, ThemeState>(
            builder: (context, state) => Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Appfont(
                      state.themeMode == ThemeMode.light ? '라이트 모드' : '다크 모드',
                      size: 20,
                    ),
                    Switch(
                      value: state.themeMode == ThemeMode.light,
                      onChanged: (value) {
                        context.read<ThemeCubit>().updateMode(
                              value ? ThemeMode.light : ThemeMode.dark,
                              isSaveLocalData: true,
                            );
                      },
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
