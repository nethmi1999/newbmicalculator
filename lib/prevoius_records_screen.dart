import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:newbmi/models/bmi_model.dart';

class MyRecords extends StatelessWidget {
  const MyRecords({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: [
              const Image(
                  image:
                  AssetImage("assets/images/previous_records_image.jpg")),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  children: [
                    Text(
                      "Your Previous BMI Records",
                      style: TextStyle(
                        fontSize: 35,
                        fontWeight: FontWeight.w900,
                        color: Color(0xFF385a64),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: StreamBuilder<QuerySnapshot>(
                  stream: FirebaseFirestore.instance
                      .collection('bmi_data')
                  // .where('userId', isEqualTo: widget.currentUserUid)
                      .snapshots(),
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Center(
                        child: Text('Error: ${snapshot.error}'),
                      );
                    }

                    if (!snapshot.hasData) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }

                    final data = snapshot.data!.docs;

                    return Scrollbar(
                      isAlwaysShown: true,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          final doc = data[index];
                          final bmiData = BmiData.fromJson(
                              doc.data() as Map<String, dynamic>);
                          return Card(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                                side: const BorderSide(
                                    color: Colors.black,
                                    strokeAlign: 0,
                                    width: 1)),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.calendar_view_day_outlined),
                                      const SizedBox(width: 50),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.currency_bitcoin),
                                      const SizedBox(width: 50),
                                      Text(bmiData.bmi.toStringAsFixed(1)),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    children: [
                                      const Icon(
                                        Icons.monitor_heart,
                                        color: Colors.pinkAccent,
                                      ),
                                      const SizedBox(width: 50),
                                      Text(bmiData.bmiComment),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
