$PBExportHeader$w_ajuste_estoque_busca.srw
forward
global type w_ajuste_estoque_busca from window
end type
type st_nehum from statictext within w_ajuste_estoque_busca
end type
type dw_1 from datawindow within w_ajuste_estoque_busca
end type
type cb_cancelar from commandbutton within w_ajuste_estoque_busca
end type
type cb_ok from commandbutton within w_ajuste_estoque_busca
end type
type gb_1 from groupbox within w_ajuste_estoque_busca
end type
end forward

global type w_ajuste_estoque_busca from window
integer width = 2665
integer height = 1824
boolean titlebar = true
string title = "Busca de Produtos"
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
st_nehum st_nehum
dw_1 dw_1
cb_cancelar cb_cancelar
cb_ok cb_ok
gb_1 gb_1
end type
global w_ajuste_estoque_busca w_ajuste_estoque_busca

type variables
Boolean adicao
end variables

on w_ajuste_estoque_busca.create
this.st_nehum=create st_nehum
this.dw_1=create dw_1
this.cb_cancelar=create cb_cancelar
this.cb_ok=create cb_ok
this.gb_1=create gb_1
this.Control[]={this.st_nehum,&
this.dw_1,&
this.cb_cancelar,&
this.cb_ok,&
this.gb_1}
end on

on w_ajuste_estoque_busca.destroy
destroy(this.st_nehum)
destroy(this.dw_1)
destroy(this.cb_cancelar)
destroy(this.cb_ok)
destroy(this.gb_1)
end on

event open;String descricao, item
Integer resultado

dw_1.settransobject(SQLCA)
item = w_ajuste_estoque.dw_2.GetText()

descricao = String("%" +item+"%")
resultado = dw_1.retrieve(descricao)

if resultado = 0 then
	st_nehum.visible = True
end if
end event

type st_nehum from statictext within w_ajuste_estoque_busca
boolean visible = false
integer x = 663
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

type dw_1 from datawindow within w_ajuste_estoque_busca
event enter pbm_dwnprocessenter
integer x = 114
integer y = 188
integer width = 2313
integer height = 1288
integer taborder = 10
string title = "none"
string dataobject = "d_ajuste_estoque_busca"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event enter;cb_ok.TriggerEvent("clicked")
end event

event doubleclicked;cb_ok.TriggerEvent("clicked")
end event

event rowfocuschanging;cb_ok.enabled = true
end event

type cb_cancelar from commandbutton within w_ajuste_estoque_busca
integer x = 2112
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

type cb_ok from commandbutton within w_ajuste_estoque_busca
integer x = 1678
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

event clicked;String cod_prod, descricao, und
Integer saldo
Decimal preco_custo

Integer ll_row, ll, ll_n
ll = w_ajuste_estoque.dw_2.GetRow()
ll_row = dw_1.GetRow()

	if ll_row > 0 then
		dw_1.settransobject(SQLCA)
		cod_prod = string( dw_1.GetItemString(ll_row,"codigo"))
		descricao = string( dw_1.GetItemString(ll_row,"descricao"))
		und = dw_1.GetItemString(ll_row,"und")
		preco_custo = dw_1.GetItemDecimal(ll_row,"preco_custo")
		saldo = dw_1.GetItemNumber(ll_row,"saldo")
	
		/* codigo já existe, soma a quantidade */
		FOR ll_n = 1 to w_ajuste_estoque.dw_2.RowCount()
   		    if (w_ajuste_estoque.dw_2.object.ajuste_produtos_codigo[ll_n]  =  cod_prod) then
				w_ajuste_estoque.dw_2.object.ajuste_produtos_quantidade[ll_n] = 	w_ajuste_estoque.dw_2.object.ajuste_produtos_quantidade[ll_n] + 1
				adicao = true
			end if
		NEXT
	
	
		if not adicao then
			w_ajuste_estoque.dw_2.object.ajuste_produtos_codigo[ll] = cod_prod
			w_ajuste_estoque.dw_2.object.produto_descricao[ll] = descricao
			w_ajuste_estoque.dw_2.object.produto_und[ll] = und
			w_ajuste_estoque.dw_2.object.ajuste_produtos_preco_custo[ll] = preco_custo
			w_ajuste_estoque.dw_2.object.ajuste_produtos_quantidade[ll] = 1
			
			if (w_ajuste_estoque.tipo = "ENTRADA") then
				w_ajuste_estoque.dw_2.SetItem(ll, 'ajuste_produtos_motivo', "SOBRA")
			else
				w_ajuste_estoque.dw_2.SetItem(ll, 'ajuste_produtos_motivo', "DEFEITO")
			end if
	
		w_ajuste_estoque.dw_2.SetTabOrder (2, 0)	
		w_ajuste_estoque.dw_2.SetColumn(5)
		close(parent)
		
			w_ajuste_estoque.dw_2.setfocus()
			w_ajuste_estoque.prossegue = true
			m_menu.m_editar.m_confirmar.enabled = true
			w_ajuste_estoque.m_confirmar = true
			m_menu.m_editar.m_incluir.enabled = true
			w_ajuste_estoque.m_incluir = true
			
		else // (adicao)
				
			close(parent)
			w_ajuste_estoque.dw_2.setfocus()
			w_ajuste_estoque.dw_2.object.produto_descricao[ll] = ""
			w_ajuste_estoque.prossegue = false
				
		end if
		
			
	end if //ll_row >

end event

type gb_1 from groupbox within w_ajuste_estoque_busca
integer x = 69
integer y = 84
integer width = 2432
integer height = 1436
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

