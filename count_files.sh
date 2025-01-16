#!/bin/bash

dir="/etc"

file_count=$(find "$dir" -type f | wc -l)

echo "Кількість файлів у $dir: $file_count"


read -p "Натисніть будь-яку клавішу, щоб закрити..."
