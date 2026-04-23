import 'package:flutter/material.dart';
import '../../../../core/app_bar_widget.dart';
import '../widget/settings_header_widget.dart';
import '../widget/profile_settings_widget.dart';

class SettingsScreen extends StatelessWidget {
  const SettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFFf7f9fb),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final paddingValue = constraints.maxWidth < 800 ? 16.0 : 40.0;
          final headerSpacing = constraints.maxWidth < 800 ? 24.0 : 45.0;
          final bodySpacing = constraints.maxWidth < 800 ? 16.0 : 31.0;

          return SingleChildScrollView(
            child: Center(
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1440),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const AppBarWidget(),
                    SizedBox(height: headerSpacing),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: paddingValue),
                      child: const SettingsHeaderWidget(),
                    ),
                    SizedBox(height: bodySpacing),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: paddingValue),
                      child: const ProfileSettingsWidget(),
                    ),
                    const SizedBox(height: 24),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: paddingValue),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              foregroundColor: const Color(0xFF006D60),
                              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                            ),
                            child: const Text('Cancel', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
                          ),
                          const SizedBox(width: 16),
                          ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.save_outlined, size: 20),
                            label: const Text('Save Changes', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF006D60),
                              foregroundColor: Colors.white,
                              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                              elevation: 0,
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 40),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
