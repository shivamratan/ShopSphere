# ShopSphere 🛒

ShopSphere is a modern, high-performance e-commerce mobile application built with Flutter. It follows Clean Architecture principles to provide a scalable, maintainable, and robust shopping experience.

## 🌟 Introduction
ShopSphere aims to bridge the gap between a seamless online shopping experience and reliable offline functionality. Whether you're browsing the latest tech gadgets or everyday essentials, ShopSphere provides a fast, intuitive, and data-efficient interface.

## 📝 Description
The application features a dynamic, real-time updated dashboard, comprehensive product listing with advanced filtering and sorting, and a sophisticated offline caching system. It integrates with the DummyJSON API for product data and leverages Firebase for backend infrastructure, including authentication and push notifications.

## 🛠 Tech Stack
- **Framework:** [Flutter](https://flutter.dev/) - UI toolkit for building natively compiled applications.
- **State Management:** [Riverpod](https://riverpod.dev/) - Reactive state management and dependency injection.
- **Networking:** [Dio](https://pub.dev/packages/dio) - Powerful HTTP client for Dart/Flutter.
- **Persistence:** [Drift](https://drift.simonbinder.eu/) - Reactive SQLite database for robust offline storage.
- **Navigation:** [GoRouter](https://pub.dev/packages/go_router) - Declarative routing library.
- **Backend Services:** [Firebase](https://firebase.google.com/) (Auth, Analytics, Messaging).
- **Architecture:** Clean Architecture (Data, Domain, and Presentation layers).

## 🚀 Key Features

### 🖥 Dashboard
- **Auto-Sliding Banner:** Dynamic image slider for featured promotions and announcements.
- **Category Browsing:** Quick access to various product categories.
- **Curated Sections:** Dedicated sections for "Featured Products" and "Popular Products".

### 🔍 Advanced Product Discovery
- **Infinite Pagination:** Smooth scrolling with automatic loading of subsequent pages (20 items per page).
- **Real-time Search:** Instantly find products by title or description.
- **View Toggling:** Switch between Grid and List layouts to suit your preference.
- **Robust Filtering:** Filter products by category, price range, minimum rating, and stock availability.
- **Flexible Sorting:** Sort by relevance, price, rating, or name.

### 📶 Offline-First Capability
- **Smart Caching:** Implements a "Network-First, Cache-Fallback" strategy using Drift SQLite.
- **Seamless Browsing:** Continue browsing previously loaded products and categories even without an internet connection.

### 🛒 Cart & User Experience
- **Empty State Design:** Intuitive UI for empty cart states with a clear call to action.
- **Responsive Design:** Optimized for a variety of Android and iOS devices.

## 🏗 Project Structure
The project follows a feature-first approach within a layered architecture:
- `lib/core`: Shared utilities, networking, and database configurations.
- `lib/features`: Feature-based modules (Dashboard, Product, Cart, Auth, Profile).
  - `data`: DTOs and Repository implementations.
  - `domain`: Entities/Models, Repositories (abstract), and UseCases.
  - `presentation`: Screens, Widgets, and Riverpod Providers.
