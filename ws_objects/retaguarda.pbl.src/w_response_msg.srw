$PBExportHeader$w_response_msg.srw
forward
global type w_response_msg from window
end type
type st_msg from statictext within w_response_msg
end type
type r_1 from rectangle within w_response_msg
end type
end forward

global type w_response_msg from window
integer x = 1298
integer y = 952
integer width = 1271
integer height = 208
boolean border = false
windowtype windowtype = child!
long backcolor = 15780518
string icon = "AppIcon!"
st_msg st_msg
r_1 r_1
end type
global w_response_msg w_response_msg

on w_response_msg.create
this.st_msg=create st_msg
this.r_1=create r_1
this.Control[]={this.st_msg,&
this.r_1}
end on

on w_response_msg.destroy
destroy(this.st_msg)
destroy(this.r_1)
end on

type st_msg from statictext within w_response_msg
integer x = 96
integer y = 80
integer width = 1001
integer height = 60
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Calibri"
long textcolor = 16711680
long backcolor = 12639424
string text = "Carregando..   (Efetuando Calculos..."
boolean focusrectangle = false
end type

type r_1 from rectangle within w_response_msg
long linecolor = 16711680
integer linethickness = 4
long fillcolor = 12639424
integer x = 37
integer y = 52
integer width = 1207
integer height = 112
end type

