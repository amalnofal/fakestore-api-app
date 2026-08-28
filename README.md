# Store App - RESTful API Integration 🛒

A robust Flutter E-commerce application designed to demonstrate clean API integration, state management, and modern UI implementation. The project consumes the [Fake Store API](https://fakestoreapi.com/) to manage and display product data dynamically.

## 🎯 Project Focus & Architecture

The primary goal of this project is to implement a clean and scalable approach to networking and API handling in Flutter. 
* **Custom API Wrapper:** A centralized `Api` helper class built to handle `GET`, `POST`, and `PUT` HTTP requests with dynamic token and header management.
* **Service Layer Pattern:** Separation of concerns by dedicating a specific service class for each API endpoint:
  - `AllProductsService`: Fetches the complete product catalog.
  - `AllCategoriesService`: Retrieves available product categories.
  - `GetCategoryService`: Filters and fetches products by a specific category.
  - `AddProductService`: Handles creating new products via POST requests.
  - `UpdateProductService`: Manages modifying existing products via PUT requests.
* **Data Modeling:** Safely parsing JSON data into Dart objects using `ProductModel` and `RatingModel` to ensure type safety across the app.
* **State Management:** Utilizing **Cubit (Bloc)** (`ProductFormCubit`) to manage form states (Loading, Success, Failure) gracefully with UI feedback.

## ✨ Features

* **Dynamic Product Feed:** Fetches and displays a list of products in a responsive grid layout.
* **Category Filtering:** Interactive, stateful horizontal chips that fetch specific category data upon selection.
* **Product Management (POST/PUT):** A dynamic form (`ProductFormPage`) capable of both adding new products and updating existing ones, complete with loading overlays (`ModalProgressHUD`) and custom SnackBars for error/success handling.
* **Product Details:** A detailed view showcasing product images, prices, descriptions, and dynamic star ratings.
* **Refined UI/UX:** Pixel-perfect implementation based on Figma designs, featuring custom reusable widgets (e.g., `CategoryChip`, `FeatureTag`, `CircleIconButton`) adhering to the Single Responsibility Principle.

## 🛠️ Tech Stack & Packages

* **Framework:** Flutter
* **State Management:** flutter_bloc (Cubit)
* **Networking:** http
* **UI Utilities:** modal_progress_hud_nsn

## 📱 Visuals

| Home Feed | Category Filtering | Product Details | Add/Update Form |
| :---: | :---: | :---: | :---: |
| <img src="https://github.com/user-attachments/assets/207fc2ba-00c5-4d78-8700-c93f26a0567d" width="220" alt="Home Feed"/> | <img src="https://github.com/user-attachments/assets/5f4e1d17-bdb4-4a5e-8a9b-6e2461bf80b3" width="220" alt="Category Filtering" /> | <img src="https://github.com/user-attachments/assets/fedcc6e7-9623-44eb-81ad-80bd1bf703dd" width="220" alt="Product Details" /> | <img src="https://github.com/user-attachments/assets/735af421-e5e3-415f-95db-afaa9ff50b5d" width="220" alt="Add/Update Form" /> |

## 🚀 Getting Started

1. Clone the repository:
   ```bash
   git clone https://github.com/amalnofal/fakestore-api-app.git
