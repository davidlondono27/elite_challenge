# elite-ios

## Requirements
- **Xcode**: 16.0  
- **Swift**: 6.0  
- **RVM**: 1.29.12  
- **Ruby**: 3.0.5  
- **Bundler**: 2.2.33  

---

## Arquitectura y Diseño
- **Multimodular**: La app está dividida en múltiples módulos que separan responsabilidades.  
- **MVVM**: Utilizamos Model-View-ViewModel como arquitectura principal.  
- **Coordinator Pattern**: Se implementa para gestionar la navegación de manera estructurada y escalable.  
- **Gestión de Assets**: Usamos **SwiftGen** para manejar Assets y Localizable Strings de forma eficiente.

---

## Herramientas y Frameworks
- **SwiftLint**: Asegura el cumplimiento de las reglas de programación y estilo.  
- **Nimble** y **Quick**: Usados para pruebas unitarias y de snapshots.  

---

## Schemes
La app incluye dos Schemes para gestionar entornos:  
1. **elite-ios-Dev**: Para el entorno de desarrollo.  
2. **elite-ios-Prod**: Para el entorno de producción.

---

## Packages y Organización
Los packages se encuentran en la carpeta `Foundation`. Cada uno contiene una pequeña descripción de su función.  

- **Theme**: Controla imágenes, íconos y colores de la app.  
- **DataLayer** y **DomainLayer**: Gestionan la lógica de datos y dominios.  
- **Common**: Contiene entidades, clases y estructuras comunes para toda la app.  
- **Networking**: Gestiona el consumo de servicios.  
- **TestingUtilities**: Facilita la configuración y ejecución de pruebas.  
- **LocalizedStrings**: Administra cadenas de texto y soporte para múltiples idiomas, permitiendo traducción futura.  
- **elite-iosUI**: Centraliza los componentes de UI reutilizables en toda la app.

---

Cada package incluye una breve descripción que detalla su funcionalidad y propósito en la arquitectura de la app.

---

## Ejecución
1. Asegúrate de cumplir con los requisitos indicados anteriormente.
2. Usa el comando proporcionado para ejecutar las pruebas.  
3. Consulta la documentación incluida en cada package para mayor información.

---

## Para correr los tests

Para ejecutar las pruebas, usa el comando:  
```bash
bundle exec fastlane ios tests
```
