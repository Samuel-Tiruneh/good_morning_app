import 'package:flutter/material.dart';

class LocationsPage extends StatelessWidget {
  final List<Map<String, dynamic>> _locations = [
    {
      "name": "Bangalore Urban",
      "units": 12,
      "status": "Active",
      "lastServiced": "2 days ago"
    },
    {
      "name": "Rural Karnataka",
      "units": 8,
      "status": "Needs Maintenance",
      "lastServiced": "1 week ago"
    },
    {
      "name": "New Deployment",
      "units": 5,
      "status": "Coming Soon",
      "lastServiced": "N/A"
    },
  ];

  LocationsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Our Coverage"),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {}, 
          ),
        ],
      ),
      body: ListView.builder(
        itemCount: _locations.length,
        itemBuilder: (context, index) {
          final loc = _locations[index];
          return ExpansionTile(
            leading: const Icon(Icons.location_on, color: Colors.orange),
            title: Text(loc["name"], style: const TextStyle(fontWeight: FontWeight.w500)),
            subtitle: Text("${loc["units"]} units • ${loc["status"]}"),
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    _buildDetailRow("Status", loc["status"]),
                    _buildDetailRow("Units Deployed", loc["units"].toString()),
                    _buildDetailRow("Last Serviced", loc["lastServiced"]),
                    const SizedBox(height: 10),
                    if (loc["status"] == "Needs Maintenance")
                      TextButton(
                        child: const Text("Report Issue"),
                        onPressed: () {}, // Could link to maintenance form
                      ),
                  ],
                ),
              ),
            ],
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.orange,
        child: const Icon(Icons.map),
        onPressed: () {}, // Could open interactive map
      ),
    );
  }

  Widget _buildDetailRow(String label, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 5),
      child: Row(
        children: [
          Text("$label: ", style: const TextStyle(fontWeight: FontWeight.bold)),
          Text(value),
        ],
      ),
    );
  }
}