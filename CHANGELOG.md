# Changelog

Todos los cambios relevantes del proyecto se documentan aquí.
El formato sigue [Keep a Changelog](https://keepachangelog.com/es/1.0.0/).

---

## [Unreleased] — feature/mappers → develop

### Añadido

#### Navegación — Coordinator Pattern
- `AuthCoordinator` + `AuthCoordinatorView`: flujo de autenticación con `NavigationStack` y `navigationDestination(for: AuthRoute.self)` — rutas type-safe `loginPassword`, `register`, `resetPassword`
- `InicioCoordinator` + `InicioCoordinatorView`: navegación del tab Inicio con rutas `addressSearch` y `carrito`
- `ContentView` ahora orquesta auth vs. home sin `NavigationLink` hardcodeados

#### Sesión persistente (Keychain)
- `KeychainService`: wrapper sobre el framework `Security` (save / load / delete)
- `SessionStore`: capa semántica sobre Keychain (save / load / clear / hasSession)
- `AppState.init()` restaura la sesión automáticamente al lanzar la app
- `login(email:)` y `loginWithSocial(provider:)` guardan la sesión en Keychain
- `logout()` limpia el Keychain y redirige al Login

#### Pantallas nuevas
- `AddressSearchView`: búsqueda de dirección con filtro en tiempo real, estado vacío (ubicación actual), disclaimer inferior, teclado automático al abrir
- `CarritoView`: carrito vacío con tabs Mi carrito / Mis favoritos, sección "¿No olvidas nada? 👀" con carrusel paginado (5 páginas × 2 productos, auto-avance 3 s, dots naranja/gris)

#### Componentes Home (Inicio)
- `InicioAddressBar`: barra sticky con contenedor oscuro en dirección y carrito, navegación a `AddressSearchView` y `CarritoView`
- `InicioBannerCarousel`: 3 slides dark con textos promocionales, auto-avance 5 s, dots morado/gris
- `InicioProductBannerCarousel`: 3 slides tipo Beauty Week (fondo rosa/azul/verde), auto-avance 5 s, dots morado/gris
- `InicioMonederoInfoCard`: card blanca con pregunta, descripción y link; título "Conoce tu Monedero del Ahorro" fuera del card
- `InicioSavingsCards`, `InicioHeaderView`, `InicioMonederoSection`, `InicioCatalogSection` extraídos como componentes independientes
- `InicioViewModel` movido a su propio archivo

#### Componentes Carrito
- `CarritoAddressStrip`: franja con dirección y Delivery
- `CarritoTabSelector`: segmented con ícono filled/outline, texto siempre morado, fondo lavanda al seleccionar
- `CarritoEmptyState`: estados vacíos para carrito y favoritos con CTA
- `CarritoSuggestedSection` + `CarritoProductCard`: carrusel paginado con timer y dots personalizados

#### Componentes Compras
- `ComprasAddressBar`, `ComprasHeaderView`, `ComprasCategoryChips`
- `ComprasBannerCarousel`: 5 slides, auto-avance 5 s, dots morado/gris
- `ComprasProductRow`: fila horizontal de productos reutilizable
- `ComprasCountdownBanner`: banner de cuenta regresiva con gradiente naranja

#### Componentes Auth
- `LoginStyles.swift`: estilos compartidos (`LoginTextFieldStyle`, `LoginPrimaryButtonStyle`, `LoginSocialButtonStyle`, `OrangeHeaderCurve`, extensiones de `Color`)
- `LoginHeaderView`: cabecera naranja con logo Mifarma
- `LoginEmailForm`: campo de correo + botón "Ingresar" con coordinator
- `LoginSocialButtons`: Google, Facebook y Apple
- `SecurePasswordField`: campo de contraseña reutilizable con toggle de visibilidad y sin prompt de guardado del sistema (`.textContentType(.none)`)
- `RegisterFormFields`: formulario de registro con validación de requisitos de contraseña

#### Componentes Cuenta
- `CuentaProfileCard`, `CuentaQuickActions`, `CuentaOptionsList` extraídos

#### Componentes Home (API)
- `HomeSliderSection`, `HomeCategoriesSection`, `HomeDashboardSection`, `HomeProductCard` extraídos

### Modificado

- **Todas las vistas principales** ahora son orquestadores delgados (< ~120 líneas) que delegan en `Components/`
- `LoginView`: elimina `NavigationLink` hardcodeado, usa `coordinator.showLoginPassword(email:)`
- `LoginPasswordView`: usa `SecurePasswordField`, elimina logs de debug, `.textContentType(.none)` para evitar prompt de guardar contraseña
- `RegisterView`: delega formulario en `RegisterFormFields`
- `ResetPasswordView`: back usa `coordinator.pop()`
- `CuentaView`: delega en tres componentes, mantiene logout con Keychain
- `ComprasView`: eliminado `selectedBannerIndex` del nivel de vista (ahora en `ComprasBannerCarousel`)
- `MainTabView`: tab Inicio usa `InicioCoordinatorView` en lugar de `NavigationStack { InicioView() }`
- `InicioView` Home inferior: reemplaza `legalDisclaimer` + `promoBannerWithCountdown` por `InicioProductBannerCarousel` + sección monedero info
- `AppState`: añade `init()` con restauración de sesión, refactoriza `applyUser(displayName:)` como helper privado

### Eliminado

- `promoBannerWithCountdown` y `countdownBox` de `InicioView` (movido a `ComprasCountdownBanner`)
- `legalDisclaimer` de `InicioView`
- `NavigationStack` wrapper directo en `ContentView` (reemplazado por coordinadores)
- Operador `+` deprecated en `Text` (reemplazado por markdown nativo `**bold**`)

---

## [0.3.0] — feat: address bar (commits fa665fa – 7e13362)

### Añadido
- Barra de dirección sticky en `InicioView` y `ComprasView` con pill oscuro y botón Delivery
- Tab bar personalizado con FAB central naranja para Compras
- Ajuste de tamaño del tab bar

---

## [0.2.0] — feat: views iniciales (commits de44dcf – 408ed5f)

### Añadido
- `InicioView`: home con tarjetas de ahorro, cupones, monedero, catálogo y promo con countdown
- `ComprasView`: búsqueda, chips de categoría, banner carousel, filas de productos
- `CuentaView`: perfil, acciones rápidas, lista de opciones y logout
- `MainTabView` con tab bar de 3 pestañas (Inicio, Compras, Cuenta)
- `HomeView` conectado al `HomeViewModel` con datos desde Mockoon
- `LoginView`, `LoginPasswordView`, `RegisterView`, `ResetPasswordView`

---

## [0.1.0] — feat: foundation (commits 3a0daad – 57221b7)

### Añadido
- Estructura Clean Architecture: Domain / Data / Presentation
- Modelos de dominio, DTOs, mappers y repositorios
- `APIClient` con URLSession, `APIEnvironment` para Mockoon y producción
- `AppState` con `@Observable` como estado global de la app
- App icon y configuración base del proyecto Xcode
- `.gitignore` y `README.md` iniciales
- JSON de configuración para Mockoon
