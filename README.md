# dex.sh — Organizador de música FLAC para Plex

Script que organiza archivos FLAC sueltos en la estructura de carpetas que Plex requiere, leyendo los metadatos internos de cada archivo.

**Resultado:**
```
/home/music/
  └── Artista/
        └── Álbum/
              ├── 01 - Canción.flac
              └── cover.jpg
```

---

## Requisitos

### Instalar flac (metaflac)

```bash
sudo apt update
sudo apt install flac
```

Verificar instalación:
```bash
metaflac --version
```

---

## Instalación del script

Copiar `dex.sh` a `/home/music/` y darle permisos de ejecución:

```bash
chmod +x /home/music/dex.sh
```

---

## Uso

Desde cualquier directorio:

```bash
/home/music/dex.sh
```

O configurando un alias para correrlo con un solo comando.

---

## Alias (opcional)

Agregar el alias al final de `~/.bashrc`:

```bash
echo "alias musica='/home/music/dex.sh'" >> ~/.bashrc
```

Recargar la configuración:

```bash
source ~/.bashrc
```

Desde ese momento se puede correr desde cualquier parte de la terminal con:

```bash
musica
```

---

## Notas

- El script organiza únicamente archivos `.flac`.
- Si existe un `cover.jpg` en la misma carpeta del archivo, lo copia automáticamente al álbum.
- Los metadatos del archivo (artista, álbum, track, título) deben estar correctamente etiquetados para que el resultado sea correcto.
