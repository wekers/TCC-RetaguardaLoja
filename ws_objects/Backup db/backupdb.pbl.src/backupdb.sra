$PBExportHeader$backupdb.sra
$PBExportComments$Generated Application Object
forward
global type backupdb from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global type backupdb from application
string appname = "backupdb"
string themepath = "C:\Program Files (x86)\Appeon\PowerBuilder 19.0\IDE\theme"
string themename = "Do Not Use Themes"
boolean nativepdfvalid = false
boolean nativepdfincludecustomfont = false
string nativepdfappname = ""
long richtextedittype = 5
long richtexteditx64type = 5
long richtexteditversion = 3
string richtexteditkey = ""
string appicon = ""
string appruntimeversion = "22.2.0.3289"
boolean manualsession = false
boolean unsupportedapierror = false
boolean ultrafast = false
boolean bignoreservercertificate = false
uint ignoreservercertificate = 0
long webview2distribution = 0
boolean webview2checkx86 = false
boolean webview2checkx64 = false
string webview2url = "https://developer.microsoft.com/en-us/microsoft-edge/webview2/"
end type
global backupdb backupdb

type variables
string pwdb = "JFRDQ3VuaWNlc3VtYXIyMDIz"
end variables

on backupdb.create
appname="backupdb"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on backupdb.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;Open(w_index)

/* decode base64 */
Blob lblb_data
String ls_Base64Str

CoderObject lnv_CoderObject
lnv_CoderObject = Create CoderObject
lblb_data = lnv_CoderObject.Base64Decode(pwdb)
pwdb = string(lblb_data, EncodingANSI!)
/* fim decode base64 */

string data_hora, ls_backup_file, ls_command, ls_database, ls_user, ls_host, ls_porta

/* Definindo a data de hoje */
data_hora = string(today(), "yyyy-mm-d") + '" "' + String(Now(), "hh-mm")

/* Defindo o caminho do backup, que está em Config.ini */
ls_backup_file = ProfileString("Config.INI", "Local", "Diretorio", "None")

/* Defindo o host, que está em Config.ini */
ls_host = ProfileString("Config.INI", "Host", "Endereco", "None")

/* Defindo a porta, que está em Config.ini */
ls_porta = ProfileString("Config.INI", "Host", "Porta", "None")

/* Defindo o nome do banco de dados que deseja fazer backup */
ls_database = "TccRetaguarda"

/* Defindo o nome do usuário de dados que deseja fazer backup */
ls_user = "unicesumar"

/* O comando de backup usando pg_dump */
ls_command = 'cmd /c "setlocal&& set PGPASSWORD='+ pwdb +'&& pg_dump -U '+ ls_user +' -h '+ ls_host +' -p '+ ls_porta +' -d '+ ls_database +' &
-Fc -b -f '+ ls_backup_file +string(data_hora)+".dmp"+'&& set PGPASSWORD="&&endlocal'

//funciona também, ex:
//ls_command = 'cmd /c  "pg_dump postgresql://usuario:senha@localhost:5432/nomeDoBanco > C:\Retaguarda\Estoque.sql"'
//Run("psql postgresql://usuario:senha@127.0.0.1:5432/nomeDoBanco")
//Run(ls_command)


/* executa comando e aguarda até finalizar */
OleObject wsh
integer  li_rc

CONSTANT integer MAXIMIZED = 3
CONSTANT integer MINIMIZED = 2
CONSTANT integer NORMAL = 1
CONSTANT boolean WAIT = TRUE
CONSTANT boolean NOWAIT = FALSE

wsh = CREATE OleObject
li_rc = wsh.ConnectToNewObject( "WScript.Shell" )
li_rc = wsh.Run(ls_command, MINIMIZED, WAIT) //aguarda até finalizar

// Verifique se o backup foi feito com sucesso
IF li_rc = 0 THEN
    w_index.st_texto.text = "Backup Efetuado com sucesso..."
ELSE
	w_index.st_texto.text = "Erro -> Falha ao fazer o Backup..."
    MessageBox("Erro", "Falha ao fazer backup do banco de dados.")
END IF


Sleep(4)
Close(w_index)


end event

