#!/bin/bash
# Script de copia de seguridad para servidor doméstico
# Autor: yumi1
# Fecha: Septiembre 2026

FECHA=$(date +%Y-%m-%d_%H-%M-%S)
BACKUP_DIR="/mnt/orico/backups"

echo "🔄 Iniciando copia de seguridad: $FECHA"

# 1. BACKUP DE NEXTCLOUD (archivos)
echo "📁 Copiando archivos de Nextcloud..."
rsync -av --delete /var/snap/nextcloud/common/nextcloud/data/ "$BACKUP_DIR/nextcloud/$FECHA/" > /dev/null 2>&1

# 2. BACKUP DE BASES DE DATOS
echo "🗄️ Copiando bases de datos..."

# MariaDB
docker exec mariadb sh -c 'exec mysqldump --all-databases -u root -p"$MYSQL_ROOT_PASSWORD"' > "$BACKUP_DIR/bbdd/mariadb_$FECHA.sql" 2>/dev/null
if [ $? -eq 0 ]; then
    echo "   ✅ MariaDB copiada"
else
    echo "   ❌ Error en MariaDB"
    enviar_alerta "❌ Error en backup de MariaDB" "El backup de MariaDB ha fallado el $FECHA. Revisa el servidor."
fi

# PostgreSQL
docker exec postgres sh -c 'exec pg_dumpall -U postgres' > "$BACKUP_DIR/bbdd/postgres_$FECHA.sql" 2>/dev/null
if [ $? -eq 0 ]; then
    echo "   ✅ PostgreSQL copiada"
else
    echo "   ❌ Error en PostgreSQL"
    enviar_alerta "❌ Error en backup de PostgreSQL" "El backup de PostgreSQL ha fallado el $FECHA. Revisa el servidor."
fi

# 3. BACKUP DE DOCKER (configuración)
echo "🐳 Copiando configuración de Docker..."
docker ps -a --format '{{.Names}}' > "$BACKUP_DIR/docker/contenedores_$FECHA.txt"
docker images --format '{{.Repository}}:{{.Tag}}' > "$BACKUP_DIR/docker/imagenes_$FECHA.txt"

# 4. BACKUP DEL SISTEMA (configuración)
echo "⚙️ Copiando configuración del sistema..."
tar -czf "$BACKUP_DIR/sistema/etc_$FECHA.tar.gz" /etc 2>/dev/null

# 5. LIMPIAR BACKUPS ANTIGUOS (más de 30 días)
echo "🧹 Limpiando backups antiguos..."
find "$BACKUP_DIR/bbdd" -name "*.sql" -mtime +30 -delete
find "$BACKUP_DIR/nextcloud" -type d -mtime +30 -exec rm -rf {} \; 2>/dev/null
find "$BACKUP_DIR/docker" -name "*.txt" -mtime +30 -delete
find "$BACKUP_DIR/sistema" -name "*.tar.gz" -mtime +30 -delete

# 6. Función para enviar alertas por email
enviar_alerta() {
    local asunto="$1"
    local mensaje="$2"
    echo "$mensaje" | mail -s "$asunto" jaumellastarry@gmail.com
}

# Alerta de éxito (opcional)
#enviar_alerta "✅ Backup completado" "El backup se completó correctamente el $FECHA"

echo "✅ Copia de seguridad completada: $FECHA"
