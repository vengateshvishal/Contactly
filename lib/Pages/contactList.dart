// File: contact_list_screen.dart (Must import 'contact.dart' and 'contact_detail_screen.dart')
import 'package:contactly/ClassFile/contact.dart';
import 'package:contactly/Pages/contactDetails.dart';
import 'package:flutter/material.dart';
// Assuming your files are in the same directory or a lib folder

class ContactListScreen extends StatefulWidget {
  const ContactListScreen({super.key});

  @override
  State<ContactListScreen> createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("My Contacts"),
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: sampleContacts.length,
          itemBuilder: (context, index) {
            final contact = sampleContacts[index];
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
              // Requirement: Material 3 Card (Card.elevated)
              child: Card.filled(
                // Requirement: On tap of a contact card -> Navigate
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) =>
                            ContactDetailScreen(contact: contact),
                      ),
                    );
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        // Requirement: Left -> CircleAvatar showing initials
                        CircleAvatar(
                          backgroundColor: Theme.of(context).colorScheme.primary,
                          child: Text(
                            contact.initials,
                            style: TextStyle(
                              color: Theme.of(context).colorScheme.onPrimary,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const SizedBox(width: 16),
                        // Requirement: Right -> Column
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children:[
                            // Requirement: Contact Name styled as titleMedium
                            Text(
                              contact.name,
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const SizedBox(height: 4),
                            // Requirement: Job Title styled as bodyMedium and using secondary color
                            Text(
                              contact.jobTitle,
                              style: Theme.of(context).textTheme.bodyMedium!
                                  .copyWith(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.secondary,
                                  ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
