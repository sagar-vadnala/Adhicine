
import 'package:flutter/material.dart';

class MedicineList extends StatelessWidget {
  const MedicineList({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MedicineCard(
          time: 'Morning 08:00 am',
          medicines: [
            Medicine(
              name: 'Calpol 500mg Tablet',
              description: 'Before Breakfast',
              day: 'Day 01',
              status: MedicineStatus.taken,
            ),
            Medicine(
              name: 'Calpol 500mg Tablet',
              description: 'Before Breakfast',
              day: 'Day 27',
              status: MedicineStatus.missed,
            ),
          ],
        ),
        MedicineCard(
          time: 'Afternoon 02:00 pm',
          medicines: [
            Medicine(
              name: 'Calpol 500mg Tablet',
              description: 'After Food',
              day: 'Day 01',
              status: MedicineStatus.snoozed,
            ),
          ],
        ),
      ],
    );
  }
}

class MedicineCard extends StatelessWidget {
  final String time;
  final List<Medicine> medicines;

  const MedicineCard({super.key, required this.time, required this.medicines});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          time,
          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 10),
        Column(
          children: medicines.map((medicine) => MedicineTile(medicine: medicine)).toList(),
        ),
        const SizedBox(height: 20),
      ],
    );
  }
}

class MedicineTile extends StatelessWidget {
  final Medicine medicine;

  const MedicineTile({super.key, required this.medicine});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.3),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 3),
          ),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              const Icon(Icons.medication_outlined, size: 40, color: Colors.purple),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(medicine.name, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                  Text(medicine.description, style: const TextStyle(color: Colors.grey)),
                  Text(medicine.day, style: const TextStyle(color: Colors.grey)),
                ],
              ),
            ],
          ),
          Icon(
            medicine.status == MedicineStatus.taken
                ? Icons.check_circle
                : medicine.status == MedicineStatus.missed
                    ? Icons.error
                    : Icons.alarm,
            color: medicine.status == MedicineStatus.taken
                ? Colors.green
                : medicine.status == MedicineStatus.missed
                    ? Colors.red
                    : Colors.orange,
          ),
        ],
      ),
    );
  }
}

class Medicine {
  final String name;
  final String description;
  final String day;
  final MedicineStatus status;

  Medicine({
    required this.name,
    required this.description,
    required this.day,
    required this.status,
  });
}

enum MedicineStatus { taken, missed, snoozed }