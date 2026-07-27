# Changelog

Todos los cambios relevantes del proyecto se documentan aquí.
El formato sigue [Keep a Changelog](https://keepachangelog.com/es/1.0.0/).

---

## [Unreleased] — integración con backend real (farma-dev-api)

### Añadido

- **Arquitectura modular** (`Core/` + `Modules/Auth|Catalog|Cart|Checkout|Orders|Account/`), pensada para poder extraer cada módulo a un paquete SPM privado más adelante — ver `~/Downloads/farmedev-documentacion/PLAN.md`.
- **Networking real con Alamofire**: `Core/Networking/APIClient.swift` reemplaza el cliente URLSession original manteniendo el mismo `APIClientProtocol`; `AuthTokenInterceptor` adjunta el token en cada request y refresca automáticamente en un `401` (single-flight, un solo reintento).
- **Esquemas QA/Prod**: `farmedev-QA` (backend local) y `farmedev-Prod` (Render), con `Config/QA.xcconfig` / `Config/Prod.xcconfig` inyectando `API_BASE_URL` y `GOOGLE_MAPS_API_KEY` a un `Info.plist` explícito (reemplaza el auto-generado).
- **Autenticación real** (`Modules/Auth`): login, registro (ahora pide nombres/apellidos), reset de contraseña, todo contra JWT access+refresh del backend. `AppState` pasa a ser async y expone `authErrorMessage`.
- **Modo invitado**: la app ya no bloquea la navegación detrás del login — `AppState.requireAuth(action:)` pide sesión solo al pagar, marcar favorito, o abrir Cuenta. `ContentView` deja de gatear `MainTabView`.
- **Carrito con SwiftData para invitados** (`Modules/Cart`): `CartLocalDataStore` (SwiftData) para invitados, `CartCloudDataStore` para autenticados, mismo protocolo `CartRepository`; `MergeGuestCartUseCase` fusiona el carrito local al iniciar sesión.
- **Catálogo real** (`Modules/Catalog`): Inicio y Compras dejan de mostrar datos hardcodeados — categorías, banners y productos vienen de `GET /categories|/banners|/products*`. Nuevas pantallas `ProductDetailView` y `ProductGridView` (paginado con "Cargar más").
- **Checkout completo** (`Modules/Checkout`): selector de dirección con **Google Maps** (pin central + geocoding inverso con `CLGeocoder`), método de pago (efectivo/tarjeta), resumen y confirmación de pedido.
- **Historial de pedidos y cuenta real** (`Modules/Orders`, `Modules/Account`): `OrderHistoryView`, `OrderDetailView`, `ProfileEditView`, `FavoritesView`, nuevo `AccountCoordinator`. `CuentaView` muestra un prompt de login para invitados en vez de datos falsos.
- **Feature flags remotos** (`Core/FeatureFlags`): la app consulta `GET /feature-flags` al iniciar; permite apagar checkout/favoritos/una campaña sin nuevo build.
- **Logout robusto**: `SessionStore.clear()` enumera explícitamente cada clave que guarda (tokens, perfil cacheado) para que el logout nunca deje credenciales huérfanas en Keychain; también limpia el carrito local de invitado.

### Modificado

- `AppState`: login/register/logout ahora son `async`, respaldados por `Modules/Auth`'s `AppAuthUseCase` en vez de lógica local falsa.
- `RegisterView`/`RegisterFormFields`: agregan campos de nombres/apellidos (antes solo pedían correo/contraseña).
- `ComprasView`, `InicioView`, `CarritoView`, `CuentaView`: reescritos para consumir ViewModels reales en vez de arrays estáticos.
- `MainTabView`: los 3 tabs ahora usan coordinadores propios (`InicioCoordinatorView`, `ComprasCoordinatorView`, `AccountCoordinatorView`).

### Fuera de alcance (documentado)

Cupones, puntos/fidelización, referidos, "Monedero del Ahorro", login social real, pasarela de pago real, envío de emails transaccionales — ver `~/Downloads/farmedev-documentacion/PLAN.md` sección 2.10.

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
