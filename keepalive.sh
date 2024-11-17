#!/bin/bash
pid=$(lsof -i :7877 | awk 'NR==2 {print $2}')
#Revisar si la búsqueda del proceso está vacía.
if [ -z "$pid" ]; then
  #Si está vacía entonces:
  timestamp1=$(date +"%d-%m-%Y %H:%M:%S")
  echo "$timestamp1 - ATENCIÓN: No se encontró ningún proceso escuchando en el puerto 7877. Reactivando aplicación."
  #Reiniciando proceso
  cd
  cd code/ocean-devo-astroblend/
  source venv/bin/activate
  python app.py &
  nuevo_proceso=$(pgrep -f "python app.py")
  timestamp2=$(date +"%d-%m-%Y %H:%M:%S")
  echo "$timestamp2 - READY: Proceso reiniciado con id $nuevo_proceso. "
else
  timestamp3=$(date +"%d-%m-%Y %H:%M:%S")
  echo "$timestamp3 - ALIVE: Astroblend PROD, proceso $pid arriba y funcionando."
fi