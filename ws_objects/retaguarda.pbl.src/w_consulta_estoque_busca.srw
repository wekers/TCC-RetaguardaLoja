$PBExportHeader$w_consulta_estoque_busca.srw
forward
global type w_consulta_estoque_busca from window
end type
type st_nehum from statictext within w_consulta_estoque_busca
end type
type dw_1 from datawindow within w_consulta_estoque_busca
end type
type cb_cancelar from commandbutton within w_consulta_estoque_busca
end type
type cb_ok from commandbutton within w_consulta_estoque_busca
end type
type gb_1 from groupbox within w_consulta_estoque_busca
end type
type uo_1 from u_progress_bar within w_consulta_estoque_busca
end type
end forward

global type w_consulta_estoque_busca from window
integer width = 4187
integer height = 2604
boolean titlebar = true
string title = "Lista de produtos"
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean clientedge = true
boolean center = true
st_nehum st_nehum
dw_1 dw_1
cb_cancelar cb_cancelar
cb_ok cb_ok
gb_1 gb_1
uo_1 uo_1
end type
global w_consulta_estoque_busca w_consulta_estoque_busca

type variables
long vi_total, vi_fila_actual
boolean retrieve_cancel = false
end variables

on w_consulta_estoque_busca.create
this.st_nehum=create st_nehum
this.dw_1=create dw_1
this.cb_cancelar=create cb_cancelar
this.cb_ok=create cb_ok
this.gb_1=create gb_1
this.uo_1=create uo_1
this.Control[]={this.st_nehum,&
this.dw_1,&
this.cb_cancelar,&
this.cb_ok,&
this.gb_1,&
this.uo_1}
end on

on w_consulta_estoque_busca.destroy
destroy(this.st_nehum)
destroy(this.dw_1)
destroy(this.cb_cancelar)
destroy(this.cb_ok)
destroy(this.gb_1)
destroy(this.uo_1)
end on

event open;String descricao, item
Integer resultado
dw_1.settransobject(SQLCA)
item = w_consulta_estoque.sle_text.text

descricao = String("%" +item+"%")
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

type st_nehum from statictext within w_consulta_estoque_busca
boolean visible = false
integer x = 1111
integer y = 1112
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

type dw_1 from datawindow within w_consulta_estoque_busca
event enter pbm_dwnprocessenter
integer x = 142
integer y = 188
integer width = 3675
integer height = 2076
integer taborder = 10
string title = "none"
string dataobject = "d_consulta_produtos_geral"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event enter;cb_ok.TriggerEvent("clicked")
end event

event rowfocuschanged;cb_ok.enabled = true
end event

event doubleclicked;cb_ok.TriggerEvent("clicked")
end event

event retrievestart;string descricao
vi_fila_actual = 0
uo_1.VISIBLE = true				
descricao = String("%" +w_consulta_estoque.sle_text.text+"%")
cb_ok.enabled = false


/* quantidade de rows para calculo do progressbar */
SELECT Count(codigo) INTO :vi_total 
   FROM "produto" 
WHERE "produto"."descricao" like :descricao;


end event

event retrieverow;if retrieve_cancel then 
	messagebox("Ok","Busca Cancelada")
	return 1
end if

vi_fila_actual ++											
uo_1.porcentage( (vi_fila_actual*100)/vi_total) //calculo para o progressbar
this.scrolltorow( vi_fila_actual)		
end event

event retrieveend;uo_1.visible = false
uo_1.porcentage(0)
retrieve_cancel = false

end event

type cb_cancelar from commandbutton within w_consulta_estoque_busca
integer x = 3383
integer y = 2388
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

event clicked;retrieve_cancel = false
Close(parent)


end event

type cb_ok from commandbutton within w_consulta_estoque_busca
integer x = 2949
integer y = 2392
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
	w_consulta_estoque.dw_1.retrieve(cod_prod)
	close(parent)
else
	close(parent)
end if

end event

type gb_1 from groupbox within w_consulta_estoque_busca
integer x = 69
integer y = 84
integer width = 3826
integer height = 2272
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

type uo_1 from u_progress_bar within w_consulta_estoque_busca
boolean visible = false
integer x = 1088
integer y = 696
integer taborder = 20
boolean bringtotop = true
end type

on uo_1.destroy
call u_progress_bar::destroy
end on

