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

Create the Secrets.plist file

In the root directory of the project (where the .xcodeproj file is located), create a new file named Secrets.plist with the following content:

```xml
<?xml version="1.0" encoding="UTF-8"?>
<!DOCTYPE plist PUBLIC "-//Apple//DTD PLIST 1.0//EN" "http://www.apple.com/DTDs/PropertyList-1.0.dtd">
<plist version="1.0">
<dict>
    <key>API_KEY</key>
    <string>YOUR_API_KEY_HERE</string>
</dict>
</plist>
```



Replace the placeholder value with your actual API key, which you can obtain from:
👉 https://developer.nrel.gov/docs/api-key/
⚠️ Important: Do not commit your real API key to version control. The Secrets.plist file should be listed in your .gitignore.
