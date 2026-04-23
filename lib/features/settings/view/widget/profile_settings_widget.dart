import 'package:flutter/material.dart';

class ProfileSettingsWidget extends StatelessWidget {
  const ProfileSettingsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final isDesktop = MediaQuery.of(context).size.width > 800;

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
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: Color(0xFFF4F6F8),
                    backgroundImage: NetworkImage('https://randomuser.me/api/portraits/women/44.jpg'),
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(6),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                        border: Border.all(color: const Color(0xFFE8ECEF), width: 1),
                      ),
                      child: const Icon(
                        Icons.edit,
                        size: 16,
                        color: Color(0xFF006D60),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 24),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      "Clinical Avatar",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    const Text(
                      "This image will be visible on patient portals and internal scheduling\ntools. JPG or PNG, max 5MB.",
                      style: TextStyle(
                        color: Color(0XFF5a6362),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      children: [
                        ElevatedButton(
                          onPressed: () {},
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
                          onPressed: () {},
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
          
          const Text(
            "PROFESSIONAL DETAILS",
            style: TextStyle(
              color: Color(0XFF5a6362),
              fontSize: 12,
              fontWeight: FontWeight.w800,
              letterSpacing: 1.5,
            ),
          ),
          
          const SizedBox(height: 24),
          
          if (isDesktop)
            Row(
              children: [
                Expanded(child: _buildTextField("Full Name", "Dr. Julianne Smith")),
                const SizedBox(width: 24),
                Expanded(child: _buildTextField("Specialization", "Cardiology & Internal Medicine")),
              ],
            )
          else
            Column(
              children: [
                _buildTextField("Full Name", "Dr. Julianne Smith"),
                const SizedBox(height: 24),
                _buildTextField("Specialization", "Cardiology & Internal Medicine"),
              ],
            ),
            
          const SizedBox(height: 24),
          
          _buildTextField("Primary Clinic Location (City)", "San Francisco, CA", icon: Icons.location_on_outlined),
          
          const SizedBox(height: 24),
          
          _buildTextField(
            "About Me (Patient Facing)", 
            "Board-certified cardiologist with over 15 years of experience specializing in preventative cardiovascular medicine and non-invasive diagnostic imaging. Committed to holistic patient care and evidence-based treatment plans tailored to individual lifestyle needs.",
            maxLines: 4,
          ),
        ],
      ),
    );
  }

  Widget _buildTextField(String label, String initialValue, {IconData? icon, int maxLines = 1}) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: const TextStyle(
            color: Color(0XFF5a6362),
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 8),
        TextFormField(
          initialValue: initialValue,
          maxLines: maxLines,
          decoration: InputDecoration(
            prefixIcon: icon != null ? Icon(icon, color: const Color(0XFF5a6362), size: 20) : null,
            filled: true,
            fillColor: const Color(0xFFF4F6F8),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(8),
              borderSide: BorderSide.none,
            ),
            contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
          ),
          style: const TextStyle(
            color: Colors.black,
            fontSize: 15,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
