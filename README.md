![tv_hub](https://github.com/user-attachments/assets/625617c0-4372-4183-a2c4-b7c86e5e9b05)

### TVHUB is a modern Flutter application that provides users with a comprehensive database of movies and TV shows, powered by TheMovieDB API. The app features a sleek interface with multiple screens for browsing, searching, and managing content preferences.

## 🌟 Features

### 🔍 Content Discovery
- 📺 Browse popular movies and TV shows
- 📈 View trending content
- 🎬 Explore upcoming releases
- 📝 Access movie and TV show details, including synopses, ratings, and more
- 🔄 Pagination support for smooth scrolling through large content lists

### 🔍 Search
- 🕵️ Real-time search functionality with debounce implementation
- 📅 View trending movies and TV shows of the day
- 🚀 Quick access to content across the entire database

### 🎨 Personalization
- 🌗 Switch between dark and light themes
- 🌐 Change language (English/Arabic)
- 🌍 Select country preference (Egypt/USA) to get region-specific content
- 💾 Save preferences for future sessions

### 💻 UI/UX
- 🧼 Clean, modern interface with intuitive navigation
- 🦴 Skeleton loading screens for improved user experience
- 🔄 Smooth transitions and animations
- 📱 Responsive design that works across different device sizes
- 🚀 Sliver widgets for high-performance scrolling and dynamic layouts
## 🛠️ Architecture and Technical Implementation

### 🧹 Clean Architecture
The app follows clean architecture principles with a clear separation of concerns:
- **Presentation Layer**: UI components, Bloc for state management
- **Domain Layer**: Use cases, repositories interfaces, entities
- **Data Layer**: Data sources, repository implementations, models

### 🧩 State Management
- Using BLoC (Business Logic Component) pattern
- Efficient state handling across the application

### 🔑 Key Technical Features
- 📦 Repository pattern for data handling
- 🌐 API integration with error handling
- 📡 Network connectivity checking
- 💉 Dependency injection using GetIt
- 🌍 Internationalization support
- 💾 Local storage for user preferences

## 🗂️ Project Structure
![{C1EB3B6E-B132-485F-888E-FF4A72E5D044}](https://github.com/user-attachments/assets/a6b56b39-d80f-4736-bd1b-0d71badfe75f)

## Dependencies

   ### 🖼️ cached_network_image: ^3.4.1
   Efficiently loads and caches network images with placeholder and error handling support
  
  ### 🎠 carousel_slider: ^5.0.0
   Creates beautiful image carousels with customizable options and animations
  
  ### 📶 connectivity_plus: ^6.1.1
   Monitors network connectivity status and changes across platforms
  
  ### 🌐 dio: ^5.7.0
  Powerful HTTP client for making API requests with interceptors, transformers, and more
  
  ### 🧱 flutter_bloc: ^9.0.0
   Implements the BLoC pattern for predictable state management
  
  ### 🔐 flutter_dotenv: ^5.2.1
   Loads environment variables from .env files for secure API key management
  
  ### 🚀 flutter_launcher_icons: ^0.14.3
   Simplifies the task of updating your app's launcher icon
  
  ### 🌍 flutter_localizations: sdk: flutter
   Provides internationalization and localization facilities
  
  ### 🎨 flutter_svg: ^2.0.15
   Renders SVG files for high-quality vector graphics
  
  ### 💉 get_it: ^8.0.2
   Lightweight service locator for dependency injection
  
  ### 📝 google_fonts: ^6.2.1
   Easy access to Google Fonts for beautiful typography
  
  ### 🌐 intl: any
   Internationalization and localization support
  
  ### 💾 shared_preferences: ^2.3.3
   Persists simple data like user preferences across app sessions
  
  ### ⏳ skeletonizer: ^1.4.2
   Creates loading skeleton screens for improved user experience
  
  ### 📜 sliver_tools: ^0.2.12
   Advanced tools for working with slivers in scrollable layouts
  
  ### 📊 smooth_page_indicator: ^1.2.0+3
   Customizable page indicators for ViewPager/PageView
  
  ### 🌐 webview_flutter: ^4.10.0
   Embeds WebViews for displaying web content within the app

  ## 📱 Screenshots
  
  | HOME EN | HOME AR |
  |---------|---------|
  |![image](https://github.com/user-attachments/assets/87e673dd-5216-4a62-8600-4e21507ceef2)|![image](https://github.com/user-attachments/assets/3152349f-5a7a-4610-a43f-0fc0ffdd7eb3)|
  
  | POPULAR SCREEN EN | TOP RATED SCREEN AR |
  |---------|---------|
  |![image](https://github.com/user-attachments/assets/0f982f0b-1cd2-4ba9-98d3-3090f7e237dd)|![image](https://github.com/user-attachments/assets/dc4e3b28-b2a0-4459-a3f7-b1b7b640017b)|
  
  | MOVIE DETAILS SCREEN EN | TV SHOW DETAILS SCREEN AR |
  |-----------|-----------|
  |![Screenshot_20250227_131732](https://github.com/user-attachments/assets/e1f824ac-ff5b-47c5-bbab-cbe5140c9b38)|![Screenshot_20250227_131818](https://github.com/user-attachments/assets/6a5df974-2950-4887-888c-131cf8901ff6)|
  
  | SERACH EN | SERACH AR |
  |-----------|-----------|
  |![image](https://github.com/user-attachments/assets/cf44c90d-dd0e-4991-9918-f08b2ba9a0b5)|![image](https://github.com/user-attachments/assets/1f1bce5b-5584-4fa2-b8fe-2110fe1d1dc2)|

  | ERORR HANDLING EN | ERORR HANDLING AR |
  |-----------|-----------|
  |![image](https://github.com/user-attachments/assets/6c8a28e0-f4a5-4f19-bf7c-f1717a898f15)|![image](https://github.com/user-attachments/assets/8a64ac2c-d942-43fc-989b-d1e3d86eed12)|
  
  | SETTINGS EN | SETTINGS AR |
  |-----------|-----------|
  |![image](https://github.com/user-attachments/assets/cfb08de2-0aff-4bcf-8908-7d30b2ff9cd3)|![image](https://github.com/user-attachments/assets/a6320e2e-1da2-465e-a0d8-19e638094bc6)|
  
 
  

