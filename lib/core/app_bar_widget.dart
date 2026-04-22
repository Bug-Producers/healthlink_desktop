import 'package:flutter/material.dart';
class AppBarWidget extends StatelessWidget {
  const AppBarWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 76,
      child: Padding(
        padding: EdgeInsets.fromLTRB(0, 0, 40, 0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            IconButton(
              onPressed: () {
                //TODO
              },
              icon: const Icon(Icons.notifications_none),
            ),
            SizedBox(width: 20),

            Container(
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(50),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),

              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  onTap: () {
                    //TODO
                  },
                  borderRadius: BorderRadius.circular(50),
                  child: SizedBox(
                    width: 208,
                    height: 44,
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const CircleAvatar(
                          radius: 26,

                          backgroundImage: AssetImage(
                            'assets/360_F_396167959_aAhZiGlJoeXOBHivMvaO0Aloxvhg3eVT.jpg',
                          ),
                        ),
                        const SizedBox(width: 12),
                        const Text(
                          'Dr. Julianne Smith',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                            color: Color(0xFF1F2937),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}