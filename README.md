# The-Hunter-Termux-Version

![Python](https://img.shields.io/badge/Python-3.10+-blue?style=for-the-badge&logo=python)
![Termux](https://img.shields.io/badge/Termux-Supported-green?style=for-the-badge&logo=termux)
![License](https://img.shields.io/badge/License-Educational_Use-red?style=for-the-badge)

<p align="center">
  <img src="assets/banner.jpeg" width="300" title="Descripción">
</p>


Antes de empezar con la presentación de este framework, cabe recalcar que **esta herramienta está creada con fines educativos y su uso a un tercero sin consentimiento es ilegal, el creador del repositorio no se hace cargo de problemas legales con el uso indebido del framework.**


**The-Hunter-Termux-Version**es una readaptación del framework original [The-Hunter](https://github.com/elpajuelobot/The-Hunter.git) pero esta vez adaptado para su funcionamiento en Termux, es decir, Android. Para los que no
sepan todavía que es **The-Hunter**, es un framework de simulación de vectores de ataque de ingeniería social. Está creado con el fin de ayudar a los trabajadores de ciberseguridad y los administradores de sistemas a enseñar el funcionamiento de estas webs fraudulentas
y entrenar así a los demás en la detección de URLs maliciosas.


# Funcionamiento

Para el uso de esta herramienta, ha de seguir los siguientes pasos:


```bash

# Clonar el repositorio

git clone https://github.com/elpajuelobot/The-Hunter-Termux-Version.git


# Entrar al directorio

cd The-Hunter-Termux-Version


# Dar permisos y ejecutar el instalador

chmod +x install.sh

./install.sh

```

## Para los que quieran ir más rápido

```bash
pkg install git -y && git clone https://github.com/tu-usuario/The-Hunter-Termux-Version.git && cd The-Hunter-Termux-Version && chmod +x install.sh && ./install.sh
```

### Funcionamiento del `install.sh`:
  * **Desencriptar:** Extrae el contenido de `data.assets` (Contraseña: `password123`).
  * **Preparación:** Configura el entorno virtual y dependencias.
  * **Ejecución:** Lanza automáticamente `init.sh`. Para usos futuros, ejecutar directamente: `./init.sh`.


Antes de ejecutar el `install.sh`:


<p align="center">
  <img src="assets/before-install.jpeg" width="300" title="Descripción">
</p>


Después de ejecutar el `install.sh`:


<p align="center">
  <img src="assets/after-install.jpeg" width="300" title="Descripción">
</p>


# Notificaciones

Este framework cuenta con un sistema de notificaciones conectado con discord, usando las urls *Discord Webhooks*, recibirás una alerta en tiempo real cuando se incie un túnel enviándote la url o cuando se capture una interacción del laboratorio.


# Requisitos

*Python 3.10* o superior

*Android 7* o superior (Android 10 en adelante recomendado)

*Conexión a internet* para la creación y funcionamiento del túnel. 

*Seguir y ver a S4vitar* **OBLIGATORIO**

### IMPORTANTE

**No instaleis** Termux desde la Play Store, es una versión obsoleta que lleva sin recibir actualizaciones desde 2020 en Android 10 *(estamos en marzo de 2026 con Android 16)*.

**Instalar** Termux desde [F-Droid](https://f-droid.org/en/packages/com.termux/)
