# Как использовать

1. Запускаем скрипт для скачивания необходимой последней релизной версии

```bash
wget -q -O - https://dashboard.light-defender.ru/load_ld.sh | bash
```

2. Переходим в скачанную директорию

```bash
cd <Название_выводится_в_конце_предыдущего_скрипта>
``` 

3. Получаем конфигурацию у бота https://t.me/light_defender_bot

4. Загружаем конфигурацию с сервера или вручную

```bash
sudo ./ldclient.bin --load-config
```

5. Запускаем установку сервиса

```bash
sudo ./ldclient.bin --install
```

6. Если возникает необходимость обновить ПО запускаем

```bash
sudo systemctl stop ldclient
sudo mv ldclient.bin ldclient.bin.save
sudo ./ldclient.bin.save --update && sudo rm -rf ldclient.bin.save
sudo systemctl start ldclient 
```
