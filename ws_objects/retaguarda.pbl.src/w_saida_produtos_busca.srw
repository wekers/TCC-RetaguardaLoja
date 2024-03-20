$PBExportHeader$w_saida_produtos_busca.srw
forward
global type w_saida_produtos_busca from window
end type
type st_nehum from statictext within w_saida_produtos_busca
end type
type cb_cancelar from commandbutton within w_saida_produtos_busca
end type
type cb_ok from commandbutton within w_saida_produtos_busca
end type
type dw_1 from datawindow within w_saida_produtos_busca
end type
type gb_1 from groupbox within w_saida_produtos_busca
end type
end forward

global type w_saida_produtos_busca from window
integer width = 2976
integer height = 1872
boolean titlebar = true
string title = "Busca de produtos"
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
global w_saida_produtos_busca w_saida_produtos_busca

type variables
Boolean adicao
end variables

on w_saida_produtos_busca.create
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

on w_saida_produtos_busca.destroy
destroy(this.st_nehum)
destroy(this.cb_cancelar)
destroy(this.cb_ok)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event open;String descricao, item
Integer resultado
dw_1.settransobject(SQLCA)
item = w_saida_produtos.dw_1.GetText()

descricao = String("%" +item+"%")
resultado = dw_1.retrieve(descricao)

if resultado = 0 then
	st_nehum.visible = True
end if

dw_1.object.codigo.Color =  "0~tIf(saldo<0,255,if(saldo=0,16711680,0))"
dw_1.object.descricao.Color =  "0~tIf(saldo<0,255,if(saldo=0,16711680,0))"
dw_1.object.und.Color =  "0~tIf(saldo<0,255,if(saldo=0,16711680,0))"
dw_1.object.saldo.Color =  "0~tIf(saldo<0,255,if(saldo=0,16711680,0))"

end event

type st_nehum from statictext within w_saida_produtos_busca
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

type cb_cancelar from commandbutton within w_saida_produtos_busca
integer x = 2139
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

type cb_ok from commandbutton within w_saida_produtos_busca
integer x = 1705
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
Integer desconto
Decimal preco_venda, preco_custo
Integer ll_row, ll, ll_n, saldo
ll = w_saida_produtos.dw_1.GetRow()
ll_row = dw_1.GetRow()

if ll_row > 0 then
	dw_1.settransobject(SQLCA)
	cod_prod = string( dw_1.GetItemString(ll_row,"codigo"))
	descricao = string( dw_1.GetItemString(ll_row,"descricao"))
	und = dw_1.GetItemString(ll_row,"und")
	preco_venda = dw_1.GetItemDecimal(ll_row,"preco_venda")
	desconto = dw_1.GetItemNumber(ll_row,"desconto")
	preco_custo = dw_1.GetItemNumber(ll_row,"preco_custo")
	saldo = dw_1.GetItemNumber(ll_row,"saldo")
	
	
/* não deixar adicionar produtos com saldo <= 0 */	
/*if saldo <= 0 and not descricao = "" then
	MessageBox ("Atenção!", "O produto: "+ '~r~n' +string(descricao)+ '~r~n' +"possui saldo "+string(saldo), Information!) 
	return 1
end if*/
	
	FOR ll_n = 1 to w_saida_produtos.dw_1.RowCount()
   	    if (w_saida_produtos.dw_1.object.saida_produtos_codigo[ll_n]  =  cod_prod) then
				w_saida_produtos.dw_1.object.saida_produtos_quantidade[ll_n] = 	w_saida_produtos.dw_1.object.saida_produtos_quantidade[ll_n] + 1
				adicao = true
		end if
	NEXT
	
	
	if not adicao then
	w_saida_produtos.dw_1.object.saida_produtos_codigo[ll] = cod_prod
	w_saida_produtos.dw_1.object.produto_descricao[ll] = descricao
	w_saida_produtos.dw_1.object.produto_und[ll] = und
	w_saida_produtos.dw_1.object.saida_produtos_preco[ll] = preco_venda
	w_saida_produtos.dw_1.object.saida_produtos_desconto[ll] = desconto
	w_saida_produtos.dw_1.object.saida_produtos_quantidade[ll] = 1
	w_saida_produtos.dw_1.object.saida_produtos_preco_custo[ll] = preco_custo
	
	w_saida_produtos.dw_1.SetTabOrder (6, 0)	
	w_saida_produtos.dw_1.SetColumn(2)
		w_saida_produtos.dw_1.SetTabOrder (2,10)	
		w_saida_produtos.dw_1.SetTabOrder (4,20)	
	close(parent)
	w_saida_produtos.dw_1.setfocus()
	w_saida_produtos.prossegue = true
			
else
	close(parent)
	w_saida_produtos.dw_1.setfocus()
	w_saida_produtos.dw_1.object.produto_descricao[ll] = ""
	w_saida_produtos.prossegue = false
end if
else
	Close(parent)
end if

end event

type dw_1 from datawindow within w_saida_produtos_busca
event enter pbm_dwnprocessenter
integer x = 114
integer y = 188
integer width = 2779
integer height = 1288
integer taborder = 10
string title = "none"
string dataobject = "d_saida_produtos_busca"
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

type gb_1 from groupbox within w_saida_produtos_busca
integer x = 69
integer y = 84
integer width = 2853
integer height = 1432
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

