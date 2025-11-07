🐝 flutter_hive_auth_app

A simple Flutter project demonstrating user registration, login, auto-login, and local data storage using the Hive database.
The app starts with a Splash Screen, then directs users to the Login or Home Page based on their login state.

🚀 Features
•	🧩 Splash Screen – Displays briefly before navigating to the appropriate page
•	📝 User Registration – Registers and saves user credentials locally
•	🔐 Login Authentication – Authenticates users using locally stored Hive data
•	🔁 Auto-Login – Keeps users logged in until they manually log out
•	🏠 Home Page – Displays the logged-in user’s name and email
•	🚪 Logout Option – Clears session and redirects to Login page
🧠 Tech Stack
•	Flutter - Front-end UI framework
•	Dart - Programming language
•	Hive - Lightweight local NoSQL database for Flutter


🏗️ Project Structure

lib/
│
├── main.dart                       # Entry point of the app
│
├── models/
│   ├── user_model.dart              # Hive user model class
│   └── user_model.g.dart            # Generated adapter file for Hive
│
├── screens/
│   ├── splash_screen.dart           # Splash screen logic
│   ├── login_screen.dart            # Login UI and logic
│   ├── register_screen.dart         # Registration page for new users 
│   ├── home_screen.dart             # Displays user details (name & email)


⚙️ Installation & Setup
1.	Clone the repository: git clone https://github.com/ param2635/flutter_hive_auth_app.git
2.	Navigate to the project directory: cd flutter_hive_auth_app
3.	Install dependencies: flutter pub get
4.	Run the app: flutter run
🧩 Dependencies

flutter:
  sdk: flutter
hive: ^2.2.3
hive_flutter: ^1.1.0
path_provider: ^2.1.1

👨‍💻 Author

Developed by: [GitHub Username: param2635]
Learning and exploring Flutter, Dart, and Hive for local storage.

🪶 License
This project is open source and available under the MIT License.
