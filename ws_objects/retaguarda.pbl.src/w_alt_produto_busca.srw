$PBExportHeader$w_alt_produto_busca.srw
forward
global type w_alt_produto_busca from window
end type
type st_nehum from statictext within w_alt_produto_busca
end type
type cb_cancelar from commandbutton within w_alt_produto_busca
end type
type cb_ok from commandbutton within w_alt_produto_busca
end type
type dw_1 from datawindow within w_alt_produto_busca
end type
type gb_1 from groupbox within w_alt_produto_busca
end type
end forward

global type w_alt_produto_busca from window
integer width = 2866
integer height = 1852
boolean titlebar = true
string title = "Busca de produtos"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_nehum st_nehum
cb_cancelar cb_cancelar
cb_ok cb_ok
dw_1 dw_1
gb_1 gb_1
end type
global w_alt_produto_busca w_alt_produto_busca

on w_alt_produto_busca.create
this.st_nehum=create st_nehum
this.cb_cancelar=create cb_cancelar
this.cb_ok=create cb_ok
this.dw_1=create dw_1
this.gb_1=create gb_1
this.Control[]={this.st_nehum,&
this.cb_cancelar,&
this.cb_ok,&
this.dw_1,&
this.gb_1}
end on

on w_alt_produto_busca.destroy
destroy(this.st_nehum)
destroy(this.cb_cancelar)
destroy(this.cb_ok)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event open;String descricao
Integer resultado
dw_1.settransobject(SQLCA)
descricao = String("%" +w_alt_produto.sle_1.text+"%")
resultado = dw_1.retrieve(descricao)

if resultado = 0 then
	st_nehum.visible = True
end if



end event

type st_nehum from statictext within w_alt_produto_busca
boolean visible = false
integer x = 553
integer y = 732
integer width = 1193
integer height = 120
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = script!
string facename = "Lucida Calligraphy"
long textcolor = 255
long backcolor = 67108864
boolean enabled = false
string text = "Nenhum produto encontrado"
boolean focusrectangle = false
end type

type cb_cancelar from commandbutton within w_alt_produto_busca
integer x = 1902
integer y = 1560
integer width = 375
integer height = 96
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&CANCELAR"
boolean cancel = true
end type

event clicked;Close(parent)

end event

type cb_ok from commandbutton within w_alt_produto_busca
integer x = 1467
integer y = 1564
integer width = 357
integer height = 96
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "&OK"
end type

event clicked;String cod_prod
Integer ll

ll = dw_1.GetRow()

if ll > 0 then
	dw_1.settransobject(SQLCA)
	cod_prod = string( dw_1.GetItemString(ll,"codigo"))
//	w_alt_produto.dw_1.retrieve(cod_prod)

w_alt_produto.sle_1.text = cod_prod
w_alt_produto.sle_1.TriggerEvent("modified")
	
	close(w_alt_produto_busca)
	w_alt_produto.dw_1.setfocus()
else
	Close(parent)
end if
end event

type dw_1 from datawindow within w_alt_produto_busca
event enter pbm_dwnprocessenter
integer x = 114
integer y = 188
integer width = 2546
integer height = 1288
integer taborder = 10
string title = "none"
string dataobject = "d_alt_produto_busca"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event enter;cb_ok.TriggerEvent("clicked")
end event

event rowfocuschanging;cb_ok.enabled = true
end event

event doubleclicked;cb_ok.TriggerEvent("clicked")
end event

type gb_1 from groupbox within w_alt_produto_busca
integer x = 69
integer y = 84
integer width = 2734
integer height = 1432
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Resultado"
end type

