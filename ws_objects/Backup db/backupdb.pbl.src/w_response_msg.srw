$PBExportHeader$w_response_msg.srw
forward
global type w_response_msg from window
end type
type mle_msg from multilineedit within w_response_msg
end type
type r_1 from rectangle within w_response_msg
end type
end forward

global type w_response_msg from window
integer x = 1298
integer y = 952
integer width = 2222
integer height = 420
boolean titlebar = true
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 15780518
string icon = "AppIcon!"
boolean center = true
mle_msg mle_msg
r_1 r_1
end type
global w_response_msg w_response_msg

on w_response_msg.create
this.mle_msg=create mle_msg
this.r_1=create r_1
this.Control[]={this.mle_msg,&
this.r_1}
end on

on w_response_msg.destroy
destroy(this.mle_msg)
destroy(this.r_1)
end on

event open;mle_msg.Text = Message.StringParm


end event

type mle_msg from multilineedit within w_response_msg
integer x = 142
integer y = 76
integer width = 1920
integer height = 200
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Calibri"
long textcolor = 33554432
long backcolor = 12639424
string text = "msg"
boolean border = false
alignment alignment = Center!
boolean displayonly = true
end type

type r_1 from rectangle within w_response_msg
long linecolor = 16711680
integer linethickness = 4
long fillcolor = 12639424
integer x = 37
integer y = 52
integer width = 2112
integer height = 252
end type

