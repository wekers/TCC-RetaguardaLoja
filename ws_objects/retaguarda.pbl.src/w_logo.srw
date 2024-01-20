$PBExportHeader$w_logo.srw
forward
global type w_logo from window
end type
type p_1 from picture within w_logo
end type
end forward

global type w_logo from window
integer width = 2281
integer height = 1380
boolean border = false
windowtype windowtype = popup!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
p_1 p_1
end type
global w_logo w_logo

on w_logo.create
this.p_1=create p_1
this.Control[]={this.p_1}
end on

on w_logo.destroy
destroy(this.p_1)
end on

type p_1 from picture within w_logo
integer width = 2281
integer height = 1376
string picturename = "logo.png"
boolean focusrectangle = false
end type

