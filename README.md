# Инструкция и порт в линукс beeshield лаунчера
Вообщем меня пригласили на этот сервер, а лаунчер отказался запускаться. 
Слава богу меня не посчитали читером, поэтому я аккуратно пакетировал .jar файл в Nix. Пакет предоставляет доступ всем нужным библиотекам.

## Каким библиотекам?
- libpulseaudio
- libXxf86vm
- libGL
- libX11
- libXcursor
- libXext
- libXrandr
- libjack2
- libusb1
- xrandr

# У меня нету пакетного менеджера Nix
Чтобы запустить лаунчер на Debian я подготовил one-line установщик зависимостей.
```bash
sudo apt-get install openjdk-8-jre pulseaudio libxxf86vm-dev libgl-dev libx11-6 libxcursor-dev libxext-dev libxrandr-dev libjack-dev libhidapi-libusb0
```

## Команда для запуска
```bash
cd path/to/bslauncher.jar
java -jar bslauncher.jar
```