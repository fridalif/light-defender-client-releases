# Как использовать

1. Скачиваем подходящую версию (для большиснтва сервером подходит amd64) далее в примерах будет рассмотрена версия v1.0.0 под amd64;

```bash
wget https://github.com/fridalif/light-defender-client-releases/releases/download/v1.0.0/ldclient_amd64_v1.0.0.zip
```

2. Разархивируем саачанный файл

```bash
unzip ldclient_amd64_v1.0.0.zip
cd ldclient_amd64_v1.0.0
```

3. Получаем конфигурацию у бота https://t.me/light_defender_bot

4. Заменяем конфигурацию-заглушку config.bin в папке etc на выданную ботом

5. Запускаем установку сервиса

```bash
sudo ./ldclient.bin --install
```

6. Если возникае необходимость обновить ПО запускаем

```bash
sudo ./ldclient.bin --update --version Новая_Версия --arch Архитектура
```
