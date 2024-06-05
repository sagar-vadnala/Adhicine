import 'package:adhicine/widgets/my_button.dart';
import 'package:adhicine/widgets/my_textfield.dart';
import 'package:adhicine/widgets/selectable_circleavatar.dart';
import 'package:adhicine/widgets/selectable_container.dart';
import 'package:flutter/material.dart';

class AdddMedicine extends StatefulWidget {
  const AdddMedicine({
    super.key,
  });

  @override
  State<AdddMedicine> createState() => _AdddMedicineState();
}

class _AdddMedicineState extends State<AdddMedicine> {
  int totalCount = 1;
  String frequency = 'Everyday';
  String timesPerDay = 'Three Times';
  String dose1 = '';
  String dose2 = '';
  String dose3 = '';
  String timing = 'Before Food';
  DateTime startDate = DateTime.now();
  DateTime? endDate;
  int selectedIndex = -1;
  int selectedIndexCircle = -1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Add Medicine",
          style: TextStyle(
              fontSize: 18, fontWeight: FontWeight.w700, color: Colors.black),
        ),
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: const Icon(Icons.chevron_left, color: Colors.black),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 40,
                child: MyTextField(
                  labelText: "Search Medicine Name",
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Compartment",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (int i = 0; i < 7; i++)
                    SelectableContainer(
                      isSelected: selectedIndex == i,
                      text: "${i + 1}",
                      onTap: () {
                        setState(() {
                          selectedIndex = i;
                        });
                      },
                    ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Color",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  for (int i = 0; i < 7; i++)
                    SelectableCircle(
                        isCircleSelected: selectedIndexCircle == i,
                        onTap: () {
                          setState(() {
                            selectedIndexCircle = i;
                          });
                        },
                        color: Colors.blue)
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Type",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    height: 100,
                    width: 100,
                    // color: Colors.blue,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.transparent,
                            offset: Offset(
                              1.0,
                              1.0,
                            ),
                            blurRadius: 0.0,
                            spreadRadius: 0.0,
                          )
                        ]),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.medication_liquid),
                        Text("Tablet"),
                      ],
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    // color: Colors.blue,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.transparent,
                            offset: Offset(
                              1.0,
                              1.0,
                            ),
                            blurRadius: 0.0,
                            spreadRadius: 0.0,
                          )
                        ]),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.medical_information_sharp),
                        Text("Capsule"),
                      ],
                    ),
                  ),
                  Container(
                    height: 100,
                    width: 100,
                    // color: Colors.blue,
                    decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(12),
                        boxShadow: const [
                          BoxShadow(
                            color: Colors.transparent,
                            offset: Offset(
                              1.0,
                              1.0,
                            ),
                            blurRadius: 0.0,
                            spreadRadius: 0.0,
                          )
                        ]),
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.medication_liquid),
                        Text("Cream"),
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                "Quantity",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              const SizedBox(
                height: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Container(
                        height: 30,
                        width: MediaQuery.of(context).size.width * 0.5,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.grey),
                            borderRadius: BorderRadius.circular(6)),
                        child: const Center(child: Text("Take 1/2 pill")),
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      IconButton(
                        icon: const Icon(Icons.remove),
                        onPressed: () {
                          setState(() {
                            if (totalCount > 1) totalCount--;
                          });
                        },
                      ),
                      const SizedBox(
                        width: 5,
                      ),
                      Text(totalCount.toString().padLeft(2, '0')),
                      const SizedBox(
                        height: 5,
                      ),
                      IconButton(
                        icon: const Icon(Icons.add),
                        onPressed: () {
                          setState(() {
                            if (totalCount < 100) totalCount++;
                          });
                        },
                      ),
                    ],
                  ),
                  Slider(
                    value: totalCount.toDouble(),
                    min: 1,
                    max: 100,
                    divisions: 100,
                    label: totalCount.toString(),
                    onChanged: (value) {
                      setState(() {
                        totalCount = value.toInt();
                      });
                    },
                  ),
                  const Text(
                    "Set Date",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Container(
                        height: 30,
                        width: 165,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: InkWell(
                          onTap: () async {
                            DateTime? picked = await showDatePicker(
                              context: context,
                              initialDate: startDate,
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2101),
                            );
                            if (picked != null && picked != startDate) {
                              setState(() {
                                startDate = picked;
                              });
                            }
                          },
                          child: Center(
                            child: Text(
                              startDate == null
                                  ? 'Today'
                                  : startDate.toString().split(' ')[0],
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                      Container(
                        height: 30,
                        width: 165,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(8),
                          border: Border.all(color: Colors.grey),
                        ),
                        child: InkWell(
                          onTap: () async {
                            DateTime? picked = await showDatePicker(
                              context: context,
                              initialDate: endDate ?? DateTime.now(),
                              firstDate: DateTime(2000),
                              lastDate: DateTime(2101),
                            );
                            if (picked != null && picked != endDate) {
                              setState(() {
                                endDate = picked;
                              });
                            }
                          },
                          child: Center(
                            child: Text(
                              endDate == null
                                  ? 'End Date'
                                  : endDate.toString().split(' ')[0],
                              style: const TextStyle(color: Colors.black),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "Frequency of Days",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: frequency,
                          onChanged: (String? newValue) {
                            setState(() {
                              frequency = newValue!;
                            });
                          },
                          items: <String>[
                            'Everyday',
                            'Every Other Day',
                            'Weekly'
                          ].map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Text(
                    "How many times a day",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Container(
                    height: 30,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(color: Colors.grey)),
                    child: Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: DropdownButtonHideUnderline(
                        child: DropdownButton<String>(
                          isExpanded: true,
                          value: timesPerDay,
                          onChanged: (String? newValue) {
                            setState(() {
                              timesPerDay = newValue!;
                            });
                          },
                          items: <String>['Once', 'Twice', 'Three Times']
                              .map<DropdownMenuItem<String>>((String value) {
                            return DropdownMenuItem<String>(
                              value: value,
                              child: Text(value),
                            );
                          }).toList(),
                        ),
                      ),
                    ),
                  ),
                  ExpansionTile(
                    title: const Row(
                      children: [
                        Icon(Icons.schedule),
                        Text('Dose 1'),
                      ],
                    ),
                    children: [
                      ListTile(
                        title: TextField(
                          decoration:
                              const InputDecoration(labelText: 'Dose 1 Time'),
                          onChanged: (value) {
                            setState(() {
                              dose1 = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: const Row(
                      children: [
                        Icon(Icons.schedule),
                        Text('Dose 2'),
                      ],
                    ),
                    children: [
                      ListTile(
                        title: TextField(
                          decoration:
                              const InputDecoration(labelText: 'Dose 2 Time'),
                          onChanged: (value) {
                            setState(() {
                              dose2 = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  ExpansionTile(
                    title: const Row(
                      children: [
                        Icon(Icons.schedule),
                        Text('Dose 3'),
                      ],
                    ),
                    children: [
                      ListTile(
                        title: TextField(
                          decoration:
                              const InputDecoration(labelText: 'Dose 3 Time'),
                          onChanged: (value) {
                            setState(() {
                              dose3 = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      ChoiceChip(
                        label: const Text('Before Food'),
                        selected: timing == 'Before Food',
                        onSelected: (bool selected) {
                          setState(() {
                            timing = 'Before Food';
                          });
                        },
                      ),
                      ChoiceChip(
                        label: const Text('After Food'),
                        selected: timing == 'After Food',
                        onSelected: (bool selected) {
                          setState(() {
                            timing = 'After Food';
                          });
                        },
                      ),
                      ChoiceChip(
                        label: const Text('Before Sleep'),
                        selected: timing == 'Before Sleep',
                        onSelected: (bool selected) {
                          setState(() {
                            timing = 'Before Sleep';
                          });
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  const Padding(
                    padding: EdgeInsets.only(bottom: 20.0),
                    child: MyButton(text: "Add"),
                  )
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
