import 'package:flutter/material.dart';
import '../models/destination.dart';

class DetailsScreen extends StatefulWidget {
  final Destination destination;

  const DetailsScreen({super.key, required this.destination});

  @override
  State<DetailsScreen> createState() => _DetailsScreenState();
}

class _DetailsScreenState extends State<DetailsScreen> {
  String selectedTripType = 'One Way';
  final List<String> tripTypes = ['One Way', 'Round Trip'];
  final int basePrice = 1200;

  @override
  Widget build(BuildContext context) {
    // Calculate price based on trip type
    int displayPrice = selectedTripType == 'Round Trip' ? basePrice * 2 : basePrice;

    return Scaffold(
      appBar: AppBar(
        title: Text(widget.destination.name),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Image.network(
              widget.destination.image,
              height: 250,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.destination.name,
                    style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    widget.destination.desc,
                    style: const TextStyle(fontSize: 18, color: Colors.black87),
                  ),
                  const SizedBox(height: 25),
                  const Text(
                    "Select Trip Type:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  DropdownButton<String>(
                    value: selectedTripType,
                    isExpanded: true,
                    items: tripTypes.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (newValue) {
                      setState(() {
                        selectedTripType = newValue!;
                      });
                    },
                  ),
                  const SizedBox(height: 20),
                  Text(
                    "Price: \$$displayPrice ($selectedTripType)",
                    style: const TextStyle(
                      fontSize: 22,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 30),
                  Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                      ),
                      onPressed: () {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('booked successfully'),
                            backgroundColor: Colors.green,
                          ),
                        );
                      },
                      child: const Text(
                        "Book Now",
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
