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
type tabpage_2 from userobject within tab_1
end type
type cbx_sel_todos from checkbox within tabpage_2
end type
type st_nome from statictext within tabpage_2
end type
type cb_salvar from commandbutton within tabpage_2
end type
type st_1 from statictext within tabpage_2
end type
type gb_1 from groupbox within tabpage_2
end type
type dw_2 from datawindow within tabpage_2
end type
type tabpage_2 from userobject within tab_1
cbx_sel_todos cbx_sel_todos
st_nome st_nome
cb_salvar cb_salvar
st_1 st_1
gb_1 gb_1
dw_2 dw_2
end type
type tab_1 from tab within w_cad_usuarios
tabpage_1 tabpage_1
tabpage_2 tabpage_2
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

event ue_salvar();Integer gravar, gravar2, ll, gravar_tabpage_2, cod_usuario

if (incluir) then
	ll = tab_1.tabpage_1.dw_1.GetRow()
	tab_1.tabpage_1.dw_1.settransobject(SQLCA)

	gravar = tab_1.tabpage_1.dw_1.Update(True, True)
     cod_usuario = tab_1.tabpage_1.dw_1.GetItemNumber(ll,"cod")
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

		
		tab_1.tabpage_2.enabled = true
		tab_1.tabpage_1.dw_1.Scrolltorow(ll)
		
	
	//*** Insere no banco de dados conforme nome de menus
	long li_totalitem[],li_a
	string tabela
	li_totalitem[1] = upperbound (w_index.menuid.item);
	
	FOR li_a = 1 to li_totalitem[1]
		tabela = w_index.menuid.item[li_a].classname() ;

		If not (tabela = "m_editar" or tabela = "m_sistema") Then //menus que não são necessários ter restrição

			string      insert_sql
 			insert_sql = "INSERT INTO "+tabela  + " (cod) " &
							+ "VALUES  ("+ string(cod_usuario)+")"
		 					EXECUTE IMMEDIATE :insert_sql ;	
	 
		end if
		
	NEXT
	//***		
			
	If sqlca.sqlcode <> 0 Then
		Messagebox("Error on Commit",Sqlca.sqlerrtext)
		return
	End If
			
	incluir = false
	Commit;

	messagebox("Cadastro Usuários!","O Usuário [ "+ string(cod_usuario)+" - "+nome+" ] foi adicionado!")

	else //gravar <> 1
		
		RollBack;
			
	end if
	
end if //fecha if (incluir) 





end event

event ue_excluir();Integer wk_ret, gravar, ll, cod_user, existe_venda, existe_entrada
String usuario
ll = tab_1.tabpage_1.dw_1.GetRow()

nome = tab_1.tabpage_1.dw_1.GetItemString(ll,"nome")
cod_user = tab_1.tabpage_1.dw_1.GetItemNumber(ll,"cod")
usuario = string(cod_user)

//verifica se existe dados vinculados ao usuário
SELECT count(id)
	Into :existe_venda
FROM movimento_saida
WHERE cod_vendedor = :cod_user;

SELECT count(id)
	Into :existe_entrada
FROM movimento_entrada
WHERE usuario = :usuario;

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
		    		 Exclamation!,YesNo!,2) // 2 default "Não"


			IF wk_ret = 1 Then // escolhido Sim na msgBox
			
				// *** Delete db menus primeiro, pois são FOREIGN KEY
				long li_totalitem[],li_a
				string tabela
				li_totalitem[1] = upperbound (w_index.menuid.item);
	
				FOR li_a = 1 to li_totalitem[1]
					
					tabela = w_index.menuid.item[li_a].classname() ;
					If not (tabela = "m_editar" or tabela = "m_sistema") Then

					string      delete_sql
 					delete_sql = "DELETE FROM "+tabela &
									+ " WHERE cod = " +string(cod_user)
		 						EXECUTE IMMEDIATE :delete_sql ;	
	 
					end if
					
				NEXT
              	// ***
				
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
							
					If tab_1.tabpage_1.dw_1.GetRow() = 0 THEN //sem linhas para exibir?
				
						m_menu.m_editar.m_excluir.enabled = false
						m_excluir = false
						tab_1.tabpage_2.enabled = false
						
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
integer width = 4727
integer height = 1736
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
tabpage_2 tabpage_2
end type

on tab_1.create
this.tabpage_1=create tabpage_1
this.tabpage_2=create tabpage_2
this.Control[]={this.tabpage_1,&
this.tabpage_2}
end on

on tab_1.destroy
destroy(this.tabpage_1)
destroy(this.tabpage_2)
end on

event selectionchanging;Integer ll, ll_n
ll = this.tabpage_1.dw_1.getrow()

if(recuperar > 0) then

	Integer codigo
	codigo = this.tabpage_1.dw_1.GetItemNumber(ll,"cod")
	nome = this.tabpage_1.dw_1.GetItemString(ll,"nome")


	If (This.Control[newindex].Text = "Permissões") then

		m_menu.m_editar.m_fechar.enabled = true
		m_menu.m_editar.m_incluir.enabled = false
		m_menu.m_editar.m_gerar.enabled = false
		m_menu.m_editar.m_confirmar.enabled = false
		m_menu.m_editar.m_excluir.enabled = false
		this.tabpage_2.st_nome.text = "[ "+ string(codigo)+" "+nome+" ]"
		this.tabpage_2.dw_2.settransobject(SQLCA)
		integer retrieve_tab_permicoes
		retrieve_tab_permicoes = this.tabpage_2.dw_2.retrieve(codigo)
		
		
	else
		w_cad_usuarios.TriggerEvent("activate")
	end if


	this.tabpage_2.st_nome.text = "[ "+ string(codigo)+" ] "+nome
	

End if



long li_totalitem[],li_a,li_b,li_c;
string ls_name, ls_name_nivel2, ls_name_nivel3, ls_name_text;

	li_totalitem[1] = upperbound (w_index.menuid.item);
	
	 //obtemos a dimencao de item em nivel 1
	for li_a = 1 to li_totalitem[1]
		ls_name = w_index.menuid.item[li_a].classname() ;
		li_totalitem[2] = upperbound (w_index.menuid.item[li_a].item);
	
		 	//obtemos a dimencao de item em nivel 2
			For 	li_b = 1 to li_totalitem[2]
				ls_name_nivel2 = w_index.menuid.item[li_a].item[li_b].classname();
				
				If not ( ls_name = "m_editar" or ls_name = "m_sistema" or ls_name_nivel2 = "m_0" or ls_name_nivel2 =  "m_1") Then

				
					ls_name_text = w_index.menuid.item[li_a].item[li_b].text;
				
					string texto_menu
					texto_menu = 	ls_name+"_"+ls_name_nivel2+".CheckBox.text='"+ls_name_text+"'"
	
					//	messagebox("O menu: ",ls_name_nivel2+"texto: "+ls_name_text+" modify = "+texto_menu)
	
					this.tabpage_2.dw_2.Modify(texto_menu)
				
				end if
			
			
	   			 //obtemos a dimencao de item em nivel 3
				li_totalitem[3] = upperbound (w_index.menuid.item[li_a].item[li_b].item);


				For 	li_c = 1 to li_totalitem[3]
					ls_name_nivel3 = w_index.menuid.item[li_a].item[li_b].item[li_c].classname() ;
					string 				ls_name_text3 
					ls_name_text3 = w_index.menuid.item[li_a].item[li_b].item[li_c].text ;
								
				
					integer resultado_nivel3	
					SELECT count(column_name)
						into :resultado_nivel3
					FROM information_schema.columns 
					WHERE table_name=  :ls_name and column_name= :ls_name_nivel3;
			
					If (resultado_nivel3 > 0) Then

						texto_menu = 	ls_name+"_"+ls_name_nivel3+".CheckBox.text='"+ls_name_text+"->"+ls_name_text3+"'"
						this.tabpage_2.dw_2.Modify(texto_menu)
	
					end if
					
					
				next //fecha laço for nivel 3
				
				
			next //fecha laço for nivel 2
			

	next //fecha laço for nivel 1
	
	
	
		



end event

type tabpage_1 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 4690
integer height = 1608
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
integer width = 1829
integer height = 1528
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

event getfocus;tab_1.tabpage_2.enabled = true
end event

type tabpage_2 from userobject within tab_1
event create ( )
event destroy ( )
integer x = 18
integer y = 112
integer width = 4690
integer height = 1608
boolean enabled = false
long backcolor = 67108864
string text = "Permissões"
long tabtextcolor = 33554432
long picturemaskcolor = 536870912
cbx_sel_todos cbx_sel_todos
st_nome st_nome
cb_salvar cb_salvar
st_1 st_1
gb_1 gb_1
dw_2 dw_2
end type

on tabpage_2.create
this.cbx_sel_todos=create cbx_sel_todos
this.st_nome=create st_nome
this.cb_salvar=create cb_salvar
this.st_1=create st_1
this.gb_1=create gb_1
this.dw_2=create dw_2
this.Control[]={this.cbx_sel_todos,&
this.st_nome,&
this.cb_salvar,&
this.st_1,&
this.gb_1,&
this.dw_2}
end on

on tabpage_2.destroy
destroy(this.cbx_sel_todos)
destroy(this.st_nome)
destroy(this.cb_salvar)
destroy(this.st_1)
destroy(this.gb_1)
destroy(this.dw_2)
end on

type cbx_sel_todos from checkbox within tabpage_2
integer x = 119
integer y = 1304
integer width = 535
integer height = 80
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Selecionar Todos"
end type

event clicked;Integer li_col_count, i, valor
string colunas[]


if (this.Checked = true) then
	valor = 1
else
	valor = 0	
end if


li_col_count = integer(tab_1.tabpage_2.dw_2.Describe("DataWindow.Column.Count"))

FOR i = 1 TO li_col_count

	colunas[i] =tab_1.tabpage_2.dw_2.Describe("#" + String(i) + ".Name") // nome da coluna
	tab_1.tabpage_2.dw_2.SetItem ( 1, colunas[i], valor ) // row, coluna, valor a setar 
	tab_1.tabpage_2.dw_2.object.m_usuarios_m_trocarusuario[1] = 1 //sempre 1
	tab_1.tabpage_2.dw_2.object.m_usuarios_m_alterarsenha[1] = 1 //sempre 1

NEXT

tab_1.tabpage_2.cb_salvar.enabled = true
 
end event

type st_nome from statictext within tabpage_2
integer x = 1065
integer y = 48
integer width = 882
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 8421376
long backcolor = 67108864
boolean focusrectangle = false
end type

type cb_salvar from commandbutton within tabpage_2
integer x = 791
integer y = 1284
integer width = 585
integer height = 120
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "&Salvar Permissões"
end type

event clicked;integer ll, gravar_tab2
ll = tab_1.tabpage_1.dw_1.GetRow()

Integer cod_usuario
cod_usuario = tab_1.tabpage_1.dw_1.GetItemNumber(ll,"cod")
nome = tab_1.tabpage_1.dw_1.GetItemString(ll,"nome")


//1. Nome das Colunas
Integer li_col_count, i, valor
string ls_columns[], valor_columns[], tabela[], ls_columns_name[]


li_col_count = integer(tab_1.tabpage_2.dw_2.Describe("DataWindow.Column.Count"))

FOR i = 1 TO li_col_count

	ls_columns[i] =tab_1.tabpage_2.dw_2.Describe("#" + String(i) + ".dbName") // db + .tabelas


	//2. Substitui o caractere . por _
	IF POS(ls_columns[i], ".") > 0 THEN
		valor_columns[i] = Replace (ls_columns[i], POS(ls_columns[i], "."), 1, "_")
	END IF

	//3. Valor atual das colunas
	valor 	= tab_1.tabpage_2.dw_2.getitemnumber(1,valor_columns[i])

	//4. substitui todos caracteres a direita de . por ""
	//*pega somente o nome da tabela*
	IF POS(ls_columns[i], ".") > 0 THEN
		integer tam
		tam = len(ls_columns[i])
		tabela[i] = Replace (ls_columns[i], POS(ls_columns[i], "."), tam, " ")
	END IF

	//5. substitui todos caracteres a esquerda de . por ""
	//*pega somente o nome da coluna*
	IF POS(ls_columns[i], ".") > 0 THEN
		integer tam_nome_tabela
		tam_nome_tabela = len(tabela[i])
		ls_columns_name[i] = Replace (ls_columns[i], 1, tam_nome_tabela, " ")
	END IF


	// ********************************
	//6. Update db pelos valores atuais
	string sql_syntax
	
		sql_syntax = "UPDATE  "+ tabela[i] &
						+ " SET "+ ls_columns_name[i] + "= "+ string(valor) &
						+ " WHERE  cod = " +string(cod_usuario )
	
	EXECUTE IMMEDIATE :sql_syntax USING SQLCA ;
	// ********************************


	If sqlca.sqlcode <> 0 Then
		Messagebox("Error cadatro_usuarios -> permições",Sqlca.sqlerrtext)
		return 1
	End If
	
NEXT


this.enabled = false
Commit;
messagebox("Permissões!","As permissões de [ "+ string(cod_usuario)+" - "+nome+" ], foram salvas!")


end event

type st_1 from statictext within tabpage_2
integer x = 50
integer y = 48
integer width = 1010
integer height = 64
boolean bringtotop = true
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Janelas permitidas ao Usuário(a) Cod:"
boolean focusrectangle = false
end type

type gb_1 from groupbox within tabpage_2
integer x = 73
integer y = 1232
integer width = 617
integer height = 192
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
end type

type dw_2 from datawindow within tabpage_2
integer x = 23
integer y = 108
integer width = 4617
integer height = 1436
integer taborder = 40
string title = "none"
string dataobject = "d_usuarios_permissoes"
boolean border = false
boolean livescroll = true
end type

event itemchanged;tab_1.tabpage_2.cb_salvar.enabled = true



Choose case this.GetColumnName()
		
	Case 'm_cadastro_m_alterar'
				
			if (dw_2.Object.m_cadastro_m_alterar[1] = 1) then
				dw_2.Object.m_cadastro_m_alterar_fornecedor[1] = 0
				dw_2.Object.m_cadastro_m_alterar_produto[1] = 0
			end if
			
	Case 'm_cadastro_m_alterar_fornecedor', 'm_cadastro_m_alterar_produto'
	
			if (dw_2.Object.m_cadastro_m_alterar_fornecedor[1] = 0 or dw_2.Object.m_cadastro_m_alterar_produto[1] = 0 ) then
				dw_2.Object.m_cadastro_m_alterar[1] = 1
			end if
			
	
	Case 'm_consulta_m_consulta_doc'
			
			if (dw_2.Object.m_consulta_m_consulta_doc[1] = 1) then
				dw_2.Object.m_consulta_m_doc_ajustedeestoque[1] = 0
				dw_2.Object.m_consulta_m_doc_entrada[1] = 0
				dw_2.Object.m_consulta_m_doc_venda[1] = 0
				dw_2.Object.m_consulta_m_doc_devolucao[1] = 0
			end if
			
	Case 'm_consulta_m_doc_ajustedeestoque', 'm_consulta_m_doc_entrada', 'm_consulta_m_doc_venda', 'm_consulta_m_doc_devolucao'
			
			if (dw_2.Object.m_consulta_m_doc_ajustedeestoque[1] = 0 or dw_2.Object.m_consulta_m_doc_entrada[1] = 0 or &
				dw_2.Object.m_consulta_m_doc_venda[1] = 0 or	dw_2.Object.m_consulta_m_doc_devolucao[1] = 0) then
				dw_2.Object.m_consulta_m_consulta_doc[1] = 1
			end if

End Choose

end event

