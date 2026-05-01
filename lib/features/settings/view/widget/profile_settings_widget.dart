import 'dart:convert';
import 'dart:io';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../../../dashboard/view_model/dashboard_view_model.dart';
import '../../../../core/models/models.dart';
import '../../../../core/repositories/doctor_repository.dart';
import '../../../../core/utils/error_handler.dart';

/// Profile settings widget with real API data and image upload.
class ProfileSettingsWidget extends ConsumerStatefulWidget {
  const ProfileSettingsWidget({super.key});

  @override
  ConsumerState<ProfileSettingsWidget> createState() => _ProfileSettingsWidgetState();
}

class _ProfileSettingsWidgetState extends ConsumerState<ProfileSettingsWidget> {
  final _nameController = TextEditingController();
  final _cityController = TextEditingController();
  final _aboutController = TextEditingController();
  String? _profileImage;
  bool _initialized = false;
  bool _isSaving = false;

  @override
  void dispose() {
    _nameController.dispose();
    _cityController.dispose();
    _aboutController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;
    final dashState = ref.watch(dashboardViewModelProvider);

    // Initialize fields from API data once
    dashState.whenData((data) {
      if (!_initialized) {
        _initialized = true;
        _nameController.text = data.profile.name ?? '';
        _cityController.text = data.profile.city ?? '';
        _aboutController.text = data.profile.about ?? '';
        _profileImage = data.profile.image;
      }
    });

    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(32),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Avatar Section
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  CircleAvatar(
                    radius: 50,
                    backgroundColor: const Color(0xFFF4F6F8),
                    backgroundImage: _profileImage != null && _profileImage!.isNotEmpty
                        ? NetworkImage(_profileImage!)
                        : const AssetImage('assets/360_F_396167959_aAhZiGlJoeXOBHivMvaO0Aloxvhg3eVT.jpg') as ImageProvider,
                  ),
                  Positioned(
                    bottom: 0, right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0xFFE8ECEF), width: 1),
                      ),
                      child: const Icon(Icons.edit, size: 16, color: Color(0xFF006D60)),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 24),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text("Clinical Avatar", style: TextStyle(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 8),
                    const Text(
                      "This image will be visible on patient portals and internal scheduling\ntools. JPG or PNG, max 5MB.",
                      style: TextStyle(color: Color(0XFF5a6362), fontSize: 14, fontWeight: FontWeight.w500),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: _handleImageUpload,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xFFE8ECEF),
                            foregroundColor: const Color(0xFF0d4c6d),
                            elevation: 0,
                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                          ),
                          child: const Text('Upload New', style: TextStyle(fontWeight: FontWeight.w600)),
                        ),
                        const SizedBox(width: 16),
                        TextButton(
                          onPressed: () {
                            setState(() => _profileImage = null);
                          },
                          style: TextButton.styleFrom(
                            foregroundColor: const Color(0xFFD32F2F),
                            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                          ),
                          child: const Text('Remove', style: TextStyle(fontWeight: FontWeight.w600)),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
          
          const SizedBox(height: 48),
          
          const Text("PROFESSIONAL DETAILS", style: TextStyle(color: Color(0XFF5a6362), fontSize: 12, fontWeight: FontWeight.w800, letterSpacing: 1.5)),
          const SizedBox(height: 24),
          
          if (isDesktop)
            Row(
              children: [
                Expanded(child: _buildTextField("Full Name", _nameController)),
                const SizedBox(width: 24),
                Expanded(child: _buildTextField("City", _cityController, icon: Icons.location_on_outlined)),
              ],
            )
          else
            Column(
              children: [
                _buildTextField("Full Name", _nameController),
                const SizedBox(height: 24),
                _buildTextField("City", _cityController, icon: Icons.location_on_outlined),
              ],
            ),
            
          const SizedBox(height: 24),
          
          _buildTextField("About Me (Patient Facing)", _aboutController, maxLines: 4),

          const SizedBox(height: 32),

          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {
                  _initialized = false;
                  ref.invalidate(dashboardViewModelProvider);
                  ErrorHandler.showSuccess(context, 'Changes discarded.');
                },
                style: TextButton.styleFrom(
                  backgroundColor: const Color(0XFFe8ecef),
                  padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: const Text("Cancel", style: TextStyle(color: Color(0xFF0d4c6d), fontWeight: FontWeight.w700)),
              ),
              const SizedBox(width: 16),
              ElevatedButton.icon(
                onPressed: _isSaving ? null : _handleSave,
                icon: _isSaving
                    ? const SizedBox(width: 18, height: 18, child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2))
                    : const Icon(Icons.save_outlined, size: 18),
                label: Text(_isSaving ? 'Saving...' : 'Save Changes', style: const TextStyle(fontWeight: FontWeight.w700)),
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
        ],
      ),
    );
  }

  Widget _buildTextField(String label, TextEditingController controller, {IconData? icon, int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(label, style: const TextStyle(color: Color(0XFF5a6362), fontSize: 14, fontWeight: FontWeight.w600)),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          maxLines: maxLines,
          decoration: InputDecoration(
            prefixIcon: icon != null ? Icon(icon, color: const Color(0XFF5a6362), size: 20) : null,
            filled: true,
            fillColor: const Color(0xFFF4F6F8),
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide.none),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          ),
          style: const TextStyle(color: Colors.black, fontSize: 15, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  Future<void> _handleImageUpload() async {
    try {
      final result = await FilePicker.platform.pickFiles(
        type: FileType.image,
        allowMultiple: false,
      );
      if (result != null && result.files.single.path != null) {
        final file = File(result.files.single.path!);
        final bytes = await file.readAsBytes();
        final base64Image = base64Encode(bytes);
        
        final repo = ref.read(doctorRepositoryProvider);
        await repo.uploadProfileImage(base64Image);
        
        _initialized = false;
        ref.invalidate(dashboardViewModelProvider);
        
        if (mounted) ErrorHandler.showSuccess(context, 'Profile image updated.');
      }
    } catch (e) {
      if (mounted) ErrorHandler.showError(context, e);
    }
  }

  Future<void> _handleSave() async {
    setState(() => _isSaving = true);
    try {
      final profile = DoctorProfile(
        name: _nameController.text.trim(),
        city: _cityController.text.trim(),
        about: _aboutController.text.trim(),
      );
      await ref.read(dashboardViewModelProvider.notifier).updateProfile(profile);
      if (mounted) ErrorHandler.showSuccess(context, 'Profile saved successfully.');
    } catch (e) {
      if (mounted) ErrorHandler.showError(context, e);
    } finally {
      if (mounted) setState(() => _isSaving = false);
    }
  }
}
