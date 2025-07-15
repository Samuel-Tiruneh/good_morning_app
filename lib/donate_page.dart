import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class DonatePage extends StatelessWidget {
  const DonatePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            // Impact Infographic
            Card(
              color: Colors.orange[50],
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: Column(
                  children: [
                    const Icon(Icons.volunteer_activism, size: 50, color: Colors.orange),
                    const SizedBox(height: 10),
                    RichText(
                      textAlign: TextAlign.center,
                      text: const TextSpan(
                        style: TextStyle(color: Colors.black87, fontSize: 16),
                        children: [
                          TextSpan(text: "Every ₹500 "),
                          TextSpan(text: "provides ", style: TextStyle(fontWeight: FontWeight.bold)),
                          TextSpan(text: "sanitation for 1 person for a month"),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 30),

            // Donation Options
            const Text(
              "How You Can Help:", 
              style: TextStyle(
                fontSize: 20, 
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 15),
            
            // Equal height donation cards
            Expanded(
              child: _buildDonationOption("Sponsor a Toilet Unit", "₹5,000", Icons.wc),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: _buildDonationOption("Monthly Supporter", "₹500/month", Icons.calendar_today),
            ),
            const SizedBox(height: 15),
            Expanded(
              child: _buildDonationOption("One-Time Gift", "Any Amount", Icons.currency_rupee),
            ),

            const SizedBox(height: 20),

            // Secure Donation Button
            ElevatedButton.icon(
              icon: const Icon(Icons.lock, color: Colors.white),
              label: const Text(
                "Donate Securely",
                style: TextStyle(color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: const EdgeInsets.symmetric(vertical: 15),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onPressed: () => launchUrl(
                Uri.parse("https://TheTannMannGaadi.Org/donate"),
                mode: LaunchMode.externalApplication,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildDonationOption(String title, String amount, IconData icon) {
    return Card(
      elevation: 2,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Container(
        padding: const EdgeInsets.all(16),
        height: 120, // Fixed height for all cards
        child: Row(
          children: [
            Icon(icon, size: 40, color: Colors.orange),
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      amount,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
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