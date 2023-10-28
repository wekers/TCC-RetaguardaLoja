$PBExportHeader$w_cad_forma_pagamento.srw
forward
global type w_cad_forma_pagamento from window
end type
type dw_1 from datawindow within w_cad_forma_pagamento
end type
type gb_1 from groupbox within w_cad_forma_pagamento
end type
end forward

global type w_cad_forma_pagamento from window
integer width = 3168
integer height = 2520
boolean titlebar = true
string title = "Formas de Pagamento"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
event ue_salvar ( )
dw_1 dw_1
gb_1 gb_1
end type
global w_cad_forma_pagamento w_cad_forma_pagamento

type variables
Boolean m_confirmar, m_incluir, m_excluir, m_gerar, m_fechar
end variables

event ue_salvar();Integer gravar

dw_1.settransobject(SQLCA)
gravar = dw_1.Update(True, True)

	If gravar = 1 Then
	
		Commit;
		dw_1.reset()
		dw_1.Retrieve()
		m_menu.m_editar.m_confirmar.enabled = False
		m_confirmar = False



Else
		
		MessageBox("Erro",SQLCA.SQLErrText)
		RollBack;
	
End If
end event

on w_cad_forma_pagamento.create
this.dw_1=create dw_1
this.gb_1=create gb_1
this.Control[]={this.dw_1,&
this.gb_1}
end on

on w_cad_forma_pagamento.destroy
destroy(this.dw_1)
destroy(this.gb_1)
end on

event open;m_menu.m_editar.m_fechar.enabled = true
m_fechar = True
m_menu.m_editar.m_incluir.enabled = false
m_incluir = False
m_menu.m_editar.m_gerar.enabled = false
m_gerar = False
m_menu.m_editar.m_confirmar.enabled = false
m_confirmar = False
m_menu.m_editar.m_excluir.enabled = false
m_excluir = False


dw_1.SetTransObject(SQLCA)
dw_1.Retrieve()
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

type dw_1 from datawindow within w_cad_forma_pagamento
integer x = 233
integer y = 264
integer width = 1449
integer height = 1984
integer taborder = 10
string title = "none"
string dataobject = "d_cad_forma_pagamento"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;m_menu.m_editar.m_confirmar.enabled = true
m_confirmar = true
end event

type gb_1 from groupbox within w_cad_forma_pagamento
integer x = 87
integer y = 104
integer width = 1623
integer height = 2172
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Formas de Pagamento"
end type

