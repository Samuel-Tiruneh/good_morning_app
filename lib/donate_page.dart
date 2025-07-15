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
            const Text("How You Can Help:", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
            const SizedBox(height: 10),
            _buildDonationOption(context, "Sponsor a Toilet Unit", "₹5,000", Icons.wc),
            _buildDonationOption(context, "Monthly Supporter", "₹500/month", Icons.calendar_today),
            _buildDonationOption(context, "One-Time Gift", "Any Amount", Icons.currency_rupee),

            const Spacer(),

            // Secure Donation Button
            ElevatedButton.icon(
              icon: const Icon(Icons.lock),
              label: const Text("Donate Securely"),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
                padding: const EdgeInsets.symmetric(vertical: 15),
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

  Widget _buildDonationOption(BuildContext context, String title, String amount, IconData icon) {
    return Card(
      margin: const EdgeInsets.only(bottom: 15),
      child: ListTile(
        leading: Icon(icon, color: Colors.orange),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
        trailing: Chip(label: Text(amount, style: const TextStyle(color: Colors.white))),
        onTap: () {}, // Could link to specific donation amounts
      ),
    );
  }
}