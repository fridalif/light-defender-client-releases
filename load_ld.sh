!/bin/bash

if command -v unzip >/dev/null 2>&1; then
    #echo "unzip уже установлен."
else
    echo "unzip НЕ установлен. Пожалуйста, установите его."
    echo "Для Ubuntu/Debian: sudo apt update && sudo apt install unzip"
    echo "Для CentOS/RHEL/Fedora: sudo yum install unzip  или  sudo dnf install unzip"
    echo "Для Arch: sudo pacman -S unzip"
    exit 1
fi

detect_architecture() {
    local arch=$(uname -m)
    
    case $arch in
        x86_64|x64)     echo "amd64" ;;
        i386|i686)      echo "i386" ;;
        armv7l|armhf)   echo "arm32" ;;
        aarch64|arm64)  echo "arm64" ;;
        *)              echo "unknown" ;;
    esac
}


ARCH=$(detect_architecture)
LAST_VERSION=$(wget -q -O - https://dashboard.light-defender.ru/version.txt)
if [[ $ARCH == "unknown" ]]; then
  echo "Неизвестная архитектура."
  read -p "Введите архитектуру вручную (доступные: amd64, i386, arm32, arm64): " ARCH
fi
if [[ $ARCH != "amd64" && $ARCH != "i386" && $ARCH != "arm64" && $ARCH != "arm32" ]]; then
  echo "Неизвестная архитектура!"
  exit 1
fi

wget "https://github.com/fridalif/light-defender-client-releases/releases/download/$(echo $LAST_VERSION)/ldclient_$(echo $ARCH)_$(echo $LAST_VERSION).zip"
unzip "ldclient_$(echo $ARCH)_$(echo $LAST_VERSION).zip"
cd "ldclient_$(echo $ARCH)_$(echo $LAST_VERSION)"

echo "Скачивание успешно завершено!"
echo "Далее скачайте конфигурацию (sudo ./ldclient.bin --load-config)"

exit 0
