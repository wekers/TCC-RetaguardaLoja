$PBExportHeader$w_response_cep.srw
forward
global type w_response_cep from window
end type
type st_1 from statictext within w_response_cep
end type
type r_1 from rectangle within w_response_cep
end type
end forward

global type w_response_cep from window
integer x = 1298
integer y = 952
integer width = 1271
integer height = 208
boolean border = false
windowtype windowtype = child!
long backcolor = 15780518
string pointer = "HourGlass!"
st_1 st_1
r_1 r_1
end type
global w_response_cep w_response_cep

on w_response_cep.create
this.st_1=create st_1
this.r_1=create r_1
this.Control[]={this.st_1,&
this.r_1}
end on

on w_response_cep.destroy
destroy(this.st_1)
destroy(this.r_1)
end on

type st_1 from statictext within w_response_cep
integer x = 96
integer y = 80
integer width = 1065
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Microsoft Sans Serif"
long textcolor = 16711680
long backcolor = 12639424
string text = "Localizando CEP... Por Favor Aguarde..."
boolean focusrectangle = false
end type

type r_1 from rectangle within w_response_cep
long linecolor = 16711680
integer linethickness = 4
long fillcolor = 12639424
integer x = 50
integer y = 44
integer width = 1161
integer height = 112
end type

