$PBExportHeader$w_cad_categoria.srw
forward
global type w_cad_categoria from window
end type
type dw_1 from datawindow within w_cad_categoria
end type
type gb_1 from groupbox within w_cad_categoria
end type
end forward

global type w_cad_categoria from window
integer width = 3168
integer height = 2664
boolean titlebar = true
string title = "Cadastro de Categoria"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
event ue_excluir ( )
event ue_incluir ( )
event ue_salvar ( )
dw_1 dw_1
gb_1 gb_1
end type
global w_cad_categoria w_cad_categoria

type variables
Boolean m_confirmar, m_incluir, m_excluir, m_gerar, m_fechar, m_imprimir, prossegue
end variables

event ue_excluir();
integer ll
ll = dw_1.GetRow()


dw_1.Modify("descricao.Protect='0'")

if dw_1.RowCount() = 1 then
	dw_1.DeleteRow(ll)
	dw_1.InsertRow(0)
	m_menu.m_editar.m_confirmar.enabled = false
	m_confirmar = false
	prossegue = false
else
	prossegue = true
	dw_1.DeleteRow(ll)

	m_menu.m_editar.m_confirmar.enabled = true
	m_confirmar = true
	
	
end if

end event

event ue_incluir();
if prossegue then
	long linha
	linha = dw_1.InsertRow(0)
	dw_1.ScrolltoRow(linha)
	m_menu.m_editar.m_excluir.enabled = true
	m_excluir = True
	m_menu.m_editar.m_confirmar.enabled = false
	m_confirmar = false
	dw_1.Modify("descricao.Protect='1~tIf(getrow() = rowcount(), 0, 1)'")
	prossegue = false

end if





end event

event ue_salvar();Integer gravar

dw_1.settransobject(SQLCA)
gravar = dw_1.Update(True, True)

	If gravar = 1 Then
	
		Commit;
		dw_1.reset()
		dw_1.retrieve()
		m_menu.m_editar.m_confirmar.enabled = False
		m_confirmar = False
		prossegue = false
	
	Else
		
		MessageBox("Erro ao gravar tipo de item",SQLCA.SQLErrText)
		RollBack;
	
End If
end event

on w_cad_categoria.create
this.dw_1=create dw_1
this.gb_1=create gb_1
this.Control[]={this.dw_1,&
this.gb_1}
end on

on w_cad_categoria.destroy
destroy(this.dw_1)
destroy(this.gb_1)
end on

event activate;of_menu_activated( m_confirmar, m_incluir, m_excluir, m_gerar, m_imprimir, m_fechar)
end event

event close;of_menu_in_close()
end event

event open;m_fechar = True
m_incluir = True
m_gerar = False
m_confirmar = False
m_excluir = False




Integer recuperar

dw_1.SetTransObject(SQLCA)
recuperar = dw_1.Retrieve()


if recuperar = 0 then
	dw_1.InsertRow(0)
else
m_menu.m_editar.m_excluir.enabled = true
m_excluir = true
Prossegue = True
end if
end event

type dw_1 from datawindow within w_cad_categoria
event enter pbm_dwnprocessenter
integer x = 325
integer y = 280
integer width = 1042
integer height = 2184
integer taborder = 10
string title = "none"
string dataobject = "d_cad_categoria"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event enter;w_cad_categoria.GetActiveSheet().TriggerEvent("ue_incluir")
end event

event editchanged;prossegue = True
m_menu.m_editar.m_confirmar.enabled = true
m_confirmar = true

end event

event itemchanged;String descricao

		


Choose case this.GetColumnName()
		
	Case	'descricao'
		
		descricao = this.GetText()
		
		long conta_linhas
		conta_linhas = dw_1.RowCount()
		
			long ll_n
			FOR ll_n = 1 to conta_linhas
				 if (dw_1.object.descricao[ll_n]  =  descricao) then
					prossegue = false
					Messagebox("Atenção","[ "+descricao+ "] já informado na linha n: "+string(ll_n))

					dw_1.DeleteRow(conta_linhas)
					prossegue = true
					dw_1.ScrollToRow(ll_n)
				     return 1

				end if
				
			NEXT
			
prossegue = true
dw_1.Modify("descricao.Protect='0'")	
End Choose
end event

event itemerror;return 1
end event

type gb_1 from groupbox within w_cad_categoria
integer x = 142
integer y = 120
integer width = 1554
integer height = 2380
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Cadastro de Categoria"
end type

