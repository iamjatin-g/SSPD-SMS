import 'package:flutter/material.dart';
import '../widgets/base_screen.dart';
import '../widgets/custom_header.dart';
import '../widgets/transport_card.dart'; // ✅ Import reusable transport card

class TransportScreen extends StatelessWidget {
  const TransportScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      selectedIndex: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        // padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomHeader(title: "Transport"), // ✅ Using Custom Header

            const SizedBox(height: 10),

            // ✅ Search Bar
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.blue),
                borderRadius: BorderRadius.circular(8),
              ),
              child: Row(
                children: [
                  const Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Search Transport",
                      ),
                    ),
                  ),
                  IconButton(
                    icon: const Icon(Icons.search, color: Colors.blue),
                    onPressed: () {
                      // Handle search functionality
                    },
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: ListView(
                children: const [
                  TransportCard(
                    busNo: "1",
                    status: "Live",
                    pickup: "Green Park (7:30 AM)",
                    drop: "Sunshine Colony (2:30 PM)",
                    driver: "Rajesh Kumar (9876543210)",
                    supervisor: "Anita Sharma (9876543211)",
                    timeAgo: "Live",
                  ),
                  SizedBox(height: 10),
                  TransportCard(
                    busNo: "2",
                    status: "Live",
                    pickup: "Blue Hill (7:45 AM)",
                    drop: "Garden Lane (2:45 PM)",
                    driver: "Suresh Mehta (9876543212)",
                    supervisor: "Meena Verma (9876543213)",
                    timeAgo: "Live",
                  ),
                  SizedBox(height: 10),
                  TransportCard(
                    busNo: "3",
                    status: "Ended",
                    pickup: "Lakeview (8:00 AM)",
                    drop: "Riverbend (3:00 PM)",
                    driver: "Vinod Yadav (9876543214)",
                    supervisor: "Pooja Singh (9876543215)",
                    timeAgo: "2 Hours ago",
                  ),
                  SizedBox(height: 10),
                  TransportCard(
                    busNo: "4",
                    status: "Ended",
                    pickup: "Rose Villa (7:15 AM)",
                    drop: "Central Market (2:15 PM)",
                    driver: "Rakesh Sinha (9876543216)",
                    supervisor: "Neha Jain (9876543217)",
                    timeAgo: "3 Hours ago",
                  ),
                  SizedBox(height: 10),
                  TransportCard(
                    busNo: "5",
                    status: "Ended",
                    pickup: "Ashok Nagar (8:10 AM)",
                    drop: "City Mall (3:10 PM)",
                    driver: "Mahesh Patil (9876543218)",
                    supervisor: "Kavita Rao (9876543219)",
                    timeAgo: "4 Hours ago",
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
