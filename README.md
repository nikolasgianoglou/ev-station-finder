🧠 MVVM Architecture
This project uses the Model-View-ViewModel (MVVM) pattern to separate concerns, improve testability, and keep UI code clean:

Model: Represents data coming from the API (EVStation, EVStationsResponse).

ViewModel: Handles business logic and data formatting. For example, ListStationViewModel transforms raw station data into displayable items and handles loading/error states.

View: SwiftUI views like InputView, ListStationView, and StationDetailView were kept simple and reactive, binding to @Published properties from the ViewModels.

Level 1: ✅  
-> Input ZIP Code  
-> Fetch and display station list  
-> Handle loading and empty states  
Level 2: ✅ (Partially)  
-> Tap a station to view a detail screen  
-> Display station name and full address  

🔐 Configuring the API Key  
This project requires an API key to access EV station data.
Insert the value for API_KEY in the Secrets.plist with your actual API key, which you can obtain from:
👉 https://developer.nrel.gov/docs/api-key/  
Once you get your API Key, insert in the Secrets.plist file.
