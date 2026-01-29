<h1>🌦 Weather App (SwiftUI)</h1>

<p>
A  modern <strong>Weather App built using SwiftUI</strong> that demonstrates real-world iOS concepts such as
<strong>MVVM architecture</strong>, <strong>async/await networking</strong>, <strong>Core Data caching</strong>,
<strong>NavigationStack</strong>, and a clean, responsive UI.
</p>

<p>
The app fetches live weather data from the <strong>Open-Meteo API</strong>, caches results locally,
and provides a smooth experience across <strong>Light</strong> and <strong>Dark</strong> modes.
</p>

<hr>

<h2>✨ Key Features</h2>
<ul>
  <li>📱 Built entirely using <strong>SwiftUI</strong></li>
  <li>🏗 Clean <strong>MVVM architecture</strong></li>
  <li>🌐 Live weather data using <strong>async/await</strong></li>
  <li>💾 <strong>Core Data caching</strong> with 1-hour sync interval</li>
  <li>🔍 City search functionality</li>
  <li>🌗 Light & Dark mode support</li>
  <li>🧭 One-way navigation flow (Landing → List → Detail)</li>
  <li>🏠 Home button to reset navigation stack</li>
  <li>🎨 Dynamic weather icons with meaningful colors</li>
</ul>

<hr>

<h2>📱 App Screenshots</h2>

<h3>🔹 App Icon</h3>
<img width="300" height="300" alt="App Icon"
src="https://github.com/user-attachments/assets/12752073-3f62-4a34-a99a-cb094dd8c8f4" />

<hr>

<h2>🏠 Landing Screen</h2>

<p>
The landing screen serves as the entry point of the application.
It introduces the app branding and allows users to toggle between Light and Dark mode.
Navigation begins from this screen.
</p>

<h4>🌞 Light Mode</h4>
<img width="300" height="300" alt="Landing Light Mode"
src="https://github.com/user-attachments/assets/22ed56f4-071e-4473-92ec-d148ca8cc8e7" />

<h4>🌙 Dark Mode</h4>
<img width="300" height="300" alt="Landing Dark Mode"
src="https://github.com/user-attachments/assets/8a1a13b1-be0b-4f51-b1c2-667ffc1e88e7" />

<ul>
  <li>Entry point of the app</li>
  <li>Displays app branding and theme toggle</li>
  <li>No back button (root of navigation)</li>
</ul>

<hr>

<h2>📍 Location List Screen</h2>

<p>
The location list screen displays a searchable list of cities along with
their cached weather data. Weather icons and temperatures update automatically
after visiting a city’s detail page.
</p>

<h4>🌞 Light Mode</h4>
<img width="300" height="300" alt="Location List Light Mode"
src="https://github.com/user-attachments/assets/601e1ce8-d0d0-4c38-bfef-6ed8cbca93b5" />

<h4>🌙 Dark Mode</h4>
<img width="300" height="300" alt="Location List Dark Mode"
src="https://github.com/user-attachments/assets/e9820b1f-a358-4e9f-8a64-f9eacfb52ade" />

<ul>
  <li>Searchable list of cities</li>
  <li>Displays cached temperature & weather icon</li>
  <li>Weather icons use contextual colors</li>
  <li>Option to clear cached weather data</li>
</ul>

<hr>

<h2>🌤 Location Detail Screen</h2>

<p>
The detail screen shows comprehensive weather information for a selected city.
Data is fetched from the API only when required and stored locally for reuse.
</p>

<h4>🌞 Light Mode</h4>
<img width="300" height="300" alt="Location Detail Light Mode"
src="https://github.com/user-attachments/assets/8fb8fdb0-4023-4244-93fd-4b949b7b5437" />

<h4>🌙 Dark Mode</h4>
<img width="300" height="300" alt="Location Detail Dark Mode"
src="https://github.com/user-attachments/assets/af6879a7-1ff5-4297-9eab-c5e45a7d9ae9" />

<ul>
  <li>Large weather icon with dynamic color</li>
  <li>Current temperature display</li>
  <li>Max / Min temperature</li>
  <li>Wind speed and precipitation</li>
  <li>Bubble-style back button</li>
  <li>Home button resets navigation to landing page</li>
</ul>

<hr>

<h2>🏗 Architecture Overview</h2>

<ul>
  <li><strong>Views:</strong> SwiftUI screens</li>
  <li><strong>ViewModels:</strong> Business logic & state management</li>
  <li><strong>Services:</strong> API calls & weather mapping</li>
  <li><strong>Core Data:</strong> Local persistence & caching</li>
</ul>

<p>
The app follows a unidirectional data flow and avoids unnecessary API calls
by using a time-based caching strategy.
</p>

<hr>

<h2>🚀 Conclusion</h2>

<p>
This Weather App demonstrates how to build a scalable, maintainable SwiftUI application
using modern iOS development practices. It balances clean architecture, performance,
and a polished user experience.
</p>
