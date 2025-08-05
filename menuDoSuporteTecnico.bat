@echo off
title Menu de Suporte Técnico
color 0A
chcp 65001 >nul

:MAIN_MENU
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                         MENU DE SUPORTE TÉCNICO                      ║
echo ╠════════════════════════════════════════════════════════════════════╣
echo ║                                                                    ║
echo ║  [1] Sistema                                                       ║
echo ║  [2] Rede                                                          ║
echo ║  [3] Impressoras                                                   ║
echo ║  [4] Limpeza                                                       ║
echo ║  [5] Utilitários                                                   ║
echo ║  [6] Domínio                                                       ║
echo ║  [0] Sair                                                          ║
echo ║                                                                    ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
set /p opcao=Digite sua opção: 

if "%opcao%"=="1" goto SISTEMA
if "%opcao%"=="2" goto REDE
if "%opcao%"=="3" goto IMPRESSORAS
if "%opcao%"=="4" goto LIMPEZA
if "%opcao%"=="5" goto UTILITARIOS
if "%opcao%"=="6" goto DOMINIO
if "%opcao%"=="0" goto SAIR
goto MAIN_MENU

:REDE
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                               MENU REDE                              ║
echo ╠════════════════════════════════════════════════════════════════════╣
echo ║                                                                    ║
echo ║  [1] Diagnóstico de Rede                                           ║
echo ║  [2] Resetar Configurações TCP/IP                                  ║
echo ║  [3] Flush DNS                                                     ║
echo ║  [4] Teste de Conectividade                                        ║
echo ║  [5] Informações de Rede                                           ║
echo ║  [6] Verificar Interfaces de Rede Ativas e Velocidade              ║
echo ║  [0] Voltar ao Menu Principal                                      ║
echo ║                                                                    ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
set /p rede_opcao=Digite sua opção: 

if "%rede_opcao%"=="1" goto DIAGNOSTICO_REDE
if "%rede_opcao%"=="2" goto RESET_TCPIP
if "%rede_opcao%"=="3" goto FLUSH_DNS
if "%rede_opcao%"=="4" goto TESTE_CONECTIVIDADE
if "%rede_opcao%"=="5" goto INFO_REDE
if "%rede_opcao%"=="6" goto VERIFICAR_INTERFACES
if "%rede_opcao%"=="0" goto MAIN_MENU
goto REDE

:VERIFICAR_INTERFACES
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║               VERIFICANDO INTERFACES DE REDE ATIVAS                ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
echo Aguarde, coletando informações das interfaces de rede...
echo.

:: Executa o comando PowerShell para verificar interfaces ativas e velocidade
powershell.exe -Command "Get-CimInstance -ClassName Win32_NetworkAdapter | Where-Object { $_.NetEnabled -eq $true } | Select-Object Name, @{Name = 'Speed(Mbps)'; Expression = { $_.Speed / 1e6 }} | Format-Table -AutoSize"

echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                       VERIFICAÇÃO CONCLUÍDA                        ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
pause
goto REDE

:DIAGNOSTICO_REDE
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                         DIAGNÓSTICO DE REDE                        ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
echo Executando diagnóstico de rede...
netsh wlan show profiles
ipconfig /all
echo.
pause
goto REDE

:RESET_TCPIP
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                   RESETANDO CONFIGURAÇÕES TCP/IP                   ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
echo Resetando configurações de rede...
netsh int ip reset
netsh winsock reset
echo.
echo Configurações resetadas. Reinicie o computador para aplicar as mudanças.
pause
goto REDE

:FLUSH_DNS
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                           LIMPANDO CACHE DNS                         ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
echo Limpando cache DNS...
ipconfig /flushdns
echo.
echo Cache DNS limpo com sucesso!
pause
goto REDE

:TESTE_CONECTIVIDADE
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                       TESTE DE CONECTIVIDADE                       ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
echo Testando conectividade...
ping google.com
ping 8.8.8.8
echo.
pause
goto REDE

:INFO_REDE
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                         INFORMAÇÕES DE REDE                        ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
echo Coletando informações de rede...
ipconfig /all
echo.
echo ═══════════════════════════════════════════════════════════════════
echo Informações de adaptadores de rede:
echo.
powershell.exe -Command "Get-NetAdapter | Select-Object Name, InterfaceDescription, LinkSpeed, Status | Format-Table -AutoSize"
echo.
pause
goto REDE

:SISTEMA
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                              MENU SISTEMA                            ║
echo ╠════════════════════════════════════════════════════════════════════╣
echo ║                                                                    ║
echo ║  [1] Informações do Sistema                                        ║
echo ║  [2] Verificar Integridade dos Arquivos (SFC)                      ║
echo ║  [3] Verificar Disco (CHKDSK)                                      ║
echo ║  [4] Informações de Hardware                                       ║
echo ║  [5] Gerenciador de Tarefas                                        ║
echo ║  [6] Serviços do Windows                                           ║
echo ║  [0] Voltar ao Menu Principal                                      ║
echo ║                                                                    ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
set /p sistema_opcao=Digite sua opção: 

if "%sistema_opcao%"=="1" goto INFO_SISTEMA
if "%sistema_opcao%"=="2" goto SFC_SCAN
if "%sistema_opcao%"=="3" goto CHKDSK
if "%sistema_opcao%"=="4" goto INFO_HARDWARE
if "%sistema_opcao%"=="5" goto TASKMGR
if "%sistema_opcao%"=="6" goto SERVICOS
if "%sistema_opcao%"=="0" goto MAIN_MENU
goto SISTEMA

:INFO_SISTEMA
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                       INFORMAÇÕES DO SISTEMA                       ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
systeminfo
echo.
pause
goto SISTEMA

:SFC_SCAN
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                  VERIFICAÇÃO DE INTEGRIDADE (SFC)                  ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
echo Executando verificação de integridade dos arquivos do sistema...
echo ATENÇÃO: Este processo pode demorar alguns minutos.
echo.
sfc /scannow
echo.
pause
goto SISTEMA

:CHKDSK
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                         VERIFICAÇÃO DE DISCO                       ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
echo Discos disponíveis:
powershell.exe -Command "Get-WmiObject -Class Win32_LogicalDisk | Select-Object DeviceID, @{Name='Size(GB)';Expression={[math]::Round($_.Size/1GB,2)}}, @{Name='FreeSpace(GB)';Expression={[math]::Round($_.FreeSpace/1GB,2)}} | Format-Table -AutoSize"
echo.
set /p drive=Digite a letra do drive para verificar (ex: C): 
echo.
echo Executando verificação do disco %drive%...
chkdsk %drive%: /f /r
echo.
pause
goto SISTEMA

:INFO_HARDWARE
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                       INFORMAÇÕES DE HARDWARE                      ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
echo Processador:
powershell.exe -Command "Get-WmiObject -Class Win32_Processor | Select-Object Name, NumberOfCores, NumberOfLogicalProcessors | Format-Table -AutoSize"
echo.
echo Memória RAM:
powershell.exe -Command "Get-WmiObject -Class Win32_PhysicalMemory | Select-Object @{Name='Capacity(GB)';Expression={[math]::Round($_.Capacity/1GB,2)}}, Speed, Manufacturer | Format-Table -AutoSize"
echo.
echo Placa de Vídeo:
powershell.exe -Command "Get-WmiObject -Class Win32_VideoController | Select-Object Name, @{Name='RAM(MB)';Expression={[math]::Round($_.AdapterRAM/1MB,0)}} | Format-Table -AutoSize"
echo.
pause
goto SISTEMA

:TASKMGR
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                   ABRINDO GERENCIADOR DE TAREFAS                   ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
taskmgr
goto SISTEMA

:SERVICOS
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                     ABRINDO SERVIÇOS DO WINDOWS                    ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
services.msc
goto SISTEMA

:IMPRESSORAS
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                            MENU IMPRESSORAS                          ║
echo ╠════════════════════════════════════════════════════════════════════╣
echo ║                                                                    ║
echo ║  [1] Listar Impressoras Instaladas                                 ║
echo ║  [2] Verificar Status das Impressoras                              ║
echo ║  [3] Limpar Fila de Impressão                                      ║
echo ║  [4] Reinstalar Drivers de Impressora                              ║
echo ║  [5] Configurações de Impressora                                   ║
echo ║  [6] Testar Página de Teste                                        ║
echo ║  [0] Voltar ao Menu Principal                                      ║
echo ║                                                                    ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
set /p impressora_opcao=Digite sua opção: 

if "%impressora_opcao%"=="1" goto LISTAR_IMPRESSORAS
if "%impressora_opcao%"=="2" goto STATUS_IMPRESSORAS
if "%impressora_opcao%"=="3" goto LIMPAR_FILA
if "%impressora_opcao%"=="4" goto REINSTALAR_DRIVERS
if "%impressora_opcao%"=="5" goto CONFIG_IMPRESSORA
if "%impressora_opcao%"=="6" goto TESTE_IMPRESSAO
if "%impressora_opcao%"=="0" goto MAIN_MENU
goto IMPRESSORAS

:LISTAR_IMPRESSORAS
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                       IMPRESSORAS INSTALADAS                       ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
powershell.exe -Command "Get-Printer | Select-Object Name, DriverName, PortName | Format-Table -AutoSize"
echo.
pause
goto IMPRESSORAS

:STATUS_IMPRESSORAS
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                       STATUS DAS IMPRESSORAS                       ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
powershell.exe -Command "Get-Printer | Select-Object Name, PrinterStatus, JobCount | Format-Table -AutoSize"
echo.
pause
goto IMPRESSORAS

:LIMPAR_FILA
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                      LIMPANDO FILA DE IMPRESSÃO                      ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
echo Parando serviço de spooler...
net stop spooler
echo.
echo Limpando arquivos da fila...
del /Q /F %systemroot%\system32\spool\printers\*
echo.
echo Reiniciando serviço de spooler...
net start spooler
echo.
echo Fila de impressão limpa com sucesso!
pause
goto IMPRESSORAS

:REINSTALAR_DRIVERS
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                    GERENCIADOR DE DISPOSITIVOS                     ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
echo Abrindo Gerenciador de Dispositivos para reinstalar drivers...
devmgmt.msc
goto IMPRESSORAS

:CONFIG_IMPRESSORA
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                     CONFIGURAÇÕES DE IMPRESSORA                    ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
echo Abrindo Painel de Controle - Impressoras...
control printers
goto IMPRESSORAS

:TESTE_IMPRESSAO
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                         TESTE DE IMPRESSÃO                         ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
echo Verificando impressoras disponíveis...
powershell.exe -Command "Get-Printer | Select-Object Name, Default | Format-Table -AutoSize"
echo.
echo Escolha uma impressora para testar:
powershell.exe -Command "$printers = Get-Printer; for($i=0; $i -lt $printers.Count; $i++) { Write-Host \"[$($i+1)] $($printers[$i].Name)\" }"
echo [0] Voltar
echo.
set /p printer_choice=Digite o número da impressora: 

if "%printer_choice%"=="0" goto IMPRESSORAS

echo.
echo Enviando página de teste...
powershell.exe -Command "$printers = Get-Printer; if (%printer_choice% -le $printers.Count -and %printer_choice% -gt 0) { $selectedPrinter = $printers[%printer_choice%-1].Name; Write-Host 'Enviando teste para:' $selectedPrinter; Add-Type -AssemblyName System.Drawing; Add-Type -AssemblyName System.Windows.Forms; $doc = New-Object System.Drawing.Printing.PrintDocument; $doc.PrinterSettings.PrinterName = $selectedPrinter; $doc.DocumentName = 'Página de Teste'; $doc.add_PrintPage({ param($sender, $e) $font = New-Object System.Drawing.Font('Arial', 12); $brush = New-Object System.Drawing.SolidBrush([System.Drawing.Color]::Black); $e.Graphics.DrawString('=== PÁGINA DE TESTE ===', $font, $brush, 100, 100); $e.Graphics.DrawString('Impressora: ' + $selectedPrinter, $font, $brush, 100, 150); $e.Graphics.DrawString('Data/Hora: ' + (Get-Date), $font, $brush, 100, 200); $e.Graphics.DrawString('Sistema: ' + $env:COMPUTERNAME, $font, $brush, 100, 250); $e.Graphics.DrawString('Usuário: ' + $env:USERNAME, $font, $brush, 100, 300); $e.Graphics.DrawString('Teste realizado com sucesso!', $font, $brush, 100, 350); }); try { $doc.Print(); Write-Host 'Página de teste enviada com sucesso!' } catch { Write-Host 'Erro ao imprimir:' $_.Exception.Message } } else { Write-Host 'Opção inválida!' }"
echo.
pause
goto IMPRESSORAS

:LIMPEZA
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                              MENU LIMPEZA                            ║
echo ╠════════════════════════════════════════════════════════════════════╣
echo ║                                                                    ║
echo ║  [1] Limpeza de Disco (Disk Cleanup)                               ║
echo ║  [2] Limpar Arquivos Temporários                                   ║
echo ║  [3] Limpar Cache do DNS                                           ║
echo ║  [4] Limpar Histórico do Navegador                                 ║
echo ║  [5] Esvaziar Lixeira                                              ║
echo ║  [6] Limpeza Completa do Sistema                                   ║
echo ║  [0] Voltar ao Menu Principal                                      ║
echo ║                                                                    ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
set /p limpeza_opcao=Digite sua opção: 

if "%limpeza_opcao%"=="1" goto DISK_CLEANUP
if "%limpeza_opcao%"=="2" goto LIMPAR_TEMP
if "%limpeza_opcao%"=="3" goto LIMPAR_DNS_CACHE
if "%limpeza_opcao%"=="4" goto LIMPAR_NAVEGADOR
if "%limpeza_opcao%"=="5" goto ESVAZIAR_LIXEIRA
if "%limpeza_opcao%"=="6" goto LIMPEZA_COMPLETA
if "%limpeza_opcao%"=="0" goto MAIN_MENU
goto LIMPEZA

:DISK_CLEANUP
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                          LIMPEZA DE DISCO                          ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
echo Abrindo ferramenta de Limpeza de Disco...
cleanmgr
goto LIMPEZA

:LIMPAR_TEMP
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                    LIMPANDO ARQUIVOS TEMPORÁRIOS                   ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
echo Removendo arquivos temporários do usuário...
del /s /q %temp%\*.*
echo.
echo Removendo arquivos temporários do Windows...
del /s /q %windir%\temp\*.*
echo.
echo Limpeza de arquivos temporários concluída!
pause
goto LIMPEZA

:LIMPAR_DNS_CACHE
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                         LIMPANDO CACHE DNS                         ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
ipconfig /flushdns
echo.
echo Cache DNS limpo com sucesso!
pause
goto LIMPEZA

:LIMPAR_NAVEGADOR
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                       LIMPEZA DE NAVEGADORES                       ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
echo Limpando cache do Chrome...
taskkill /f /im chrome.exe 2>nul
rd /s /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache" 2>nul
echo.
echo Limpando cache do Edge...
taskkill /f /im msedge.exe 2>nul
rd /s /q "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache" 2>nul
echo.
echo Limpeza de navegadores concluída!
pause
goto LIMPEZA

:ESVAZIAR_LIXEIRA
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                         ESVAZIANDO LIXEIRA                         ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
powershell.exe -Command "Clear-RecycleBin -Force"
echo.
echo Lixeira esvaziada com sucesso!
pause
goto LIMPEZA

:LIMPEZA_COMPLETA
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                         LIMPEZA COMPLETA                         ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
echo Executando limpeza completa do sistema...
echo.
echo [1/5] Limpando arquivos temporários...
del /s /q %temp%\*.* 2>nul
del /s /q %windir%\temp\*.* 2>nul
echo.
echo [2/5] Limpando cache DNS...
ipconfig /flushdns
echo.
echo [3/5] Esvaziando lixeira...
powershell.exe -Command "Clear-RecycleBin -Force" 2>nul
echo.
echo [4/5] Limpando cache de navegadores...
taskkill /f /im chrome.exe 2>nul
taskkill /f /im msedge.exe 2>nul
rd /s /q "%LOCALAPPDATA%\Google\Chrome\User Data\Default\Cache" 2>nul
rd /s /q "%LOCALAPPDATA%\Microsoft\Edge\User Data\Default\Cache" 2>nul
echo.
echo [5/5] Executando limpeza de disco...
cleanmgr /sagerun:1
echo.
echo Limpeza completa finalizada!
pause
goto LIMPEZA

:UTILITARIOS
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                           MENU UTILITÁRIOS                         ║
echo ╠════════════════════════════════════════════════════════════════════╣
echo ║                                                                    ║
echo ║  [1] Editor do Registro (RegEdit)                                  ║
echo ║  [2] Configurações do Sistema (MSConfig)                           ║
echo ║  [3] Monitor de Recursos                                           ║
echo ║  [4] Informações do Sistema (MSInfo32)                             ║
echo ║  [5] Prompt de Comando como Admin                                  ║
echo ║  [6] PowerShell como Admin                                         ║
echo ║  [0] Voltar ao Menu Principal                                      ║
echo ║                                                                    ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
set /p util_opcao=Digite sua opção: 

if "%util_opcao%"=="1" goto REGEDIT
if "%util_opcao%"=="2" goto MSCONFIG
if "%util_opcao%"=="3" goto MONITOR_RECURSOS
if "%util_opcao%"=="4" goto MSINFO32
if "%util_opcao%"=="5" goto CMD_ADMIN
if "%util_opcao%"=="6" goto POWERSHELL_ADMIN
if "%util_opcao%"=="0" goto MAIN_MENU
goto UTILITARIOS

:REGEDIT
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                    ABRINDO EDITOR DO REGISTRO                    ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
echo ATENÇÃO: Seja cuidadoso ao editar o registro!
pause
regedit
goto UTILITARIOS

:MSCONFIG
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                  ABRINDO CONFIGURAÇÕES DO SISTEMA                  ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
msconfig
goto UTILITARIOS

:MONITOR_RECURSOS
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                    ABRINDO MONITOR DE RECURSOS                     ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
resmon
goto UTILITARIOS

:MSINFO32
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                  ABRINDO INFORMAÇÕES DO SISTEMA                    ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
msinfo32
goto UTILITARIOS

:CMD_ADMIN
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                ABRINDO PROMPT DE COMANDO COMO ADMIN                ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
powershell.exe -Command "Start-Process cmd -Verb runAs"
goto UTILITARIOS

:DOMINIO
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                              MENU DOMÍNIO                            ║
echo ╠════════════════════════════════════════════════════════════════════╣
echo ║                                                                    ║
echo ║  [1] Ingressar no Domínio                                          ║
echo ║  [2] Verificar Status do Domínio                                   ║
echo ║  [3] Sair do Domínio                                               ║
echo ║  [4] Informações do Computador                                     ║
echo ║  [0] Voltar ao Menu Principal                                      ║
echo ║                                                                    ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
set /p dominio_opcao=Digite sua opção: 

if "%dominio_opcao%"=="1" goto INGRESSAR_DOMINIO
if "%dominio_opcao%"=="2" goto STATUS_DOMINIO
if "%dominio_opcao%"=="3" goto SAIR_DOMINIO
if "%dominio_opcao%"=="4" goto INFO_COMPUTADOR
if "%dominio_opcao%"=="0" goto MAIN_MENU
goto DOMINIO

:INGRESSAR_DOMINIO
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                         INGRESSAR NO DOMÍNIO                       ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
echo Escolha o domínio para ingressar:
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                                                                    ║
echo ║  [1] Domínio Principal                                             ║
echo ║  [2] Domínio Filial A                                              ║
echo ║  [3] Domínio Filial B                                              ║
echo ║  [4] Domínio de Testes                                             ║
echo ║  [0] Voltar                                                        ║
echo ║                                                                    ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
set /p dominio_escolha=Digite sua opção: 

if "%dominio_escolha%"=="1" goto INGRESSAR_PRINCIPAL
if "%dominio_escolha%"=="2" goto INGRESSAR_FILIAL_A
if "%dominio_escolha%"=="3" goto INGRESSAR_FILIAL_B
if "%dominio_escolha%"=="4" goto INGRESSAR_TESTES
if "%dominio_escolha%"=="0" goto DOMINIO
goto INGRESSAR_DOMINIO

:INGRESSAR_PRINCIPAL
set "DOMAIN_NAME=corp.local"
set "OU_PATH=OU=Computadores,DC=corp,DC=local"
goto EXECUTAR_INGRESSO

:INGRESSAR_FILIAL_A
set "DOMAIN_NAME=filiala.local"
set "OU_PATH=OU=Computadores,DC=filiala,DC=local"
goto EXECUTAR_INGRESSO

:INGRESSAR_FILIAL_B
set "DOMAIN_NAME=filialb.local"
set "OU_PATH=OU=Computadores,DC=filialb,DC=local"
goto EXECUTAR_INGRESSO

:INGRESSAR_TESTES
set "DOMAIN_NAME=dev.local"
set "OU_PATH=OU=Computadores,DC=dev,DC=local"
goto EXECUTAR_INGRESSO

:EXECUTAR_INGRESSO
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                         INGRESSAR NO DOMÍNIO                       ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
echo ATENÇÃO: Esta operação irá reiniciar o computador após o ingresso!
echo.
echo Configurações selecionadas:
echo - Domínio: %DOMAIN_NAME%
echo - OU: %OU_PATH%
echo.
set /p confirma=Deseja continuar? (S/N): 
if /i "%confirma%" NEQ "S" goto DOMINIO

echo.
echo Iniciando processo de ingresso no domínio %DOMAIN_NAME%...
echo.

powershell.exe -Command "& { $DomainName = '%DOMAIN_NAME%'; $OUPath = '%OU_PATH%'; Write-Host '==========================' -ForegroundColor Cyan; Write-Host '     INGRESSAR DOMÍNIO' -ForegroundColor Cyan; Write-Host '==========================' -ForegroundColor Cyan; Write-Host; $Credential = Get-Credential -Message \"Digite as credenciais de um usuário com permissão para ingressar no domínio $DomainName\"; if ($Credential -eq $null) { Write-Host '❌ Operação cancelada pelo usuário.' -ForegroundColor Red; return }; $ComputerSystem = Get-WmiObject Win32_ComputerSystem; if ($ComputerSystem.PartOfDomain) { Write-Host \"💡 Este computador já faz parte do domínio: $($ComputerSystem.Domain)\" -ForegroundColor Yellow; return }; try { if ($OUPath -ne '') { Add-Computer -DomainName $DomainName -Credential $Credential -OUPath $OUPath -ErrorAction Stop } else { Add-Computer -DomainName $DomainName -Credential $Credential -ErrorAction Stop }; Write-Host '✅ Computador adicionado ao domínio com sucesso!' -ForegroundColor Green; Write-Host; Write-Host '🔄 O computador será reiniciado em 10 segundos...' -ForegroundColor Yellow; Start-Sleep -Seconds 10; Restart-Computer -Force } catch { Write-Host \"❌ Erro ao ingressar no domínio: $_\" -ForegroundColor Red; Write-Host; Write-Host 'Pressione qualquer tecla para continuar...'; Read-Host } }"

pause
goto DOMINIO

:STATUS_DOMINIO
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                         STATUS DO DOMÍNIO                        ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
powershell.exe -Command "& { $ComputerSystem = Get-WmiObject Win32_ComputerSystem; Write-Host 'Nome do Computador:' $ComputerSystem.Name -ForegroundColor Green; Write-Host 'Workgroup/Domínio:' $ComputerSystem.Workgroup -ForegroundColor Green; if ($ComputerSystem.PartOfDomain) { Write-Host '✅ Status: Membro do Domínio' -ForegroundColor Green; Write-Host 'Domínio:' $ComputerSystem.Domain -ForegroundColor Green; try { $Domain = Get-WmiObject -Class Win32_NTDomain; Write-Host 'Controlador de Domínio:' $Domain.DomainControllerName -ForegroundColor Green } catch { Write-Host 'Não foi possível obter informações do DC' -ForegroundColor Yellow } } else { Write-Host '⚠️  Status: Não é membro de domínio (Workgroup)' -ForegroundColor Yellow } }"
echo.
pause
goto DOMINIO

:SAIR_DOMINIO
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                           SAIR DO DOMÍNIO                          ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
echo ATENÇÃO: Esta operação irá remover o computador do domínio!
echo O computador será reiniciado após a operação.
echo.
set /p confirma_saida=Deseja realmente sair do domínio? (S/N): 
if /i "%confirma_saida%" NEQ "S" goto DOMINIO

echo.
powershell.exe -Command "& { $ComputerSystem = Get-WmiObject Win32_ComputerSystem; if (-not $ComputerSystem.PartOfDomain) { Write-Host '💡 Este computador não está em um domínio.' -ForegroundColor Yellow; return }; Write-Host 'Removendo do domínio:' $ComputerSystem.Domain -ForegroundColor Yellow; $Credential = Get-Credential -Message 'Digite as credenciais de um usuário com permissão para remover computadores do domínio'; if ($Credential -eq $null) { Write-Host '❌ Operação cancelada pelo usuário.' -ForegroundColor Red; return }; try { Remove-Computer -Credential $Credential -PassThru -Verbose -Restart -Force } catch { Write-Host \"❌ Erro ao sair do domínio: $_\" -ForegroundColor Red } }"
pause
goto DOMINIO

:INFO_COMPUTADOR
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                     INFORMAÇÕES DO COMPUTADOR                      ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
powershell.exe -Command "& { $ComputerSystem = Get-WmiObject Win32_ComputerSystem; $OS = Get-WmiObject Win32_OperatingSystem; Write-Host '=== INFORMAÇÕES GERAIS ===' -ForegroundColor Cyan; Write-Host 'Nome do Computador:' $ComputerSystem.Name; Write-Host 'Sistema Operacional:' $OS.Caption; Write-Host 'Versão:' $OS.Version; Write-Host 'Usuário Logado:' $ComputerSystem.UserName; Write-Host; Write-Host '=== INFORMAÇÕES DE DOMÍNIO ===' -ForegroundColor Cyan; if ($ComputerSystem.PartOfDomain) { Write-Host 'Status: Membro do Domínio' -ForegroundColor Green; Write-Host 'Domínio:' $ComputerSystem.Domain; Write-Host 'Função:' $ComputerSystem.DomainRole } else { Write-Host 'Status: Workgroup' -ForegroundColor Yellow; Write-Host 'Workgroup:' $ComputerSystem.Workgroup } }"
echo.
pause
goto DOMINIO

:POWERSHELL_ADMIN
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                     ABRINDO POWERSHELL COMO ADMIN                  ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
powershell.exe -Command "Start-Process powershell -Verb runAs"
goto UTILITARIOS

:SAIR
cls
echo.
echo ╔════════════════════════════════════════════════════════════════════╗
echo ║                     OBRIGADO POR USAR O SISTEMA!                     ║
echo ╚════════════════════════════════════════════════════════════════════╝
echo.
pause
exit
