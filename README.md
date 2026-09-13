# 🖥️ Servidor Doméstico Multifunción

Portafolio del servidor doméstico basado en **Ubuntu Server**, con servicios profesionales de nube privada, NAS, desarrollo remoto y backup automático.

![Ubuntu](https://img.shields.io/badge/Ubuntu-26.04.1_LTS-E95420?style=flat&logo=ubuntu&logoColor=white)
![Docker](https://img.shields.io/badge/Docker-28.x-2496ED?style=flat&logo=docker&logoColor=white)
![Nextcloud](https://img.shields.io/badge/Nextcloud-34.0.3-0082C9?style=flat&logo=nextcloud&logoColor=white)
![PostgreSQL](https://img.shields.io/badge/PostgreSQL-15-4169E1?style=flat&logo=postgresql&logoColor=white)
![MariaDB](https://img.shields.io/badge/MariaDB-10.6-003545?style=flat&logo=mariadb&logoColor=white)

---

## 🚀 Servicios implementados

| Servicio | Acceso | Función |
|----------|--------|---------|
| ☁️ **Nextcloud** | `https://192.168.1.10` | Nube privada con HTTPS |
| 💾 **Samba** | `smb://192.168.1.10/Orico` | NAS en red local |
| 🖥️ **Cockpit** | `http://192.168.1.10:9091` | Panel de administración |
| 🐳 **Docker Manager** | (desde Cockpit) | Gestión de contenedores |
| 💻 **Code-Server** | `http://192.168.1.10:8443` | VS Code en navegador |
| 🗄️ **MariaDB** | Puerto `3306` | Base de datos MySQL |
| 🗄️ **PostgreSQL** | Puerto `5432` | Base de datos relacional |
| 🔐 **SSH** | `ssh yumi1@192.168.1.10` | Administración remota |

---

## 📄 Documentación

- 📘 [Portafolio completo (PDF)](./PORTAFOLIO%20SERVIDOR.pdf)
- 📝 [Script de backup](./backup.sh)
> 📧 Si necesitas la versión editable (DOCX) del portafolio, puedes solicitarla por email.
> 
---

## 📝 Autor

**Jaime Llastarry Jansana**
📅 Septiembre 2026
📧 jaumellastarry@gmail.com

---

> *"El conocimiento es poder, pero compartirlo es construir futuro."*

---

## 📜 Licencia

Este proyecto está bajo la licencia **Creative Commons BY-NC-ND 4.0**. Consulta el archivo [LICENSE](./LICENSE) para más detalles.
