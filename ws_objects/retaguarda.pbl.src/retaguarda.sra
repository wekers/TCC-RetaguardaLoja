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

global type retaguarda from application
string appname = "retaguarda"
string appruntimeversion = "22.1.0.2819"
end type
global retaguarda retaguarda

on retaguarda.create
appname = "retaguarda"
message = create message
sqlca = create transaction
sqlda = create dynamicdescriptionarea
sqlsa = create dynamicstagingarea
error = create error
end on

on retaguarda.destroy
destroy( sqlca )
destroy( sqlda )
destroy( sqlsa )
destroy( error )
destroy( message )
end on

