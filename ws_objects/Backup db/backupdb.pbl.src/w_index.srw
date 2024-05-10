$PBExportHeader$w_index.srw
forward
global type w_index from window
end type
type st_1 from statictext within w_index
end type
type st_texto from statictext within w_index
end type
type gb_1 from groupbox within w_index
end type
end forward

global type w_index from window
integer width = 1815
integer height = 864
boolean titlebar = true
string title = "Backup Automático - Banco de Dados"
long backcolor = 67108864
string icon = "ServerProfile!"
boolean clientedge = true
boolean center = true
windowanimationstyle openanimation = centeranimation!
windowanimationstyle closeanimation = centeranimation!
integer animationtime = 500
st_1 st_1
st_texto st_texto
gb_1 gb_1
end type
global w_index w_index

type variables

end variables

on w_index.create
this.st_1=create st_1
this.st_texto=create st_texto
this.gb_1=create gb_1
this.Control[]={this.st_1,&
this.st_texto,&
this.gb_1}
end on

on w_index.destroy
destroy(this.st_1)
destroy(this.st_texto)
destroy(this.gb_1)
end on

type st_1 from statictext within w_index
integer x = 311
integer y = 164
integer width = 1051
integer height = 64
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Calibri"
long textcolor = 33554432
long backcolor = 67108864
string text = "RETAGUARDA DE LOJA "
alignment alignment = center!
boolean focusrectangle = false
end type

type st_texto from statictext within w_index
integer x = 311
integer y = 344
integer width = 1051
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Efetuando Backup do Bando de Dados..."
alignment alignment = center!
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_index
integer x = 50
integer y = 56
integer width = 1632
integer height = 588
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
end type

