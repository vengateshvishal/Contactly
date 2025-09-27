// File: contact.dart

class Contact {
  final String name;
  final String jobTitle;
  final String email; // Added for detail screen placeholder
  final String phone; // Added for detail screen placeholder

  Contact({
    required this.name,
    required this.jobTitle,
    required this.email,
    required this.phone,
  });

  // Helper method to get initials (e.g., "John Smith" -> "JS")
  String get initials {
    List<String> parts = name.split(' ');
    String initial = '';
    if (parts.isNotEmpty) {
      initial += parts[0][0];
    }
    if (parts.length > 1) {
      initial += parts.last[0];
    }
    return initial.toUpperCase();
  }
}

// Sample data to populate the list
final List<Contact> sampleContacts = [
  Contact(
    name: 'Jane Smith',
    jobTitle: 'Software Engineer',
    email: 'jane.s@example.com',
    phone: '202-555-0147',
  ),
  Contact(
    name: 'Robert Davis',
    jobTitle: 'Product Manager',
    email: 'r.davis@example.com',
    phone: '415-555-2671',
  ),
  Contact(
    name: 'Emily Brown',
    jobTitle: 'UX Designer',
    email: 'emily.b@example.com',
    phone: '646-555-8392',
  ),
  Contact(
    name: 'Michael Clark',
    jobTitle: 'Data Scientist',
    email: 'm.clark@example.com',
    phone: '305-555-4420',
  ),
  Contact(
    name: 'Olivia Wilson',
    jobTitle: 'Marketing Specialist',
    email: 'o.wilson@example.com',
    phone: '718-555-9013',
  ),
];
