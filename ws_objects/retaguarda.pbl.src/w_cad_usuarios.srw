$PBExportHeader$w_cad_usuarios.srw
forward
global type w_cad_usuarios from window
end type
type tab_1 from tab within w_cad_usuarios
end type
type tabpage_1 from userobject within tab_1
end type
type dw_1 from datawindow within tabpage_1
end type
type tabpage_1 from userobject within tab_1
dw_1 dw_1
end type
type tab_1 from tab within w_cad_usuarios
tabpage_1 tabpage_1
end type
end forward

global type w_cad_usuarios from window
integer width = 6418
integer height = 2936
boolean titlebar = true
string title = "Cadastro de Usuários"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "UserObject5!"
boolean clientedge = true
event ue_incluir ( )
event ue_salvar ( )
event ue_excluir ( )
tab_1 tab_1
end type
global w_cad_usuarios w_cad_usuarios

type variables
Boolean m_confirmar, m_incluir, m_excluir, m_gerar, m_fechar, m_imprimir, incluir
Integer recuperar
String nome 


end variables

event ue_incluir();long linha

tab_1.tabpage_1.dw_1.Modify("cod.Protect='1~tIf(IsRowNew(),0,1)'")
tab_1.tabpage_1.dw_1.Modify("nome.Protect='1~tIf(IsRowNew(),0,1)'")
tab_1.tabpage_1.dw_1.SetTabOrder(1, 10)
tab_1.tabpage_1.dw_1.SetTabOrder(2, 20)
linha = tab_1.tabpage_1.dw_1.InsertRow(0)
tab_1.tabpage_1.dw_1.ScrollToRow(linha)
tab_1.tabpage_1.dw_1.SetColumn(1)


m_menu.m_editar.m_excluir.enabled = true
m_excluir = true
m_menu.m_editar.m_confirmar.enabled = false
m_confirmar = false
m_menu.m_editar.m_incluir.enabled = false
m_incluir = false
incluir = true
end event

event ue_salvar();Integer gravar, gravar2, ll, gravar_tabpage_2, cod_u
String nome

if (incluir) then
	ll = tab_1.tabpage_1.dw_1.GetRow()
	tab_1.tabpage_1.dw_1.settransobject(SQLCA)

	gravar = tab_1.tabpage_1.dw_1.Update(True, True)
     cod_u = tab_1.tabpage_1.dw_1.GetItemNumber(ll,"cod")
	nome =	tab_1.tabpage_1.dw_1.GetItemString(ll,"nome")

	if gravar = 1 then
	
		Commit;
	
		m_menu.m_editar.m_confirmar.enabled = false
		m_confirmar = false
		m_menu.m_editar.m_incluir.enabled = true
		m_incluir = true

		tab_1.tabpage_1.dw_1.Modify("cod.Protect='1'")
		tab_1.tabpage_1.dw_1.Modify("nome.Protect='1'")
		tab_1.tabpage_1.dw_1.SetTabOrder(1, 0)
		tab_1.tabpage_1.dw_1.SetTabOrder(2, 0)

		
		tab_1.tabpage_1.dw_1.Scrolltorow(ll)
		
	
		
			
		messagebox("Cadastro Usuários!","O Usuário [ "+ string(cod_u)+" - "+nome+" ] foi adicionado!")

			If sqlca.sqlcode <> 0 Then
				Messagebox("Error on Commit",Sqlca.sqlerrtext)
			End If
			
		incluir = false
			
	else
		
		RollBack;
			
	end if
	
end if



end event

event ue_excluir();Integer wk_ret, gravar, ll, cod_user, existe_venda, existe_entrada
String usuario
ll = tab_1.tabpage_1.dw_1.GetRow()


nome = tab_1.tabpage_1.dw_1.GetItemString(ll,"nome")
cod_user = tab_1.tabpage_1.dw_1.GetItemNumber(ll,"cod")
usuario = string(cod_user)

Select count(id)
Into :existe_venda
From movimento_saida
Where cod_vendedor = :cod_user;

Select count(id)
Into :existe_entrada
From movimento_entrada
Where usuario = :usuario;

If (existe_venda > 0) then
	Messagebox("Atenção", "Não é possível excluir: " + "[ " +String(tab_1.tabpage_1.dw_1.GetItemString(ll,"nome")) +" ]" &
	+" - Existem dados (vendas) vinculados a este Usuário(a)!", StopSign!)
elseIf (existe_entrada > 0) then
	Messagebox("Atenção", "Não é possível excluir: " + "[ " +String(tab_1.tabpage_1.dw_1.GetItemString(ll,"nome")) +" ]" &
	+" - Existem dados (entradas) vinculados a este Usuário(a)!", StopSign!)
	

else

	dwitemstatus    rowstatus

	IF tab_1.tabpage_1.dw_1.GetRow() > 0 THEN
		rowstatus = tab_1.tabpage_1.dw_1.GetItemStatus( tab_1.tabpage_1.dw_1.GetRow(), 0, Primary! )
	
		IF rowstatus = New! OR rowstatus = NewModified! THEN
	
			tab_1.tabpage_1.dw_1.DeleteRow(tab_1.tabpage_1.dw_1.GetRow())
			tab_1.tabpage_1.dw_1.Modify("cod.Protect='1'")
			tab_1.tabpage_1.dw_1.Modify("nome.Protect='1'")
			tab_1.tabpage_1.dw_1.SetTabOrder(1, 0)
			m_menu.m_editar.m_incluir.enabled = true
			m_incluir = true
			m_menu.m_editar.m_confirmar.enabled = false
			m_confirmar = false

	
		else


			wk_ret = MessageBox("Atenção", & 
					"Deseja Realmente Excluir o Usuário(a): " + "[" +String(tab_1.tabpage_1.dw_1.GetItemString(ll,"nome")) +"]", &
		    		 Exclamation!,YesNo!,1)


			IF wk_ret = 1 Then // escolhido Yes na msgBox
	
				
				
				tab_1.tabpage_1.dw_1.DeleteRow(tab_1.tabpage_1.dw_1.GetRow())
				tab_1.tabpage_1.dw_1.settransobject(SQLCA)
	
				gravar = tab_1.tabpage_1.dw_1.Update(True, True)

					If gravar = 1 Then
						Commit;
						messagebox("Cadastro Usuários!","O Usuário(a): " + "[ " +nome +" ] foi excluido!")
					Else
						
						//MessageBox("Erro",SQLCA.SQLErrText)
						RollBack;
						
						tab_1.tabpage_1.dw_1.RowsMove(1, tab_1.tabpage_1.dw_1.DeletedCount(), Delete!, tab_1.tabpage_1.dw_1, ll, Primary!) //move a linha deletada do 'buffer delete' para o 'buffer primario', como estava
						tab_1.tabpage_1.dw_1.ScrollToRow(ll)
						
					End If
							
							If tab_1.tabpage_1.dw_1.GetRow() = 0 THEN
				
								m_menu.m_editar.m_excluir.enabled = false
								m_excluir = false
														
							End If
							
					
			End if //fecha if wk_ret
			
		End if //fecha if rowstatus

	End If //fecha if getrow

End If //fecha if existe venda
end event

on w_cad_usuarios.create
this.tab_1=create tab_1
this.Control[]={this.tab_1}
end on

on w_cad_usuarios.destroy
destroy(this.tab_1)
end on

event open;m_fechar = True
m_incluir = True
m_gerar = False
m_confirmar = False
m_excluir = false



tab_1.tabpage_1.dw_1.settransobject(SQLCA)
recuperar = tab_1.tabpage_1.dw_1.retrieve()

if (recuperar > 0) then
m_menu.m_editar.m_excluir.enabled = true
m_excluir = True
tab_1.tabpage_1.dw_1.setfocus()
tab_1.tabpage_1.dw_1.ScrollToRow(1)
tab_1.tabpage_1.dw_1.SetColumn(1)
end if
	
end event

event activate;of_menu_activated( m_confirmar, m_incluir, m_excluir, m_gerar, m_imprimir, m_fechar)

end event

event close;of_menu_in_close()
end event

type tab_1 from tab within w_cad_usuarios
event create ( )
event destroy ( )
integer x = 41
integer y = 64
integer width = 5810
integer height = 1920
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
boolean raggedright = true
integer selectedtab = 1
tabpage_1 tabpage_1
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.Control[]={this.tabpage_1}
end on

on tab_1.destroy
destroy(this.tabpage_1)
end on

type tabpage_1 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 5774
integer height = 1792
long backcolor = 67108864
string text = "Usuários"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
dw_1 dw_1
end type

on tabpage_1.create
this.dw_1=create dw_1
this.Control[]={this.dw_1}
end on

on tabpage_1.destroy
destroy(this.dw_1)
end on

type dw_1 from datawindow within tabpage_1
integer x = 32
integer y = 44
integer width = 1833
integer height = 1768
integer taborder = 20
string dataobject = "d_cadastro_usuarios"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event editchanged;Choose case this.GetColumnName()
		
	Case 'nome'
		
		m_menu.m_editar.m_confirmar.enabled = true
		m_confirmar = true
		
End Choose



end event

event itemchanged;Integer ll
String cod, cod_crypto
ll = dw_1.GetRow()

Choose case this.GetColumnName()
		
	Case 'cod'
				
			cod = String(this.GetText())
			
			Blob lblb_data
			String ls_Base64Str

			lblb_data = Blob(cod, EncodingANSI!)

			CoderObject lnv_CoderObject
			lnv_CoderObject = Create CoderObject
     		ls_Base64Str = lnv_CoderObject.Base64Encode(lblb_data)
			this.object.senha[ll] = ls_Base64Str
			
			Case 'nome'
			m_menu.m_editar.m_confirmar.enabled = true	

			
End Choose
		
end event

event itemerror;return 1
end event

event dberror;

// 23503 	foreign_key_violation
if(of_GetSQLState(SQLErrtext) ='23503') then
	Messagebox("Atenção", "Não é possível excluir o Usuário(a): " + "[ " +nome +" ]" &
	+" - Existem vendas ou entradas que estão (cadastrados) vinculados a ele!", StopSign!)
else
	MessageBox("Erro SQL","Código erro: "+ of_GetSQLState(SQLErrtext) +" : "+ SQLErrText)
end if

Return 1
end event

