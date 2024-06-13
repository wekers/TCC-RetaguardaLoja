$PBExportHeader$w_sobre.srw
forward
global type w_sobre from window
end type
type st_4 from statictext within w_sobre
end type
type sle_1 from singlelineedit within w_sobre
end type
type st_6 from statictext within w_sobre
end type
type st_5 from statictext within w_sobre
end type
type st_3 from statictext within w_sobre
end type
type st_2 from statictext within w_sobre
end type
type rr_1 from roundrectangle within w_sobre
end type
type rr_2 from roundrectangle within w_sobre
end type
type p_1 from picture within w_sobre
end type
type st_1 from statictext within w_sobre
end type
end forward

global type w_sobre from window
integer width = 2053
integer height = 1200
boolean titlebar = true
string title = "Sobre"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean clientedge = true
boolean center = true
st_4 st_4
sle_1 sle_1
st_6 st_6
st_5 st_5
st_3 st_3
st_2 st_2
rr_1 rr_1
rr_2 rr_2
p_1 p_1
st_1 st_1
end type
global w_sobre w_sobre

type prototypes

end prototypes

on w_sobre.create
this.st_4=create st_4
this.sle_1=create sle_1
this.st_6=create st_6
this.st_5=create st_5
this.st_3=create st_3
this.st_2=create st_2
this.rr_1=create rr_1
this.rr_2=create rr_2
this.p_1=create p_1
this.st_1=create st_1
this.Control[]={this.st_4,&
this.sle_1,&
this.st_6,&
this.st_5,&
this.st_3,&
this.st_2,&
this.rr_1,&
this.rr_2,&
this.p_1,&
this.st_1}
end on

on w_sobre.destroy
destroy(this.st_4)
destroy(this.sle_1)
destroy(this.st_6)
destroy(this.st_5)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.rr_1)
destroy(this.rr_2)
destroy(this.p_1)
destroy(this.st_1)
end on

type st_4 from statictext within w_sobre
integer x = 695
integer y = 264
integer width = 1120
integer height = 64
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Calibri"
long textcolor = 8421376
long backcolor = 67108864
string text = "Unicesumar - TCC Engenharia de Software - 2024"
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within w_sobre
integer x = 1006
integer y = 340
integer width = 297
integer height = 68
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8421376
long backcolor = 67108864
string text = "1.1.0"
boolean border = false
boolean displayonly = true
string placeholder = "0"
end type

type st_6 from statictext within w_sobre
integer x = 494
integer y = 968
integer width = 928
integer height = 64
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Calibri"
long textcolor = 8388608
long backcolor = 67108864
string text = "Universidade Cesumar"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_5 from statictext within w_sobre
integer x = 800
integer y = 340
integer width = 265
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 16711680
long backcolor = 67108864
string text = "Versão:"
boolean focusrectangle = false
end type

type st_3 from statictext within w_sobre
integer x = 631
integer y = 900
integer width = 745
integer height = 64
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Calibri"
long textcolor = 8388608
long backcolor = 67108864
string text = "Fernando Gilli - R.A. 20145763-5"
alignment alignment = center!
boolean focusrectangle = false
end type

type st_2 from statictext within w_sobre
integer x = 407
integer y = 88
integer width = 1294
integer height = 64
integer textsize = -12
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 8421376
long backcolor = 67108864
string text = "SISTEMA RETAGUARDA DE LOJA"
boolean focusrectangle = false
end type

type rr_1 from roundrectangle within w_sobre
long linecolor = 15780518
integer linethickness = 4
long fillcolor = 67108864
integer x = 73
integer y = 56
integer width = 1861
integer height = 984
integer cornerheight = 40
integer cornerwidth = 46
end type

type rr_2 from roundrectangle within w_sobre
long linecolor = 16711680
integer linethickness = 4
long fillcolor = 67108864
integer x = 178
integer y = 244
integer width = 1673
integer height = 184
integer cornerheight = 40
integer cornerwidth = 46
end type

type p_1 from picture within w_sobre
integer x = 521
integer y = 436
integer width = 901
integer height = 452
string picturename = "logo_c.png"
boolean focusrectangle = false
end type

type st_1 from statictext within w_sobre
integer x = 247
integer y = 264
integer width = 443
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 16711680
long backcolor = 67108864
string text = "Registrado para:"
boolean focusrectangle = false
end type

