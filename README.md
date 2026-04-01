# PRTG Telegram Proxy Notification

Скрипт на PowerShell для отправки уведомлений из командной строки PS в Telegram через HTTP-прокси. Позволяет избежать использования глобальных настроек прокси в приложениях.

## Установка

1. Скопируйте файл `PS_Sender.ps1` в рабочую директорию вашего приложения или прописываете пути:
   ```На пример PRTG
   `C:\Program Files (x86)\PRTG Network Monitor\Notifications\EXE`

2. Разрешите выполнение скриптов в PowerShell (от имени администратора):
   ```powershell
   Set-ExecutionPolicy RemoteSigned -Force

3. Скрипт исполняется с ключами командной строки:
   ```На пример
   PS_Sender.ps1 -token "ВАШ_ТОКЕН" -chatId "ВАШ_ID" -message "<b>%name</b>%nСтатус: %status%nЗначение: %lastvalue" -proxyUrl "http://ВАШ_IP:ПОРТ"

   Ключ	Описание	Пример значения
    -token	Уникальный API-ключ вашего бота. Выдается ботом @BotFather.	"1111111111:Ab...jv"
    -chatId	ID чата, куда придут уведомления. Для групп всегда начинается с -.	"123456789" или "-987654321"
    -message	Текст сообщения. Здесь используются переменные или простой текст.	"<b>%name</b>%nСтатус: %status" или "Send OK"
    -proxyUrl	Полный адрес вашего HTTP или SOCKS5 прокси-сервера.	"http://172.16.1.1:8998"

 4. Требования
    PowerShell 5.1 или выше.
    HTTP/SOCKS5 прокси (MTProxy не поддерживается).
    
