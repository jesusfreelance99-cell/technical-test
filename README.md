# PokeApp (Technical Test)

Una aplicación móvil para explorar el mundo Pokémon construida con Flutter, enfocada en buenas prácticas, escalabilidad y una experiencia de usuario (UX/UI) dinámica y moderna.

##  API Utilizada
La aplicación consume los datos de la **[PokeAPI](https://pokeapi.co/)**, una API RESTful pública y gratuita. Se extraen listados paginados de Pokémon, así como la información detallada (imágenes oficiales, estadísticas base, altura, peso y tipos) de cada criatura de manera asíncrona.

##  Arquitectura Implementada
El proyecto está estructurado bajo los principios de **Clean Architecture** para asegurar que el código sea testeable, mantenible e independiente de frameworks:

1. **Domain Layer**: Contiene la lógica pura de la aplicación (`Entities`, contratos de `Repositories`, `UseCases`). No depende de Flutter ni de paquetes externos.
2. **Data Layer**: Maneja la obtención y transformación de los datos desde la PokeAPI (`Models`, `RemoteDataSources`, implementaciones del `Repository`).
3. **Presentation Layer**: Gestiona la interfaz gráfica y el estado de manera reactiva usando **Flutter BLoC** (Business Logic Component). El BLoC separa la lógica de presentación de la UI asegurando respuestas deterministas a eventos (Loading, Loaded, Error).

##  Decisiones Técnicas Relevantes

* **Gestión de Estado (BLoC)**: Permite abstraer la lógica compleja (búsqueda y paginación infinita) manteniendo la UI reactiva.
* **Componentes visuales estrictos**: Se creó un sistema de diseño centralizado. Los textos se rigen estrictamente por un `textStyle` de configuración global escalable y se implementó la clase estática `ColorPaletteTheme` para evitar por completo variables de diseño "hardcodeadas". Además se personalizó la topografía con la tipografía retro *Press Start 2P* vía `google_fonts`.
* **Manejo de Errores Pragmático (`dartz`)**: Uso de programación funcional `Either<Failure, Result>` para asegurar que la UI controle explícitamente tanto el renderizado de fallos como los flujos exitosos sin crasheos.
* **Inyección de Dependencias (`get_it`)**: Se estableció un Service Locator para abstraer la provisión de casos de uso y repositorios, haciendo el código inyectable y fácil de testear.
* **Red y Cliente HTTP (`dio`)**: Seleccionado sobre la librería nativa `http` gracias a su facilidad para la intercepción, validación de certificados y parsing automático.
* **Iconografía Estándar**: Uso de `fluentui_system_icons` (variante filled) para una interfaz limpia, profesional e intuitiva.
* **Optimización en memoria**: Lazily renders y caché usando `cached_network_image` para el artwork y grillas paginadas eficientes que mejoran los cuadros por segundo (FPS).

##  Instrucciones para ejecutar el proyecto

Sigue estos pasos para compilar y ejecutar el proyecto en tu máquina local:

1. **Clona este repositorio**:
   ```bash
   git clone https://github.com/jesusfreelance99-cell/technical-test.git
   ```
2. **Posiciónate en la carpeta del proyecto**:
   ```bash
   cd pokemonapp
   ```
3. **Descarga e instala las dependencias**:
   ```bash
   flutter pub get
   ```
4. **Ejecuta la aplicación** (Asegúrate de tener un emulador abierto o dispositivo físico conectado):
   ```bash
   flutter run
   ```

##  Testing
Se integró `mocktail` y se incluyeron pruebas unitarias para aislar el comportamiento de los DataSources, Models y los BLoCs usando acercamientos TDD (Test-Driven Development). Para ejecutar la suite de pruebas:
```bash
flutter test
```
