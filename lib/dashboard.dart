import 'package:get/get.dart';
import 'package:newbmi/functions/functions.dart';
import 'package:newbmi/kStyles.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newbmi/models/bmi_model.dart';
import 'package:newbmi/prevoius_records_screen.dart';



class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

String? dateTime1 = 'Select a Date';

class _HomePageState extends State<HomePage> {


  final appFunctions = Functions();

  String myAge = "";
  String name = "";
  String address = "";
  int height = 160;
  int weight = 65;
  late double bmi = calculateBmi(height: height, weight: weight);
  late double bmiValue;
  String? gender = "";

  TextEditingController nameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController ageController = TextEditingController();
  TextEditingController bmiController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 85, 3, 133),
        title: const Text(
          "BMI CALCULATOR",
          style: TextStyle(
              letterSpacing: 3, fontWeight: FontWeight.bold, fontSize: 25),
        ),
        centerTitle: true,
      ),
      body: Container(
        padding: const EdgeInsets.all(10.0),
        color: const Color.fromARGB(255, 243, 135, 243),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Text(
                      "Enter Your Details",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Card(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 0.0),
                        child: Row(
                          children: [
                            Text("Name"),
                          ],
                        ),
                      ),
                      TextField(
                        //scrollController:FixedExtentScrollController.,
                        controller: nameController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: '',
                          contentPadding: EdgeInsets.all(5.0),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 0.0),
                        child: Row(
                          children: [
                            Text("Address"),
                          ],
                        ),
                      ),
                      TextField(
                        //scrollController:FixedExtentScrollController.,
                        controller: addressController,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: '',
                          contentPadding: EdgeInsets.all(5.0),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 0.0),
                        child: Row(
                          children: [
                            Text("Date Of Birth"),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(0.0),
                        child: TextField(
                          onTap: _showDatePicker,
                          decoration: InputDecoration(
                            border: const OutlineInputBorder(),
                            hintText: (dateTime1),
                            contentPadding: const EdgeInsets.all(5.0),
                          ),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 5.0, horizontal: 0.0),
                        child: Row(
                          children: [
                            Text("Gender"),
                          ],
                        ),
                      ),
                      Row(
                        children: [
                          const Text("Male"),
                          Radio(
                              value: "Male",
                              groupValue: gender,
                              onChanged: (value) {
                                setState(() {
                                  gender = value!;
                                }); //selected value
                              }),
                          const Text("Female"),
                          Radio(
                              value: "Female",
                              groupValue: gender,
                              onChanged: (value) {
                                setState(() {
                                  gender = value!;
                                }); //selected value
                              })
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              Row(
                children: [
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 17.0),
                      child: Column(
                        children: [
                          const Text(
                            "Weight (KG)",
                            style: kHeightAndWeightTextStyles,
                          ),
                          Text(
                            "$weight",
                            style: const TextStyle(
                              fontSize: 30,
                            ),
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  FloatingActionButton(
                                    child: const Icon(
                                      Icons.add_circle_outline,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        if (weight < 300) {
                                          weight++;
                                          bmi = calculateBmi(
                                              height: height, weight: weight);
                                        }
                                      });
                                    },
                                    shape: BeveledRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    backgroundColor:
                                        const Color.fromARGB(255, 180, 25, 241),
                                  )
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  FloatingActionButton(
                                    child: const Icon(
                                      Icons.remove_circle_outline,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        if (weight > 5) {
                                          weight--;
                                          bmi = calculateBmi(
                                              height: height, weight: weight);
                                        }
                                      });
                                    },
                                    shape: BeveledRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    backgroundColor:
                                        const Color.fromARGB(255, 248, 3, 248),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(),
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10.0, horizontal: 17.0),
                      child: Column(
                        children: [
                          const Text(
                            "Height (CM)",
                            style: kHeightAndWeightTextStyles,
                          ),
                          Text(
                            "$height",
                            style: const TextStyle(
                              fontSize: 30,
                            ),
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  FloatingActionButton(
                                    child: const Icon(
                                      Icons.add_circle_outline,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        if (height < 250) {
                                          height++;
                                          bmi = calculateBmi(
                                              height: height, weight: weight);
                                        }
                                      });
                                    },
                                    shape: BeveledRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    backgroundColor:
                                        const Color.fromARGB(255, 180, 25, 241),
                                  ),
                                ],
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              Column(
                                children: [
                                  FloatingActionButton(
                                    child: const Icon(
                                      Icons.remove_circle_outline,
                                    ),
                                    onPressed: () {
                                      setState(() {
                                        if (height > 100) {
                                          height--;
                                          bmi = calculateBmi(
                                              height: height, weight: weight);
                                        }
                                      });
                                    },
                                    shape: BeveledRectangleBorder(
                                      borderRadius: BorderRadius.circular(15.0),
                                    ),
                                    backgroundColor:
                                        const Color.fromARGB(255, 248, 3, 248),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    child: ElevatedButton(
                      child: const Text(
                        "Submit",
                        style: kButtonTextStyle,
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromARGB(255, 85, 3, 133),
                        elevation: 0,
                      ),
                      onPressed: () {
                        printData();
                        setState(() {
                          name = nameController.text;
                          address = addressController.text;
                          myAge;
                          bmi = calculateBmi(height: height, weight: weight);
                        });
                      },
                    ),
                  ),
                ],
              ),
              Card(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Column(
                      children: [
                        const Icon(Icons.add_reaction_outlined),
                        const Text(
                          "Name",
                          style: kUserDetailsStyles,
                        ),
                        Text(name),
                        const Icon(Icons.place_outlined),
                        const Text(
                          "ADDRESS",
                          style: kUserDetailsStyles,
                        ),
                        Text(address),
                        const Icon(Icons.airline_stops_sharp),
                        const Text(
                          "AGE",
                          style: kUserDetailsStyles,
                        ),
                        Text(myAge),
                        const Row(
                          children: [
                            Icon(Icons.man),
                            Icon(Icons.woman),
                          ],
                        ),
                        const Text(
                          "GENDER",
                          style: kUserDetailsStyles,
                        ),
                        Text(
                          '$gender',
                        ),
                        const Icon(Icons.account_circle_outlined),
                        const Text(
                          "BMI",
                          style: kUserDetailsStyles,
                        ),
                        Text(bmi.toStringAsFixed(2), style: kBmiValueStyles),
                        Text(
                          bmiResult(bmi),
                          style: const TextStyle(
                            color: Colors.red,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: clear,
                      child: const Text("Clear Text"),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: (){
                        final bmiData = BmiData(
                            name: name,
                            address: address,
                            age: myAge,
                            bmi: bmi,
                            bmiComment: bmiResult(bmi));
                        appFunctions.addBmiData(bmiData);
                      },
                      child: const Text("Save Data"),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20,),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: ()=>Get.to(()=>MyRecords()),
                      child: const Text("My Previous Records"),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showDatePicker() {
    showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(1900),
      lastDate: DateTime.now(),
    ).then((value) {
      if (value != null) {
        calculateAge(value);
      }

      dateTime1 = DateFormat('yyyy-MM-dd').format(value!);
    });
  }

  double calculateBmi({required int height, required int weight}) {
    return (weight / (height * height)) * 10000;
  }

  static String bmiResult(bmiValue) {
    if (bmiValue >= 25) {
      return "Over Weight";
    } else if (bmiValue > 18.5) {
      return "Normal";
    } else {
      return "Under Weight";
    }
  }

  void calculateAge(DateTime? value) {
    DateTime now = DateTime.now();
    Duration age = now.difference(value!);
    int years = age.inDays ~/ 365;
    int months = (age.inDays % 365) ~/ 30;
    int days = ((age.inDays % 365) % 30);
    myAge = '$years years';
  }

  void clear() {
    nameController.clear();
    addressController.clear();
  }

  void printData() {
    print(name);
    print(address);
    print(myAge);
    print(bmi);
    print(bmiResult(bmi));

  }
}
