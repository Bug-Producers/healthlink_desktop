import 'package:flutter/material.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFf7f9fb),
      body: Column(
        children: [
          SizedBox(
            width: 992,
            height: 76,
            child: Row(
              children: [
                IconButton(
                    onPressed: (){
                      //TODO
                    }, icon: Icon(Icons.notifications_none)
                ),
                InkWell(
                  // TODO
                )


              ],
            ),
          ),
        ],
      ),
    );
  }
}
