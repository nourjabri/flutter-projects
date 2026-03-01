# Grocery Store

A Flutter application that displays a list of grocery stores using Clean Architecture and BLoC (Cubit) for state management.

## Getting Started


Architecture
The project follows Clean Architecture principles to ensure separation of concerns and scalability.

Domain Layer: Contains business logic (Entities) and repository contracts (Abstract Repositories).
Data Layer: Implements repositories, handles data fetching (API calls), and maps JSON to models.
Presentation Layer: Handles UI logic and state management using flutter_bloc (Cubit).
Features
List View: Displays a scrollable list of grocery stores.
State Management: Uses Cubit (part of the BLoC library) to manage Loading, Success, Error, and Empty states.
Error Handling: Gracefully handles network failures and displays a retry button.
Security: API Keys are excluded from version control using .env files.