import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:healthlink_desktop/features/login/view/screen/login_screen.dart';
import 'package:healthlink_desktop/features/navigation/view/screen/navigation_screen.dart';
import '../../../../core/models/models.dart';
import '../../../../core/utils/error_handler.dart';
import '../../view_model/signup_view_model.dart';

/// Full doctor registration form with all required fields.
///
/// Creates a Firebase account and then registers the doctor
/// profile via POST /api/doctors/register.
class SignupFormWidget extends ConsumerStatefulWidget {
  const SignupFormWidget({super.key});

  @override
  ConsumerState<SignupFormWidget> createState() => _SignupFormWidgetState();
}

class _SignupFormWidgetState extends ConsumerState<SignupFormWidget> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  final _cityController = TextEditingController();
  final _countryController = TextEditingController();
  final _hospitalController = TextEditingController();
  final _aboutController = TextEditingController();
  final _expYearsController = TextEditingController();
  bool _isLoading = false;
  String _selectedDepartment = 'General Medicine';
  String _selectedDuration = '30';
  String _selectedBuffer = '10';

  final List<String> _departments = [
    'General Medicine',
    'Cardiology',
    'Dermatology',
    'Neurology',
    'Orthopedics',
    'Pediatrics',
    'Psychiatry',
    'Ophthalmology',
    'ENT',
    'Gynecology',
    'Urology',
    'Oncology',
    'Radiology',
    'Dentistry',
  ];

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    _cityController.dispose();
    _countryController.dispose();
    _hospitalController.dispose();
    _aboutController.dispose();
    _expYearsController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          _buildField("FULL NAME", Icons.person_outline, "Dr. Smith", _nameController),
          const SizedBox(height: 20),
          _buildField("CORPORATE EMAIL", Icons.mail_outline, "dr.smith@healthlink.com", _emailController),
          const SizedBox(height: 20),

          // Password
          _buildField("PASSWORD", Icons.lock_outline, "••••••••", _passwordController, isPassword: true),
          const SizedBox(height: 20),
          _buildField("CONFIRM PASSWORD", Icons.lock_outline, "••••••••", _confirmPasswordController, isPassword: true),

          const SizedBox(height: 32),

          // Separator
          Row(
            children: [
              const Expanded(child: Divider(color: Color(0xFFE8ECEF))),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16),
                child: Text(
                  "PROFESSIONAL DETAILS",
                  style: TextStyle(
                    color: const Color(0XFF5a6362),
                    fontSize: 11,
                    fontWeight: FontWeight.w800,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
              const Expanded(child: Divider(color: Color(0xFFE8ECEF))),
            ],
          ),
          const SizedBox(height: 24),

          // City & Country
          Row(
            children: [
              Expanded(child: _buildField("CITY", Icons.location_city_outlined, "Cairo", _cityController)),
              const SizedBox(width: 16),
              Expanded(child: _buildField("COUNTRY", Icons.public_outlined, "Egypt", _countryController)),
            ],
          ),
          const SizedBox(height: 20),
          _buildField("HOSPITAL / CLINIC", Icons.local_hospital_outlined, "Cairo Medical Center", _hospitalController),
          const SizedBox(height: 20),

          // Department dropdown
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "DEPARTMENT",
                style: TextStyle(
                  color: Color(0XFF5a6362),
                  fontSize: 11,
                  fontWeight: FontWeight.w800,
                  letterSpacing: 1.2,
                ),
              ),
              const SizedBox(height: 8),
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F4F5),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton<String>(
                    value: _selectedDepartment,
                    isExpanded: true,
                    icon: const Icon(Icons.keyboard_arrow_down, color: Color(0XFF5a6362)),
                    dropdownColor: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                    style: const TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
                    onChanged: (val) {
                      if (val != null) setState(() => _selectedDepartment = val);
                    },
                    items: _departments.map((d) => DropdownMenuItem(value: d, child: Text(d))).toList(),
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),

          // Experience + Duration + Buffer
          Row(
            children: [
              Expanded(child: _buildField("EXP. YEARS", Icons.workspace_premium_outlined, "10", _expYearsController, isNumber: true)),
              const SizedBox(width: 12),
              Expanded(child: _buildDropdown("DURATION (min)", _selectedDuration, ['15', '20', '30', '45', '60'], (v) => setState(() => _selectedDuration = v!))),
              const SizedBox(width: 12),
              Expanded(child: _buildDropdown("BUFFER (min)", _selectedBuffer, ['0', '5', '10', '15', '30'], (v) => setState(() => _selectedBuffer = v!))),
            ],
          ),
          const SizedBox(height: 20),

          _buildField("ABOUT", Icons.info_outline, "Brief professional bio...", _aboutController, maxLines: 3),

          const SizedBox(height: 40),

          // Submit button
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: _isLoading ? null : _handleSignup,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF006D60),
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 20),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
                elevation: 0,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  if (_isLoading)
                    const SizedBox(
                      height: 20, width: 20,
                      child: CircularProgressIndicator(color: Colors.white, strokeWidth: 2),
                    )
                  else ...[
                    const Text('Create Account', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
                    const SizedBox(width: 8),
                    const Icon(Icons.arrow_forward, size: 18),
                  ],
                ],
              ),
            ),
          ),

          const SizedBox(height: 24),

          TextButton(
            onPressed: () {
              Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const LoginScreen()),
              );
            },
            style: TextButton.styleFrom(foregroundColor: const Color(0xFF006D60)),
            child: const Text(
              "Already have an account?",
              style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
            ),
          ),
        ],
      ),
    );
  }

  /// Handles the full signup flow: validate → Firebase → API.
  Future<void> _handleSignup() async {
    if (!_formKey.currentState!.validate()) return;

    if (_passwordController.text != _confirmPasswordController.text) {
      ErrorHandler.showWarning(context, 'Passwords do not match.');
      return;
    }

    setState(() => _isLoading = true);
    try {
      final registration = DoctorRegistration(
        name: _nameController.text.trim(),
        city: _cityController.text.trim(),
        country: _countryController.text.trim(),
        hospitalOrClinicName: _hospitalController.text.trim(),
        about: _aboutController.text.trim(),
        appointmentDuration: int.tryParse(_selectedDuration) ?? 30,
        bufferTime: int.tryParse(_selectedBuffer) ?? 10,
        department: {"name": _selectedDepartment},
        expYears: int.tryParse(_expYearsController.text.trim()) ?? 0,
      );

      await ref.read(signupViewModelProvider.notifier).signup(
        _emailController.text.trim(),
        _passwordController.text,
        registration,
      );
      if (mounted) {
        ErrorHandler.showSuccess(context, 'Account created successfully! Welcome aboard.');
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const NavigationScreen()),
        );
      }
    } catch (e) {
      if (mounted) ErrorHandler.showError(context, e);
    } finally {
      if (mounted) setState(() => _isLoading = false);
    }
  }

  /// Builds a standard text input field.
  Widget _buildField(String label, IconData icon, String hint, TextEditingController controller,
      {bool isPassword = false, bool isNumber = false, int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0XFF5a6362),
            fontSize: 11,
            fontWeight: FontWeight.w800,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          controller: controller,
          obscureText: isPassword,
          maxLines: maxLines,
          keyboardType: isNumber ? TextInputType.number : TextInputType.text,
          validator: (val) {
            if (val == null || val.trim().isEmpty) return 'This field is required';
            return null;
          },
          decoration: InputDecoration(
            prefixIcon: maxLines == 1 ? Icon(icon, color: const Color(0XFFa5b0b5), size: 20) : null,
            hintText: hint,
            hintStyle: TextStyle(
              color: const Color(0XFFa5b0b5),
              letterSpacing: isPassword ? 4 : 0,
            ),
            filled: true,
            fillColor: const Color(0xFFF1F4F5),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          ),
          style: const TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
        ),
      ],
    );
  }

  /// Builds a compact dropdown field.
  Widget _buildDropdown(String label, String value, List<String> options, ValueChanged<String?> onChanged) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0XFF5a6362),
            fontSize: 11,
            fontWeight: FontWeight.w800,
            letterSpacing: 1.2,
          ),
        ),
        const SizedBox(height: 8),
        Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 4),
          decoration: BoxDecoration(
            color: const Color(0xFFF1F4F5),
            borderRadius: BorderRadius.circular(8),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: value,
              isExpanded: true,
              icon: const Icon(Icons.keyboard_arrow_down, color: Color(0XFF5a6362), size: 18),
              dropdownColor: Colors.white,
              borderRadius: BorderRadius.circular(8),
              style: const TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.w500),
              onChanged: onChanged,
              items: options.map((o) => DropdownMenuItem(value: o, child: Text(o))).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
