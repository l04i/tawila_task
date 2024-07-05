# Tawila Task App

This repository contains the source code for a mobile application developed as a submission for the Mobile Application Developer role at Tawila.

## Description

The Restaurant Finder App is a Flutter-based mobile application designed to display a list of restaurants using a backend API provided by Tawila. It features a user-friendly interface, responsive design, and several key functionalities aimed at enhancing the user experience.

## Features

- **MVVM Architecture:** Implemented using Model-View-ViewModel for clear separation of concerns.
- **Repository Pattern:** Organized data handling and management with the Repository pattern.
- **Search Functionality:** Enables users to search for restaurants by name.
- **Pull-to-Refresh:** Allows users to refresh the restaurant list with a simple swipe gesture.
- **Caching:** Implements local data caching for improved performance and offline access.
- **Responsive Design:** Ensures compatibility and usability across various screen sizes and orientations.

## Technologies Used

- **Flutter SDK 3.22:** Framework for building cross-platform applications.
- **Packages:**
  - `cached_network_image`: Efficiently loads and caches images from the network.
  - `flutter_screenutil`: Provides responsive UI design principles.
  - `Provider`: State management for Flutter applications.
  - `http`: HTTP client for making requests to the backend API.
