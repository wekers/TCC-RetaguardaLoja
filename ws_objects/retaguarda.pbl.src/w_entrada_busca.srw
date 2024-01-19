$PBExportHeader$w_entrada_busca.srw
forward
global type w_entrada_busca from window
end type
type st_nenhum from statictext within w_entrada_busca
end type
type cb_cancelar from commandbutton within w_entrada_busca
end type
type cb_ok from commandbutton within w_entrada_busca
end type
type dw_1 from datawindow within w_entrada_busca
end type
type gb_1 from groupbox within w_entrada_busca
end type
end forward

global type w_entrada_busca from window
integer width = 3186
integer height = 1988
boolean titlebar = true
string title = "Busca de Produtos"
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_nenhum st_nenhum
cb_cancelar cb_cancelar
cb_ok cb_ok
dw_1 dw_1
gb_1 gb_1
end type
global w_entrada_busca w_entrada_busca

type variables
Boolean adicao
end variables

on w_entrada_busca.create
this.st_nenhum=create st_nenhum
this.cb_cancelar=create cb_cancelar
this.cb_ok=create cb_ok
this.dw_1=create dw_1
this.gb_1=create gb_1
this.Control[]={this.st_nenhum,&
this.cb_cancelar,&
this.cb_ok,&
this.dw_1,&
this.gb_1}
end on

on w_entrada_busca.destroy
destroy(this.st_nenhum)
destroy(this.cb_cancelar)
destroy(this.cb_ok)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event open;String descricao, item
Integer resultado
dw_1.settransobject(SQLCA)
item = w_entrada_produtos.dw_2.GetText()

descricao = String("%" +item+"%")
resultado = dw_1.retrieve(descricao)

if resultado = 0 then
	st_nenhum.visible = True
end if
end event

type st_nenhum from statictext within w_entrada_busca
boolean visible = false
integer x = 818
integer y = 788
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

type cb_cancelar from commandbutton within w_entrada_busca
integer x = 2738
integer y = 1712
integer width = 375
integer height = 96
integer taborder = 20
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

type cb_ok from commandbutton within w_entrada_busca
integer x = 2304
integer y = 1716
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

event clicked;String cod_prod, cod_barras, descricao
Decimal preco_custo
Integer ll_row, ll, ll_n
ll = w_entrada_produtos.dw_2.GetRow()
ll_row = dw_1.GetRow()

if ll_row > 0 then
	dw_1.settransobject(SQLCA)
	cod_prod = string( dw_1.GetItemString(ll_row,"codigo"))
	cod_barras = string( dw_1.GetItemString(ll_row,"codigo_barras"))
	descricao = string( dw_1.GetItemString(ll_row,"descricao"))
	preco_custo = dw_1.GetItemDecimal(ll_row,"preco_custo")
	
	FOR ll_n = 1 to w_entrada_produtos.dw_2.RowCount()
   	    if (w_entrada_produtos.dw_2.object.entrada_produtos_codigo[ll_n]  =  cod_prod) then //adição, mesmo codigo que já foi inserido, então +1
				w_entrada_produtos.dw_2.object.entrada_produtos_quantidade[ll_n] = 	w_entrada_produtos.dw_2.object.entrada_produtos_quantidade[ll_n] + 1
				adicao = true
		end if
	NEXT
	
	
	if not adicao then
		w_entrada_produtos.dw_2.object.entrada_produtos_codigo[ll] = cod_prod
		w_entrada_produtos.dw_2.object.produto_codigo_barras[ll] = cod_barras
		w_entrada_produtos.dw_2.object.produto_descricao[ll] = descricao
		w_entrada_produtos.dw_2.object.produto_preco_custo[ll] = preco_custo
		w_entrada_produtos.dw_2.object.entrada_produtos_quantidade[ll] = 1
		w_entrada_produtos.dw_2.SetTabOrder (3, 0)	
		w_entrada_produtos.dw_2.SetColumn(2)
		close(parent)
		w_entrada_produtos.dw_2.setfocus()
		w_entrada_produtos.prossegue = true
		m_menu.m_editar.m_confirmar.enabled = True
		w_entrada_produtos.m_confirmar = True
			
	else //linha vazia de busca
		
		close(parent)
		w_entrada_produtos.dw_2.setfocus()
		w_entrada_produtos.dw_2.object.produto_descricao[ll] = ""
		w_entrada_produtos.prossegue = false
		
	end if


else
	Close(parent)
end if

w_entrada_produtos.dw_1.object.valor_total[1] =	w_entrada_produtos.dw_2.object.compute_2[1]
end event

type dw_1 from datawindow within w_entrada_busca
event enter pbm_dwnprocessenter
integer x = 114
integer y = 188
integer width = 2903
integer height = 1308
integer taborder = 10
string title = "none"
string dataobject = "d_entrada_busca"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event enter;cb_ok.TriggerEvent("clicked")
end event

event doubleclicked;cb_ok.TriggerEvent("clicked")
end event

event rowfocuschanging;cb_ok.enabled = true
end event

type gb_1 from groupbox within w_entrada_busca
integer x = 69
integer y = 84
integer width = 3049
integer height = 1576
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

