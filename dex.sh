#!/bin/bash
ORIGEN="$(dirname "$(realpath "$0")")"
DESTINO="$ORIGEN"

find "$ORIGEN" -name "*.flac" | while IFS= read -r archivo; do
    artista=$(metaflac --show-tag=ARTIST "$archivo" | cut -d'=' -f2-)
    album=$(metaflac --show-tag=ALBUM "$archivo" | cut -d'=' -f2-)
    track_raw=$(metaflac --show-tag=TRACKNUMBER "$archivo" | cut -d'=' -f2-)
    track=$(echo "$track_raw" | cut -d'/' -f1 | tr -d '[:space:]')
    track=$(printf "%02d" "$track")
    titulo=$(metaflac --show-tag=TITLE "$archivo" | cut -d'=' -f2-)

    carpeta="$DESTINO/$artista/$album"
    mkdir -p "$carpeta"

    destino_archivo="$carpeta/${track} - ${titulo}.flac"
    mv "$archivo" "$destino_archivo" && echo "✓ $artista / $album / $track - $titulo" || echo "✗ ERROR: $archivo"
    cp "$(dirname "$archivo")/cover.jpg" "$carpeta/" 2>/dev/null
done
