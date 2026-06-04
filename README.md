# farmedev

Aplicación **iOS** para farmacia (Mifarma), construida con **SwiftUI** y **Clean Architecture**. Los datos se obtienen por defecto de una API de desarrollo (Mockoon en `localhost:3000`).

---

## Plataforma y stack

| Elemento | Detalle |
|---|---|
| Plataforma | iOS 17+ (iPhone) |
| Framework UI | SwiftUI |
| Lenguaje | Swift |
| Gestión de dependencias | Xcode nativo (sin SPM externo) |
| Seguridad | Security framework (Keychain) |
| Entry point | `farmedevApp.swift` → `ContentView` |

---

## Arquitectura: Clean Architecture

El proyecto se organiza en tres capas con dependencia unidireccional hacia el dominio.

### Domain
- **Models:** entidades de negocio (`Product`, `UserLogin`, `ShoppingCart`, `Address`, etc.)
- **Repositories (protocolos):** contratos de acceso a datos
- **UseCases:** lógica de aplicación (`AuthUseCase`, `ProductUseCase`, `CatalogUseCase`, etc.)
- **Requests / Responses:** DTOs de dominio

### Data
- **Models (DTOs):** estructuras que reflejan la API
- **Mappers:** DTO → Domain
- **DataStores:** implementaciones cloud y local (`*CloudDataStore`, `*LocalDataStore`)
- **Repositories:** implementan los protocolos del dominio
- **Networking:** `APIClient` (URLSession) + `APIEnvironment` (Mockoon / producción)
- **Services:** `KeychainService` y `SessionStore` para persistencia segura de sesión

### Presentation
- **Coordinators:** `AuthCoordinator`, `InicioCoordinator` — navegación type-safe con `NavigationPath`
- **Features:** cada feature tiene vista principal, ViewModel y subcarpeta `Components/`
- **ViewModels:** `@Observable` (`InicioViewModel`, `HomeViewModel`)
- **Models (UI):** `*UI`
- **Mappers:** Domain → UI (`*UIMapper`)

---

## Navegación — Coordinator Pattern

La app usa el patrón **Coordinator** con `NavigationStack` + `navigationDestination(for:)` (iOS 16+).

```
farmedevApp
└── ContentView
    ├── AuthCoordinatorView        (isLoggedIn = false)
    │   └── NavigationStack
    │       ├── LoginView
    │       ├── LoginPasswordView
    │       ├── RegisterView
    │       └── ResetPasswordView
    └── MainTabView                (isLoggedIn = true)
        ├── InicioCoordinatorView
        │   └── NavigationStack
        │       ├── InicioView
        │       ├── AddressSearchView
        │       └── CarritoView
        ├── ComprasView
        └── CuentaView
```

---

## Flujo de la app

### Autenticación
- **Login con correo:** email → pantalla de contraseña → Home
- **Login social:** tap en Google → Home directo
- **Sesión persistente:** el email se guarda en **Keychain**; al reabrir la app la sesión se restaura automáticamente sin pasar por el login
- **Logout:** Cuenta → "Cerrar sesión" limpia el Keychain y regresa al Login

### Home (Inicio)
- Barra de dirección sticky (tap → `AddressSearchView`)
- Ícono de carrito con contenedor oscuro (tap → `CarritoView`)
- Tarjetas de ahorro (Ahorraste / Tienes)
- **Banner carousel** — 3 slides, auto-avance 5 s, dots morado/gris
- Monedero del Ahorro (scroll horizontal de acciones)
- Catálogo de productos (5 categorías)
- **Product banner carousel** (Beauty Week) — 3 slides, auto-avance 5 s, dots morado/gris
- Sección "Conoce tu Monedero del Ahorro" (título fuera, card con descripción y link)

### Dirección (`AddressSearchView`)
- Campo de búsqueda con ícono, teclado automático al abrir
- Estado vacío: acceso directo a "Mi ubicación actual"
- Estado con texto: lista filtrada en tiempo real + "¿No encuentras la dirección?"
- Disclaimer inferior fijo
- Al seleccionar un resultado actualiza `AppState.defaultAddress` en toda la app

### Carrito (`CarritoView`)
- Barra de dirección + Delivery en la parte superior
- Tabs "Mi carrito" / "Mis favoritos" (ícono filled/outline según selección, texto siempre morado)
- Empty state con CTA "Ir a comprar"
- **"¿No olvidas nada? 👀"** — carrusel de 5 páginas × 2 productos, auto-avance 3 s, dots naranja/gris

### Compras
- Barra de dirección sticky con carrito
- Chips de categoría horizontales
- Banner carousel (5 slides, auto-avance 5 s, dots morado/gris)
- Filas de productos (Ofertas del día, Lo más vendido)
- Banner de cuenta regresiva

### Cuenta
- Perfil con nombre del usuario
- Accesos rápidos (Mi perfil, Mis pedidos, Mis favoritos)
- Lista de opciones con chevron
- Botón "Cerrar sesión"

---

## Estructura de carpetas

```
farmedev/
├── App/
│   ├── farmedevApp.swift
│   ├── ContentView.swift
│   └── AppState.swift
├── Data/
│   ├── Networking/        APIClient, APIEnvironment
│   ├── Services/          KeychainService, SessionStore
│   ├── Repository/
│   ├── Models/            DTOs
│   └── Mappers/
├── Domain/
│   ├── Models/
│   ├── Repository/        Protocolos
│   └── UseCases/
└── Presentation/
    ├── Coordinators/      AuthCoordinator, InicioCoordinator
    ├── Features/
    │   ├── Auth/          + Components/
    │   ├── Inicio/        + Components/
    │   ├── Carrito/       + Components/
    │   ├── Compras/       + Components/
    │   ├── Cuenta/        + Components/
    │   ├── Home/          + Components/
    │   └── MainTab/
    ├── Models/            *UI
    ├── Mappers/           *UIMapper
    └── Shared/
```

---

## Configuración de entorno

### Mockoon (desarrollo)
La app apunta por defecto a `http://localhost:3000`. Ejecuta Mockoon con el entorno Farmedev activo en el puerto 3000.

### Dispositivo físico
En `APIEnvironment.swift` usa `.custom(URL(string: "http://TU_IP_MAC:3000")!)` para que el dispositivo alcance Mockoon en la misma red.

### Producción
En `APIEnvironment.current` cambia `.mockoon` por `.custom(productionURL)` y construye con la configuración Release.

---

## Convenciones del proyecto

- Ningún archivo de vista supera ~120 líneas — cada pantalla delega en `Components/`
- ViewModels en archivo propio, separados de la vista
- Coordinadores manejan toda la navegación; las vistas no se conocen entre sí
- `@Observable` en lugar de `ObservableObject` (iOS 17+)
- Keychain para sesión persistente; nunca `UserDefaults` para credenciales
- Estilos compartidos de Auth centralizados en `LoginStyles.swift`
