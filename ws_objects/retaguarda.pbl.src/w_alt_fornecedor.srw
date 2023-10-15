﻿$PBExportHeader$w_alt_fornecedor.srw
forward
global type w_alt_fornecedor from window
end type
type st_1 from statictext within w_alt_fornecedor
end type
type dw_1 from datawindow within w_alt_fornecedor
end type
type gb_1 from groupbox within w_alt_fornecedor
end type
end forward

global type w_alt_fornecedor from window
integer width = 3835
integer height = 2604
boolean titlebar = true
string title = "Fornecedores Cadastrados"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "DosEdit5!"
boolean center = true
event ue_excluir ( )
st_1 st_1
dw_1 dw_1
gb_1 gb_1
end type
global w_alt_fornecedor w_alt_fornecedor

type variables
Boolean m_confirmar, m_incluir, m_excluir, m_gerar, m_fechar
end variables

event ue_excluir();Integer gravar, wk_ret, ll
ll = dw_1.GetRow()

wk_ret = MessageBox("Atenção", & 
					"Deseja Realmente Excluir o Fornecedor: " + "[" +String(dw_1.GetItemString(ll,"nome")) +"]", &
		    		 Exclamation!,YesNo!,1)


IF wk_ret = 1 Then

	dw_1.DeleteRow(dw_1.GetRow())
	dw_1.settransobject(SQLCA)
	
	gravar = dw_1.Update(True, True)

		If gravar = 1 Then
			Commit;
		Else
			MessageBox("Erro",SQLCA.SQLErrText)
			RollBack;
		End If
		
End if
end event

on w_alt_fornecedor.create
this.st_1=create st_1
this.dw_1=create dw_1
this.gb_1=create gb_1
this.Control[]={this.st_1,&
this.dw_1,&
this.gb_1}
end on

on w_alt_fornecedor.destroy
destroy(this.st_1)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event open;dw_1.settransobject(SQLCA)
dw_1.retrieve()

m_menu.m_editar.m_fechar.enabled = true
m_fechar = True
m_menu.m_editar.m_incluir.enabled = false
m_incluir = False
m_menu.m_editar.m_gerar.enabled = false
m_gerar = False
m_menu.m_editar.m_confirmar.enabled = false
m_confirmar = False
m_menu.m_editar.m_excluir.enabled = true
m_excluir = True

end event

event activate;m_menu.m_editar.enabled = true
m_menu.m_editar.m_fechar.toolbaritemvisible = true
m_menu.m_editar.m_incluir.toolbaritemvisible = true
m_menu.m_editar.m_gerar.toolbaritemvisible = true
m_menu.m_editar.m_confirmar.toolbaritemvisible = true
m_menu.m_editar.m_excluir.toolbaritemvisible = true

If m_confirmar then
	m_menu.m_editar.m_confirmar.enabled = True
Else
	m_menu.m_editar.m_confirmar.enabled = False
End If

If m_incluir then
	m_menu.m_editar.m_incluir.enabled = True
Else
	m_menu.m_editar.m_incluir.enabled = False
End If
	
If m_gerar then
	m_menu.m_editar.m_gerar.enabled = True
Else
	m_menu.m_editar.m_gerar.enabled = False
End If

If m_excluir then
	m_menu.m_editar.m_excluir.enabled = True
Else
	m_menu.m_editar.m_excluir.enabled = False
End If

If m_fechar then
	m_menu.m_editar.m_fechar.enabled = True
Else
	m_menu.m_editar.m_fechar.enabled = False
End If
end event

event close;m_menu.m_editar.enabled = false
m_menu.m_editar.m_fechar.toolbaritemvisible = false
m_menu.m_editar.m_incluir.toolbaritemvisible = false
m_menu.m_editar.m_gerar.toolbaritemvisible = false
m_menu.m_editar.m_confirmar.toolbaritemvisible = false
m_menu.m_editar.m_excluir.toolbaritemvisible = false
end event

type st_1 from statictext within w_alt_fornecedor
integer x = 69
integer y = 1964
integer width = 1691
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 16711680
long backcolor = 67108864
string text = "* De um duplo click com o mouse sobre o item para acessar as propriedades"
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_alt_fornecedor
integer x = 160
integer y = 192
integer width = 2158
integer height = 1704
integer taborder = 10
string dataobject = "d_alt_fornecedor"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;Open(w_alt_fornecedor_dados)
end event

event dberror;CHOOSE CASE sqldbcode

        CASE -198

        MessageBox("Erro na Exclusão", "Não é possivel excluir o fornecedor, pois existe dados vinculados ao mesmo. Duvidas contate o Analista do Sistema")


END CHOOSE

RETURN 1




end event

type gb_1 from groupbox within w_alt_fornecedor
integer x = 59
integer y = 84
integer width = 2386
integer height = 1856
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Lista de Fornecedores"
end type

