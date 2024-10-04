#!/bin/bash

# Verificar si `imagemagick` está instalado, ya que se usa el comando `convert`
if ! command -v convert &> /dev/null; then
    echo "ImageMagick no está instalado. Instálalo con 'pkg install imagemagick' en Termux o 'sudo apt install imagemagick' en Linux."
    exit 1
fi

# Iterar sobre todos los archivos .webp en el directorio actual
for img in *.webp; do
    if [[ -f "$img" ]]; then
        # Obtener el nombre del archivo sin la extensión
        filename="${img%.webp}"
        # Convertir .webp a .jpg
        convert "$img" "$filename.jpg"
        echo "Convertido: $img -> $filename.jpg"
    else
        echo "No se encontraron archivos .webp en el directorio actual."
        exit 1
    fi
done

echo "Conversión completada."
