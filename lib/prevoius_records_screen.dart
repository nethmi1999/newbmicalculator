import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:newbmi/dashboard.dart';
import 'package:newbmi/models/bmi_model.dart';
import 'package:intl/intl.dart';

class MyRecords extends StatelessWidget {

  const MyRecords({super.key});

  @override
  Widget build(BuildContext context) {
    ScrollController scrollController = ScrollController();

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                      onPressed: ()=>Get.to(()=>const HomePage()),
                      icon: const Icon(Icons.arrow_back_ios_sharp)),
                ],
              ),
              const Image(
                  image: AssetImage("assets/images/records.jpg"),
                width: 250,
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20.0),
                child: Row(
                  children: [
                    Text(
                      "My Records",
                      style: TextStyle(
                        fontSize: 50,
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
                      controller: scrollController,
                      thumbVisibility: true,
                      child: ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        itemCount: data.length,
                        itemBuilder: (context, index) {
                          final doc = data[index];
                          final bmiData = BmiData.fromJson(
                              doc.data() as Map<String, dynamic>);

                          final formattedTimestamp = bmiData.timestamp != null
                              ? DateFormat.yMMMd()
                              .format(bmiData.timestamp!.toDate())
                              : 'Unknown';

                          return Card(
                            color: Colors.purple.withOpacity(0.4),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15),
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.calendar_month),
                                      const SizedBox(width: 50),
                                      Text(formattedTimestamp),
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
