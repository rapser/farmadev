# farmedev

Aplicación **iOS** para farmacia, construida con **SwiftUI**, **Clean Architecture + MVVM + Coordinator**, reactividad con el framework **Observation** (`@Observable`), y networking con **Alamofire** contra un backend real (**NestJS + PostgreSQL/Neon**, repo hermano [`farma-dev-api`](../Backend/farma-dev-api)).

---

## Plataforma y stack

| Elemento | Detalle |
|---|---|
| Plataforma | iOS 26.0+ |
| Framework UI | SwiftUI, reactividad con `Observation` (`@Observable`) |
| Lenguaje | Swift 5, 100% async/await |
| Networking | Alamofire (`Core/Networking`) |
| Persistencia | Keychain (sesión/tokens), SwiftData (carrito de invitado) |
| Mapas | Google Maps SDK for iOS (selector de dirección en Checkout) |
| Backend | NestJS + TypeORM + PostgreSQL (Neon), ver `farma-dev-api/README.md` |

---

## Esquemas: QA vs Prod

El proyecto tiene dos esquemas además del original `farmedev`:

| Esquema | Configuración | `API_BASE_URL` |
|---|---|---|
| **farmedev-QA** | Debug-QA / Release-QA | `http://localhost:3000/api/v1` (backend local, `nest start --watch`) |
| **farmedev-Prod** | Debug-Prod / Release-Prod | URL de Render desplegada (`Config/Prod.xcconfig`) |

Los valores viven en `Config/QA.xcconfig` y `Config/Prod.xcconfig`, inyectados a `Info.plist` (`API_BASE_URL`, `GOOGLE_MAPS_API_KEY`). Detalles paso a paso: `~/Downloads/farmedev-documentacion/IOS_SCHEMES_SETUP.md`.

Para probar en dispositivo físico contra el backend local, reemplaza `localhost` por la IP LAN de tu Mac en `Config/QA.xcconfig`.

---

## Arquitectura: módulos (monolito hoy, listos para SPM privado a futuro)

Todo el código nuevo (todo excepto el pipeline legacy de ~90 entidades bajo `Domain/`/`Data/`/`Presentation/` en la raíz, que se deja intacto y sin usar) sigue una estructura por módulo pensada para poder extraerse a paquetes SPM privados más adelante sin reescribir nada — ver el detalle de la regla de dependencias en `~/Downloads/farmedev-documentacion/PLAN.md` sección 2.1.

```
farmedev/
├── App/                    Composition root: farmedevApp, AppState, ContentView, MainTabView
├── Core/                   Sin dependencias de features — networking, sesión, feature flags, utilidades
│   ├── Networking/         APIClient (Alamofire), APIEnvironment, AuthTokenInterceptor, APIClientFactory
│   ├── Session/            SessionStore (Keychain), KeychainService
│   ├── FeatureFlags/       FeatureFlagsStore, FeatureFlagsService
│   └── Shared/             Paginated<T>, CurrencyFormatting
├── Modules/
│   ├── Auth/               Login, registro, reset de contraseña — JWT access+refresh
│   ├── Catalog/             Inicio, Compras, detalle y grilla de producto
│   ├── Cart/                Carrito — SwiftData para invitados, API para autenticados
│   ├── Checkout/            Selector de dirección (Google Maps), método de pago, resumen
│   ├── Orders/               Historial y detalle de pedidos
│   └── Account/              Cuenta, perfil, favoritos
└── Config/                  QA.xcconfig, Prod.xcconfig
```

Cada módulo sigue `Domain/ Data/ Presentation/ Public/` internamente. Un módulo solo puede importar el `Public/` de otro módulo (nunca su `Domain`/`Data`/`Presentation` directamente) — así se mantiene bajo acoplamiento entre features. `Domain`/`Data` son agnósticos de comercio (conceptos genéricos de e-commerce); `Presentation` es lo único específico de farmedev.

---

## Modo invitado (browse-as-guest)

La app **no** exige login para navegar: Inicio, Compras, detalle de producto y agregar al carrito funcionan sin cuenta (carrito guardado localmente con **SwiftData**). Solo se pide iniciar sesión de forma contextual (`AppState.requireAuth`) al:
- Marcar un producto como favorito
- Proceder al pago (checkout)
- Abrir el tab Cuenta

Al iniciar sesión, el carrito local de invitado se fusiona automáticamente con el carrito del servidor (`MergeGuestCartUseCase`).

---

## Autenticación

JWT con access token de vida corta (15 min) + refresh token rotativo (30 días). `Core/Networking/AuthTokenInterceptor` intercepta cualquier `401`, refresca el token una sola vez (single-flight) y reintenta la petición original — las pantallas nunca manejan expiración de tokens manualmente. Si el refresh falla, se fuerza logout y se limpia todo lo guardado en Keychain (`SessionStore.clear()`).

---

## Configuración de entorno

1. Levanta el backend local (`farma-dev-api`): `npm run start:dev` (puerto 3000).
2. Compila/corre con el esquema **farmedev-QA** — apunta a `localhost:3000` automáticamente.
3. Para Google Maps (selector de dirección en Checkout), añade tu API key en `Config/QA.xcconfig` y `Config/Prod.xcconfig` (`GOOGLE_MAPS_API_KEY`). Ver `~/Downloads/farmedev-documentacion/GOOGLE_MAPS_SETUP.md`.
4. Para producción, usa el esquema **farmedev-Prod**, con `Config/Prod.xcconfig` apuntando a la URL de Render.

---

## Convenciones del proyecto

- `@Observable` (Observation framework) en toda la capa Presentation — nunca `ObservableObject`/Combine.
- `Domain`/`Data` son Swift puro, sin imports de SwiftUI/Observation/SwiftData (excepto el propio `Data` de Cart, que encapsula SwiftData como detalle de implementación detrás del mismo protocolo `CartRepository`).
- Coordinadores manejan toda la navegación; las vistas no se conocen entre sí.
- Keychain para tokens/sesión; nunca `UserDefaults` para credenciales.
- Ningún archivo de vista debería crecer sin límite — cada pantalla delega en `Components/`.
