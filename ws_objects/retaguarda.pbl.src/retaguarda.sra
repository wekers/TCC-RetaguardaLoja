$PBExportHeader$retaguarda.sra
$PBExportComments$Generated Application Object
forward
global type retaguarda from application
end type
global transaction sqlca
global dynamicdescriptionarea sqlda
global dynamicstagingarea sqlsa
global error error
global message message
end forward

global variables
string nome_usuario, senha_usuario
long codigo_usuario = 99999

Boolean de_alt_fornecedor, de_fornecedor, de_clientes
end variables

global type retaguarda from application
string appname = "retaguarda"
boolean toolbartext = true
string themepath = "C:\Program Files (x86)\Appeon\PowerBuilder 22.0\IDE\theme"
string themename = "Do Not Use Themes"
boolean nativepdfvalid = true
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
global retaguarda retaguarda

type variables
string pwdb = "JFRDQ3VuaWNlc3VtYXIyMDIz"
end variables

on retaguarda.create
appname="retaguarda"
message=create message
sqlca=create transaction
sqlda=create dynamicdescriptionarea
sqlsa=create dynamicstagingarea
error=create error
end on

on retaguarda.destroy
destroy(sqlca)
destroy(sqlda)
destroy(sqlsa)
destroy(error)
destroy(message)
end on

event open;sqlca.dbms =	"ODBC"
sqlca.AutoCommit = False

Blob lblb_data
String ls_Base64Str

CoderObject lnv_CoderObject
lnv_CoderObject = Create CoderObject
lblb_data = lnv_CoderObject.Base64Decode(pwdb)
pwdb = string(lblb_data, EncodingANSI!)

//PostgreSQL
sqlca.dbparm =	"ConnectString='DSN=TCCRetaguarda;Database=TccRetaguarda;UID=unicesumar;Port=5432;PWD="+pwdb+";'"+ &
"ConnectOption='SQLDRIVER_CONNECT,SQL_DRIVER_NOPROMPT',StripParmNames='Yes'"
SQLCA.Lock="RC"

Connect;

If sqlca.sqlcode < 0 Then
			MessageBox ("Erro:	Impossivel conectar com o Banco de Dados",& 
											sqlca.sqlerrtext, Exclamation!)
		HALT
End IF

//Open(w_index)

Open(w_logo)

sleep(2)

Open(w_login)

Close(w_logo)

end event

event close;disconnect using sqlca;
end event

