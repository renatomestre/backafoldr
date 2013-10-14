@ECHO OFF
:: Autor: Renato Mestre
:: renato.mestre@hotmail.com
:: Versão 0.1.0 (10/2013)
::                                                 \¨¨¨¨¨¨¨¨¨¨¨¨¨\
:: .................................................\ Altere aqui \
::                                                   \_____________\
@SET list=C:\seu-caminho-aqui\backafoldrs.txt

@SET destination=C:\Users\Seu-Usuario\Copy-Dropbox-GoogleDrive-Etc

@SET projectName=NomeDaSuaRaiz
:: .................................................

:: Variáveis para definição de data e hora
@SET ano=%date:~6,4%
@SET mes=%date:~3,2%
@SET dia=%date:~0,2%

@SET hora=%time:~0,2%
@SET minuto=%time:~3,2%
@SET segundo=%time:~6,2%

:: Estrutura do nome da pasta de backup
@SET backupFolderName=%ano%-%mes%-%dia%_%hora%h%minuto%m%segundo%s

:: Redefine o destino conforme pasta de backup (com data e hora)
@SET destination=%destination%\%projectName%\%backupFolderName%

:: Copia cada pasta do arquivo texto para a pasta que criou acima
@ECHO.
@ECHO Destino: %destination%
@ECHO.

:: Para cada item da lista, chama o processo que copia
@FOR /f %%i in (%list%) DO @CALL :copiaPasta %%i
@ECHO.
@ECHO Sucesso!
@ECHO.
@GOTO End

:: Cria uma cópia idêntica no destino
:copiaPasta
@SET folderName=%~n1
@XCOPY "%1" "%destination%\%folderName%\" /E /H
@GOTO :EOF

:End
@PAUSE