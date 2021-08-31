# MyTVShows

Arquitectura usada: MVC
Razón: El proyecto es chico pero con potencial de crecimiento, las pantallas son simples y no requieren de operaciones complejas,
      por lo tanto el modelo MVC es una buena opción ya que tiene las funcionalidades (Model, Vista, Controlador) separadas y en donde deben estar.

Librerías externas: Ninguna

Mejoras en el código:
  - El manejo de los títulos en las vistas principales (Shows y Favoritos).
  - Mejorar el caché de las imágenes obtenidas del servicio.
  - Implementación del patrón de diseño "Coordinators" para el flujo de las pantallas.

Problemas durante el desarrollo:
  - La navigationBar no se pintaba completamente del color seleccionado en iPhones con Notch (iPhone X, Xs, 11, 12, etc.).
    El problema se solucionó agregando configuraciones extra condicionado a que el dispositivo corriera iOS 13 en adelante.
  - Algunos de los constraints no servían en versiones anteriores a iOS 11.
    El problema se solucionó cambiando las constraints dependiendo si tenían iOS 11 o superior, o si eran versiones mas antiguas.
