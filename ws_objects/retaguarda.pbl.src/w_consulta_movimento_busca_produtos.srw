$PBExportHeader$w_consulta_movimento_busca_produtos.srw
forward
global type w_consulta_movimento_busca_produtos from window
end type
type st_nehum from statictext within w_consulta_movimento_busca_produtos
end type
type cb_cancelar from commandbutton within w_consulta_movimento_busca_produtos
end type
type cb_ok from commandbutton within w_consulta_movimento_busca_produtos
end type
type dw_1 from datawindow within w_consulta_movimento_busca_produtos
end type
type gb_1 from groupbox within w_consulta_movimento_busca_produtos
end type
end forward

global type w_consulta_movimento_busca_produtos from window
integer width = 3063
integer height = 2596
boolean titlebar = true
string title = "Lista de produtos"
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean clientedge = true
boolean center = true
st_nehum st_nehum
cb_cancelar cb_cancelar
cb_ok cb_ok
dw_1 dw_1
gb_1 gb_1
end type
global w_consulta_movimento_busca_produtos w_consulta_movimento_busca_produtos

on w_consulta_movimento_busca_produtos.create
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

on w_consulta_movimento_busca_produtos.destroy
destroy(this.st_nehum)
destroy(this.cb_cancelar)
destroy(this.cb_ok)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event open;String item, descricao
Integer resultado

item = Message.StringParm
descricao = String("%" +item+"%")
dw_1.SetTransObject(SQLCA)
resultado = dw_1.retrieve(descricao)

dw_1.Modify("codigo.Color = ' 0~tIf(saldo < 0,255,0)'")
dw_1.Modify("descricao.Color = ' 0~tIf(saldo < 0,255,0)'")
dw_1.Modify("und.Color = ' 0~tIf(saldo < 0,255,0)'")
dw_1.Modify("preco_venda.Color = ' 0~tIf(saldo < 0,255,0)'")
dw_1.Modify("desconto.Color = ' 0~tIf(saldo < 0,255,0)'")
dw_1.Modify("preco_final_venda.Color = ' 0~tIf(saldo < 0,255,0)'")
dw_1.Modify("saldo.Color = ' 0~tIf(saldo < 0,255,0)'")
dw_1.Modify("t_desconto.Color = ' 0~tIf(saldo < 0,255,0)'")

if resultado = 0 then
	st_nehum.visible = True
end if

end event

type st_nehum from statictext within w_consulta_movimento_busca_produtos
boolean visible = false
integer x = 891
integer y = 1092
integer width = 1193
integer height = 120
integer textsize = -12
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = script!
string facename = "Lucida Calligraphy"
long textcolor = 16711680
long backcolor = 12639424
boolean enabled = false
string text = "Nenhum produto encontrado"
boolean focusrectangle = false
end type

type cb_cancelar from commandbutton within w_consulta_movimento_busca_produtos
integer x = 2546
integer y = 2364
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

event clicked;String gerar
gerar = "valido"
Closewithreturn(parent, gerar)


end event

type cb_ok from commandbutton within w_consulta_movimento_busca_produtos
integer x = 2112
integer y = 2368
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

event clicked;Integer ll
String cod_prod
ll = dw_1.GetRow()

if ll > 0 then
	dw_1.settransobject(SQLCA)
	cod_prod = string( dw_1.GetItemString(ll,"codigo"))
	//w_consulta_movimento.dw_1.retrieve(cod_prod)
	closewithreturn(parent, cod_prod)
else
	cb_cancelar.TriggerEvent("clicked")
end if

end event

type dw_1 from datawindow within w_consulta_movimento_busca_produtos
event enter pbm_dwnprocessenter
integer x = 114
integer y = 188
integer width = 2779
integer height = 2076
integer taborder = 10
string title = "none"
string dataobject = "d_consulta_movimento_busca_produtos"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event enter;cb_ok.TriggerEvent("clicked")
end event

event doubleclicked;cb_ok.TriggerEvent("clicked")
end event

event rowfocuschanged;cb_ok.enabled = true
end event

type gb_1 from groupbox within w_consulta_movimento_busca_produtos
integer x = 69
integer y = 84
integer width = 2875
integer height = 2248
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

