import 'package:flutter/material.dart';
import '../widgets/base_screen.dart';
import '../widgets/custom_header.dart';
import '../services/api_service.dart';
import '../widgets/event_card.dart';

class EventsScreen extends StatefulWidget {
  const EventsScreen({super.key});

  @override
  State<EventsScreen> createState() => _EventsScreenState();
}

class _EventsScreenState extends State<EventsScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, dynamic>> _allEvents = [];
  List<Map<String, dynamic>> _filteredEvents = [];
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _loadEvents();
    _searchController.addListener(_onSearchChanged);
  }

  @override
  void dispose() {
    _searchController.removeListener(_onSearchChanged);
    _searchController.dispose();
    super.dispose();
  }

  Future<void> _loadEvents() async {
    final events = await ApiService.fetchEvents();
    setState(() {
      _allEvents = events;
      _filteredEvents = events;
      _isLoading = false;
    });
  }

  void _onSearchChanged() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredEvents = _allEvents.where((event) {
        final name = event["name"]?.toLowerCase() ?? '';
        final venue = event["venue"]?.toLowerCase() ?? '';
        final date = event["date"]?.toLowerCase() ?? '';
        return name.contains(query) || venue.contains(query) || date.contains(query);
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return BaseScreen(
      selectedIndex: 0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 5),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const CustomHeader(title: "Events"),
            const SizedBox(height: 10),

            // Search Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 5),
              child: TextField(
                controller: _searchController,
                decoration: InputDecoration(
                  hintText: "Search Event",
                  prefixIcon: const Icon(Icons.search),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: const BorderSide(color: Colors.blue),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),

            // Event List
            Expanded(
              child: _isLoading
                  ? const Center(child: CircularProgressIndicator())
                  : _filteredEvents.isEmpty
                  ? const Center(child: Text("No events found"))
                  : ListView.builder(
                itemCount: _filteredEvents.length,
                itemBuilder: (context, index) {
                  final event = _filteredEvents[index];
                  return Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
                    child: EventCard(event: event),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
