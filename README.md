# farmedev

Aplicación **iOS** para farmacia (Mifarma), construida con **SwiftUI** y **Clean Architecture**. Los datos se obtienen por defecto de una API de desarrollo (Mockoon).

---

## Tipo de aplicación

- **Plataforma:** iOS (iPhone)
- **Framework UI:** SwiftUI
- **Lenguaje:** Swift
- **Gestión de dependencias:** Xcode (proyecto nativo, sin Swift Package Manager externo)
- **Entrada:** `@main` en `farmedevApp.swift`; estado global inyectado vía `environment(AppState.self)`.

---

## Arquitectura: Clean Architecture

El proyecto está organizado en **tres capas** con dependencias hacia el dominio:

### 1. Domain (núcleo)

- **Models:** entidades de negocio (`Product`, `Address`, `ShoppingCart`, `AuthenticationProvider`, etc.).
- **Repositories (protocolos):** contratos para acceso a datos (`AuthRepository`, `CatalogRepository`, `SessionRepository`, etc.).
- **UseCases:** lógica de aplicación que orquesta repositorios (`AuthUseCase`, `CatalogUseCase`, `PointsUseCase`, etc.).
- **Requests/Responses:** DTOs de dominio para casos de uso (`CompleteSignInRequest`, `SearchProductRequest`, etc.).

El dominio **no depende** de Data ni de Presentation.

### 2. Data

- **Models (DTOs):** estructuras que reflejan la API o el almacenamiento (`*DTO`, `*ResponseDTO`).
- **Mappers:** conversión DTO → Domain y Domain → DTO (`*DTOMapper`).
- **DataStores:** implementaciones concretas de fuentes de datos (cloud, local):
  - `AuthCloudDataStore`, `SessionLocalDataStore`, `ProductDataStore`, `CatalogDataStore`, etc.
- **Repositories (implementaciones):** clases que implementan los protocolos del dominio y usan uno o varios DataStores.
- **Networking:** `APIEnvironment` para base URL (Mockoon en desarrollo, custom para producción/dispositivo físico).

La capa Data **depende solo** del Domain (implementa repositorios y usa modelos de dominio).

### 3. Presentation

- **Features:** vistas por flujo (Auth, Inicio, Compras, Cuenta, MainTab).
- **Views:** pantallas SwiftUI (`LoginView`, `LoginPasswordView`, `RegisterView`, `ResetPasswordView`, `InicioView`, `ComprasView`, `CuentaView`, `MainTabView`).
- **ViewModels:** cuando se usa, estado observable (`@Observable`, p. ej. `HomeViewModel`).
- **Models (UI):** modelos para la UI (`*UI`).
- **Mappers:** conversión Domain/Data → UI (`*UIMapper`).

La capa Presentation **depende** del Domain (y a veces de Data solo para tipos concretos si se inyectan implementaciones).

---

## Flujo de la app

- **No logueado:** se muestra `LoginView` (correo, opción “Ingresar” → pantalla de contraseña; opciones sociales: Google, Facebook, Apple). Por ahora **solo el botón “Ingresa con Google”** realiza login y lleva al home.
- **Logueado:** se muestra `MainTabView` con **tab bar** de 3 pestañas:
  - **Inicio** (`InicioView`)
  - **Compras** (`ComprasView`, con FAB central)
  - **Cuenta** (`CuentaView`)
- **Estado global:** `AppState` (`@Observable`): `isLoggedIn`, datos de usuario, `logout()`, `login(email:)`, `loginWithSocial(provider:)`.

---

## Cómo está construido

- **UI:** 100 % SwiftUI (sin UIKit en vistas).
- **Navegación:** `NavigationStack` en el root (`ContentView`) y en cada tab; flujos de login (correo → contraseña, olvidaste contraseña, registro) con `NavigationLink` / `dismiss`.
- **Estado:** `AppState` en el environment; vistas leen/escriben con `@Environment(AppState.self)`.
- **API:** cliente HTTP contra `APIEnvironment.current.baseURL`; en desarrollo se usa **Mockoon** en `http://localhost:3000`.

---

## Configuración

- **Mockoon (desarrollo):** la app usa por defecto `http://localhost:3000`. Ejecuta Mockoon en tu Mac con el entorno de API Farmedev en el puerto 3000.
- **Dispositivo físico:** para que el dispositivo acceda a Mockoon, configura la base URL con la IP de tu Mac (p. ej. `http://192.168.1.x:3000`) en `Data/Networking/APIEnvironment.swift` (por ejemplo usando `.custom(URL(string: "http://...")!)`).
- **Producción:** en `APIEnvironment`, cambia `current` a `.custom(productionURL)` para builds Release y apunta a tu API real.
