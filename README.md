# PokeApp (Technical Test)

Una aplicación para explorar Pokémon usando la **PokeAPI**, construida con Flutter bajo los principios de **Clean Architecture**.

##  Arquitectura y Decisiones Técnicas

Este proyecto está organizado en 3 capas principales siguiendo Clean Architecture:

1. **Domain**: Contiene la lógica de negocio pura (`Entities`, `Repositories` interfaces, `UseCases`). No tiene dependencias externas (ni siquiera de Flutter). Esto garantiza que las reglas de negocio sean independientes y testables.
2. **Data**: Responsable de la obtención de datos (`Models`, `RemoteDataSources`, `RepositoryImpl`). 
   - **Elección de Dio**: Se eligió `dio` sobre `http` debido a su facilidad para añadir interceptores futuros, manejo de time-outs simplificado y serialización automática de JSON.
3. **Presentation**: Interfaz de usuario y manejo de estado (`Blocs`/`Cubits`, `Screens`, `Widgets`).
   - El estado es gestionado de manera reactiva mediante **Flutter BLoC**, asegurando que la UI sea determinista (reacciona a estados: Loading, Loaded, Error).
   - Se aplicó un patrón "Glassmorphism" con gradientes oscuros para adherirse estrictamente al diseño visual proveído, reutilizando componentes base (`GradientEffectForScreens`).

### Manejo de Errores Funcional
Se ha integrado el paquete `dartz` permitiendo que los repositorios devuelvan `Either<Failure, Result>`. Esto obliga a la capa de UI a manejar ambos escenarios (éxito y fallo) explícitamente en tiempo de compilación, evitando el abuso de `try-catch` y excepciones silenciosas.

### Carga de Imágenes
Se implementó `cached_network_image` para el renderizado de los "Official Artwork" de los Pokémon. Esto evita descargar la misma imagen múltiples veces y mejora dramáticamente la experiencia de scroll en el GridView.

### Inyección de Dependencias
Se usó `get_it` como **Service Locator**. Es más ligero que otras soluciones y desacopla la creación de objetos del árbol de widgets (a diferencia de Provider directo para DI), lo que facilita mockear dependencias durante el Testing.

## 🚀 Cómo correr el proyecto

1. Clona este repositorio:
   ```bash
   git clone https://github.com/jesusfreelance99-cell/technical-test.git
   ```
2. Instala las dependencias:
   ```bash
   flutter pub get
   ```
3. Ejecuta la aplicación:
   ```bash
   flutter run
   ```

##  Testing

Se utilizaron prácticas de TDD moderadas, enfocadas en las capas críticas (Domain y Data). Se integró `mocktail` para generar simulaciones (Mocks) robustas.
Para correr las pruebas unitarias:
```bash
flutter test
```
