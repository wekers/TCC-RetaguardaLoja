$PBExportHeader$w_clientes_busca.srw
forward
global type w_clientes_busca from window
end type
type dw_1 from datawindow within w_clientes_busca
end type
type gb_1 from groupbox within w_clientes_busca
end type
type cb_cancelar from commandbutton within w_clientes_busca
end type
type cb_ok from commandbutton within w_clientes_busca
end type
end forward

global type w_clientes_busca from window
integer width = 5815
integer height = 2664
boolean titlebar = true
string title = "Lista de Clientes"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "Form!"
boolean clientedge = true
boolean center = true
dw_1 dw_1
gb_1 gb_1
cb_cancelar cb_cancelar
cb_ok cb_ok
end type
global w_clientes_busca w_clientes_busca

on w_clientes_busca.create
this.dw_1=create dw_1
this.gb_1=create gb_1
this.cb_cancelar=create cb_cancelar
this.cb_ok=create cb_ok
this.Control[]={this.dw_1,&
this.gb_1,&
this.cb_cancelar,&
this.cb_ok}
end on

on w_clientes_busca.destroy
destroy(this.dw_1)
destroy(this.gb_1)
destroy(this.cb_cancelar)
destroy(this.cb_ok)
end on

event open;String cliente_nome, nome
Integer resultado
cliente_nome = w_saida_top.dw_1.GetText()
nome = String("%" +cliente_nome+"%")

dw_1.settransobject(SQLCA)
resultado = dw_1.retrieve(nome)



end event

type dw_1 from datawindow within w_clientes_busca
event enter pbm_dwnprocessenter
integer x = 41
integer y = 168
integer width = 5522
integer height = 2076
integer taborder = 20
string title = "none"
string dataobject = "d_clientes_busca"
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

event clicked;String            ls_Object
ls_Object = String(dwo.name)


	If ls_Object = "t_id" Then

		dw_1.SetRedraw(false)
		dw_1.SetSort("id asc")
		dw_1.Sort()
		dw_1.SetRedraw(true)

	elseif ls_Object = "t_nome" Then
		dw_1.SetRedraw(false)
		dw_1.SetSort("nome asc")
		dw_1.Sort()
		dw_1.SetRedraw(true)
	elseif ls_Object = "t_apelido_ml" Then
		dw_1.SetRedraw(false)
		dw_1.SetSort("apelido_ml asc")
		dw_1.Sort()
		dw_1.SetRedraw(true)
	elseif ls_Object = "t_email" Then
		dw_1.SetRedraw(false)
		dw_1.SetSort("email asc")
		dw_1.Sort()
		dw_1.SetRedraw(true)
	elseif ls_Object = "t_fone" Then
		dw_1.SetRedraw(false)
		dw_1.SetSort("fone asc")
		dw_1.Sort()
		dw_1.SetRedraw(true)
	elseif ls_Object = "t_cidade" Then
		dw_1.SetRedraw(false)
		dw_1.SetSort("cidade asc")
		dw_1.Sort()
		dw_1.SetRedraw(true)
	elseif ls_Object = "t_uf" Then
		dw_1.SetRedraw(false)
		dw_1.SetSort("uf asc")
		dw_1.Sort()
		dw_1.SetRedraw(true)
	elseif ls_Object = "t_cnpj_cpf" Then
		dw_1.SetRedraw(false)
		dw_1.SetSort("cnpj_cpf asc")
		dw_1.Sort()
		dw_1.SetRedraw(true)

	End If
end event

type gb_1 from groupbox within w_clientes_busca
integer x = 23
integer y = 64
integer width = 5623
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

type cb_cancelar from commandbutton within w_clientes_busca
integer x = 5029
integer y = 2364
integer width = 375
integer height = 96
integer taborder = 40
boolean bringtotop = true
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

type cb_ok from commandbutton within w_clientes_busca
integer x = 4594
integer y = 2364
integer width = 357
integer height = 96
integer taborder = 30
boolean bringtotop = true
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "&OK"
end type

event clicked;Integer ll, id

ll = dw_1.GetRow()

if ll > 0 then

w_saida_top.dw_1.object.id_cliente[1] =  string(dw_1.GetItemNumber(ll,"id"))
w_saida_top.dw_1.object.t_nome_cliente.text =  dw_1.GetItemString(ll,"nome")
w_saida_top.dw_1.SetColumn(3)
w_saida_top.cb_ok.enabled = true	
close(parent)
else
close(parent)
end if

end event

