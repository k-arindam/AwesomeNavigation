![Banner](assets/banner.jpg)

# 🚀 AwesomeNavigation

**AwesomeNavigation** is a lightweight and elegant SwiftUI navigation library designed to make routing in iOS/macOS apps simple, declarative, and centralized — all while retaining native SwiftUI performance and flexibility.

---

## ✨ Features

* 🚦 **Centralized Navigation Management** using a shared singleton or injectable instance.
* 🛝 **Type-safe Route Definition** using the `ANRoute` protocol.
* ↺ **Push**, **Pop**, **PushReplacement**, **PopToRoot** — all made easy.
* 🔧 **Configurable Root and Transitions** via `ANConfig`.
* 💡 **Declarative API** that fits naturally into SwiftUI’s ecosystem.
* ⚡ **Swift Package** ready for seamless integration.

---

## 🎞 Installation

Use **Swift Package Manager**:

### In Xcode:

1. Open your project.
2. Go to **File > Add Packages…**
3. Enter the repository URL:

   ```
   https://github.com/k-arindam/AwesomeNavigation.git
   ```
4. Add the package and import it where needed:

   ```swift
   import AwesomeNavigation
   ```

---

## 🚀 Getting Started

### Step 1: Define your routes

```swift
enum AppRoute: ANRoute {
    case home
    case settings
    case item(id: String)
}
```

### Step 2: Initialize the app with a config

```swift
@main
struct AwesomeNavigationExampleApp: App {
    var body: some Scene {
        WindowGroup {
            let config = ANConfig(initialRoute: AppRoute.home) { route in
                switch route {
                case .home: HomeView()
                case .settings: SettingsView()
                case .item(let id): ItemView(id: id)
                }
            }

            ANApplication(with: config)
                .preferredColorScheme(.dark)
        }
    }
}
```

---

## 🛍 Navigating Between Views

You can use the provided navigation methods from any view using `@EnvironmentObject`.

### Example: HomeView

```swift
struct HomeView: View {
    @EnvironmentObject var nav: AwesomeNavigation

    var body: some View {
        List {
            Section("PUSH") {
                Button("Push Settings View") {
                    nav.push(AppRoute.settings)
                }

                Button("Push Item View") {
                    nav.push(AppRoute.item(id: UUID().uuidString))
                }
            }

            Section("POP") {
                Button("Pop One View") {
                    nav.pop()
                }

                Button("Pop to Root") {
                    nav.popToRoot()
                }
            }
        }
        .navigationTitle("Home")
    }
}
```

---

## 📌 Core Components

### `AwesomeNavigation`

A shared or injectable navigation controller that holds and manipulates the `NavigationPath`.

### `ANRoute`

Protocol to define your route types. Conforming types must be `Hashable`, `Codable`, and `Sendable`.

### `ANConfig`

Configuration for your application including:

* Initial route
* Animation style
* Route-to-View builder closure

### `ANApplication`

Entry-point `View` that wraps `NavigationStack` and injects navigation environment.

---

## 📈 Future Scope

Here are a few exciting features planned for upcoming releases:

* [ ] 🥪 Unit-testable navigation by allowing injection of `AwesomeNavigation` (non-singleton mode)
* [ ] 🔍 Deep linking support via pre-filled `NavigationPath`
* [ ] 🧱 Scoped navigation contexts (multiple stacks in one app)
* [ ] 🛡️ Interception hooks (e.g., `onRouteWillPush`, auth guards, analytics)
* [ ] 🧑‍💻 DevTools-style route inspector/debug overlay
* [ ] 📱 iPad/macOS optimized UI state sync (split views, multiple windows)

---

## 🛠 Contributing

Pull requests are welcome! Feel free to open issues for bug reports or feature suggestions.

---

## 📄 Legal

- [**MIT License**](LICENSE)
- [**Code of Conduct**](CODE_OF_CONDUCT.md)

---

## 🙌 Acknowledgements

Inspired by:

* SwiftUI's native navigation stack
* Navigator paradigms from Flutter and React Router

---

## ❤️ Example App

A demo implementation is included in the `Example/` folder.

```swift
@main
struct AwesomeNavigationExampleApp: App {
    ...
}
```
