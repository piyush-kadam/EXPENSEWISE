import 'package:flutter/material.dart';

class Bills extends StatelessWidget {
  const Bills({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        title: Text(
          'Bills',
          style: TextStyle(
            fontFamily: 'Roboto',
            fontSize: 24,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // OTT Subscriptions
              _buildCategoryContainer(
                context: context,
                label: 'OTT Subscriptions',
                imagePath: 'assets/images/OTT.jpg',
                details: [
                  {'label': 'Netflix', 'amount': '₹ 499'},
                  {'label': 'Amazon Prime', 'amount': '₹ 129'},
                ],
              ),

              const SizedBox(height: 16),

              // EMIs
              _buildCategoryContainer(
                context: context,
                label: 'EMIs',
                imagePath: 'assets/images/EMI.jpg',
                details: [
                  {'label': 'Car EMI', 'amount': '₹ 15,000'},
                  {'label': 'Home Loan EMI', 'amount': '₹ 25,000'},
                ],
              ),

              const SizedBox(height: 16),

              // Electricity Bills
              _buildCategoryContainer(
                context: context,
                label: 'Electricity Bill',
                imagePath: 'assets/images/ELEC.png',
                details: [
                  {'label': 'June 2024', 'amount': '₹ 1,500'},
                  {'label': 'July 2024', 'amount': '₹ 1,800'},
                ],
              ),

              const SizedBox(height: 16),

              // Maintenance
              _buildCategoryContainer(
                context: context,
                label: 'Maintenance',
                imagePath: 'assets/images/MAIN.png',
                details: [
                  {'label': 'Building Maintenance', 'amount': '₹ 2,000'},
                ],
              ),
            ],
          ),
        ),
      ),
      backgroundColor: Colors.black,
    );
  }

  // Helper method to build category containers with images
  Widget _buildCategoryContainer({
    required BuildContext context,
    required String label,
    required String imagePath,
    required List<Map<String, String>> details,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // Title outside the container
        Text(
          label,
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: Colors.green,
          ),
        ),
        const SizedBox(height: 8),
        // Container with image
        GestureDetector(
          onTap: () {
            _showBillDetails(context, details);
          },
          child: Container(
            constraints: BoxConstraints(
              maxHeight: 150, // Adjust the height as needed
            ),
            decoration: BoxDecoration(
              color: Colors.grey[900],
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black54,
                  offset: Offset(0, 4),
                  blurRadius: 8,
                ),
              ],
            ),
            clipBehavior: Clip.antiAlias,
            child: Stack(
              children: [
                Positioned.fill(
                  child: Image.asset(
                    imagePath,
                    fit: BoxFit.cover,
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
      ],
    );
  }

  // Method to show a modal with bill details
  void _showBillDetails(
      BuildContext context, List<Map<String, String>> details) {
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.black,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Details',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 20),
              ...details.map((detail) => Padding(
                    padding: const EdgeInsets.only(bottom: 10.0),
                    child: Row(
                      children: [
                        Text(
                          '${detail['label']}: ',
                          style: TextStyle(
                            color: Colors.grey,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          detail['amount']!,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ],
                    ),
                  )),
              const SizedBox(height: 20),
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    // Handle payment action
                  },
                  style: ElevatedButton.styleFrom(
                    foregroundColor: Colors.black,
                    backgroundColor: Colors.green, // Text color
                  ),
                  child: Text('Pay'),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
