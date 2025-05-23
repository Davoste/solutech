# Visits Tracker App

A Flutter application for tracking customer visits in a Route-to-Market Sales Force Automation system. Built for the Solutech Flutter Mobile Engineer Technical Challenge.

## Overview
This app allows sales reps to:
- Add new visits via a form
- View a list of visits
- Track activities during visits
- View visit statistics
- Search/filter visits

## Screenshots
!Landing Page [Screenshot (340)](https://github.com/user-attachments/assets/0d31622b-0bca-4db1-bb6e-2f6c1f17d299)

!Add Visit Page [Screenshot (341)](https://github.com/user-attachments/assets/a0b4d912-cc08-4655-a565-3a734f8f07e9)

## Architectural Choices
- **Clean Architecture**: Separates presentation, domain, and data layers for maintainability.
- **Provider**: Used for state management due to its simplicity and scalability.
- **go_router**: For declarative navigation.
- **HTTP Client**: Integrates with Supabase REST API with error handling.
- **Optional Offline Support**: Designed with `sqflite` for local storage and sync.
- **Tests**: Unit tests for use cases and widget tests for UI.

## Setup Instructions
1. Clone the repository: `git clone https://github.com/Davoste/solutech.git`
2. Install dependencies: `flutter pub get`
3. Run the app: `flutter run`
4. Ensure the Supabase API key is added in `lib/core/constants/api_constants.dart`.

## Assumptions
- Activities are linked by ID; descriptions are fetched separately and mapped in the UI.
- Visit statistics are computed client-side for simplicity.
- Offline support is partial (local storage only).

## Trade-offs
- Used Provider instead of BLoC for faster development; BLoC may be better for complex state.
- Limited offline sync to basic create/edit due to time constraints.
- Statistics are basic (count-based) to meet core requirements.

## Limitations
- Full offline sync requires additional backend support (e.g., conflict resolution).
- Search/filter is client-side; server-side filtering would be more efficient for large datasets.
