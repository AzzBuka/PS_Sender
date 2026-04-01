param (
    [Parameter(Mandatory=$true)][string]$token,
    [Parameter(Mandatory=$true)][string]$chatId,
    [Parameter(Mandatory=$true)][string]$message,
    [Parameter(Mandatory=$true)][string]$proxyUrl
)

# Формируем правильный URL для API Telegram
$url = "https://api.telegram.org/bot" + $token + "/sendMessage"

# Подготовка данных (тело запроса)
$body = @{
    chat_id = $chatId
    text = $message
    parse_mode = "HTML"
} | ConvertTo-Json -Compress

try {
    # Отправка через прокси (PowerShell сам обработает строку proxyUrl)
    $response = Invoke-RestMethod -Uri $url -Method Post -Body $body -ContentType "application/json; charset=utf-8" -Proxy $proxyUrl
    
    if ($response.ok) {
        Write-Host "OK"
    }
}
catch {
    Write-Error "Ошибка: $_"
    if ($_.Exception.Response) {
        $reader = New-Object System.IO.StreamReader($_.Exception.Response.GetResponseStream())
        Write-Host "Ответ API: $($reader.ReadToEnd())" -ForegroundColor Red
    }
    exit 1
}
