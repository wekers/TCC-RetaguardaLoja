$PBExportHeader$w_entrada_produtos.srw
forward
global type w_entrada_produtos from window
end type
type dw_2 from datawindow within w_entrada_produtos
end type
type dw_1 from datawindow within w_entrada_produtos
end type
end forward

global type w_entrada_produtos from window
integer width = 4626
integer height = 2032
boolean titlebar = true
string title = "Entrada de Mercadorias"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
long backcolor = 67108864
string icon = "DosEdit5!"
boolean center = true
event ue_salvar ( )
event ue_incluir ( )
event ue_excluir ( )
dw_2 dw_2
dw_1 dw_1
end type
global w_entrada_produtos w_entrada_produtos

type variables
Boolean m_confirmar, m_incluir, m_excluir, m_gerar, m_fechar, m_imprimir, prossegue, pular_coluna, adicao
Integer ll
String descricao
end variables

event ue_salvar();integer gravar, gravar_top, id_movimento
String ls_mod, ls_err, id_fornecedor

id_fornecedor = String(dw_1.GetItemnumber(1,"id_fornecedor"))
dw_1.object.usuario[1] = String(codigo_usuario)


if isNull(id_fornecedor) or (id_fornecedor = "") then
      messagebox("Atenção!","É obrigatório selecionar o fornecedor")
		

	  
else	
	
GetActiveSheet().TriggerEvent("ue_incluir")
GetActiveSheet().TriggerEvent("ue_excluir")

dw_1.settransobject(SQLCA)

gravar_top = dw_1.Update(True, True)

	if gravar_top = 1 then
		
	Commit;
	
	
			If sqlca.sqlcode <> 0 Then
				Messagebox("Error on Commit",Sqlca.sqlerrtext)
			End If
			
	
	id_movimento = dw_1.GetItemnumber(1,"id")
	
	
	dw_2.settransobject(SQLCA)
	long ll_n


	FOR ll_n = 1 to dw_2.RowCount()
   	    dw_2.object.entrada_produtos_codigo_movimento[ll_n]  =  id_movimento
		dw_2.object.entrada_produtos_preco_custo[ll_n] = dw_2.GetItemDecimal(ll_n, "produto_preco_custo")
		
		
		
	NEXT


gravar = dw_2.Update(True, True)
		
		If gravar = 1 Then
			
			long ll_nn
			double saldo_final
			String codigo_update
			
			FOR ll_nn = 1 to dw_2.RowCount()
				codigo_update = dw_2.GetitemString(ll_nn,"entrada_produtos_codigo")
				saldo_final = dw_2.GetitemNumber(ll_nn,"entrada_produtos_quantidade")
						
				UPDATE produto 
		      		SET saldo = saldo + :saldo_final  
		      			 WHERE codigo  = :codigo_update
		       		USING SQLCA ;
			NEXT
			
		Commit;
			
			If sqlca.sqlcode <> 0 Then
				Messagebox("Error on Commit",Sqlca.sqlerrtext)
			End If
			
		dw_1.reset()
		dw_1.insertrow(0)
		dw_2.reset()
		dw_2.insertrow(0)
		dw_1.object.data_entrada[1] = today()
		long linha
		this.dw_2.SetTabOrder (3, 10)
		dw_2.ScrollToRow(linha)
		dw_2.SetColumn(3)
	
		prossegue = false
			

		messagebox("Operação efetuada com sucesso!","O cadastro de entrada dos produtos foi efetuado com exito!")
		m_menu.m_editar.m_confirmar.enabled = False
		m_confirmar = False
		m_menu.m_editar.m_excluir.enabled = False
		m_excluir = False
		
		else // gravar <> 1
			
			Messagebox("Gravação de entrada falhou","Rolling back changes to " +&
			"d_entrada_child")
			RollBack;
			 
			
		End If
			
		else // if gravar_top <> 1
			
			Messagebox("Gravação de entrada falhou","Rolling back changes to " +&
									"d_entrada_top")
			RollBack;
		
		End If


End If // fecha if isNull(id_fornecedor)

	
end event

event ue_incluir();If prossegue Then
		
		long linha
		this.dw_2.SetTabOrder (3, 10)
		linha = dw_2.InsertRow(0)
		dw_2.ScrollToRow(linha)
		dw_2.SetColumn(3)
	
		prossegue = false
		m_menu.m_editar.m_excluir.enabled = true
		m_excluir = True
		m_menu.m_editar.m_confirmar.enabled = false
		m_confirmar = false
		

	
	End If
end event

event ue_excluir();If (dw_2.object.entrada_produtos_codigo[dw_2.RowCount()] = "") or isNull(dw_2.object.entrada_produtos_codigo[dw_2.RowCount()]) then 
	dw_2.SetTabOrder (3, 0)
	
end if

dw_2.DeleteRow(dw_2.GetRow())
prossegue = True
m_menu.m_editar.m_confirmar.enabled = True
m_confirmar = True
dw_1.object.valor_total[1] =					dw_2.object.compute_2[1]
end event

on w_entrada_produtos.create
this.dw_2=create dw_2
this.dw_1=create dw_1
this.Control[]={this.dw_2,&
this.dw_1}
end on

on w_entrada_produtos.destroy
destroy(this.dw_2)
destroy(this.dw_1)
end on

event open;m_fechar = True
m_incluir = True
m_gerar = False
m_confirmar = False
m_excluir = False

dw_1.settransobject(SQLCA)
dw_1.insertrow(0)

dw_1.object.data_entrada[1] = today()
dw_2.settransobject(SQLCA)
dw_2.insertrow(0)
dw_1.object.t_operador.text = nome_usuario
end event

event activate;of_menu_activated( m_confirmar, m_incluir, m_excluir, m_gerar, m_imprimir, m_fechar)
end event

event close;of_menu_in_close()

end event

type dw_2 from datawindow within w_entrada_produtos
event enter pbm_dwnprocessenter
integer x = 46
integer y = 524
integer width = 4311
integer height = 848
integer taborder = 20
string title = "none"
string dataobject = "d_entrada_child"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event enter;GetActiveSheet().TriggerEvent("ue_incluir")
end event

event itemchanged;
String codigo_prod, codigo_barras, codigo
Decimal preco_custo
ll = dw_2.GetRow()

Choose case this.GetColumnName()
		
			Case 'produto_descricao'
				
				codigo_prod = String (this.GetText())
					
				SELECT descricao, preco_custo, codigo_barras, codigo
					into :descricao, :preco_custo, :codigo_barras, :codigo
				FROM produto
				WHERE codigo = :codigo_prod or codigo_barras = :codigo_prod;

				if SQLCA.SQLCode = -1 then
					MessageBox ('Error', SQLCA.SQLErrText)
				end if

				long ll_n

				FOR ll_n = 1 to dw_2.RowCount()
   	  				  if (dw_2.object.entrada_produtos_codigo[ll_n]  =  codigo_prod or dw_2.object.produto_codigo_barras[ll_n] = codigo_prod) then
						dw_2.object.entrada_produtos_quantidade[ll_n] = 	dw_2.object.entrada_produtos_quantidade[ll_n] + 1
						adicao = true
					  end if
				NEXT


					if SQLCA.SQLCode = 100 then //100 vazio
						Open(w_entrada_busca)
						return 1

					else			
	
					
						if not adicao then
							
							this.object.entrada_produtos_codigo[ll] = codigo
							this.object.produto_descricao[ll] = descricao
							this.object.produto_preco_custo[ll] = preco_custo
							this.object.produto_codigo_barras[ll] = codigo_barras
							this.object.entrada_produtos_quantidade[ll] = 1
							this.SetTabOrder (3, 0)	
							this.SetColumn(2)
							prossegue = true
							m_menu.m_editar.m_confirmar.enabled = True
							m_confirmar = True
				
							return 1

						else
							
							adicao = false
							this.object.produto_descricao[ll] = "" 
							dw_1.object.valor_total[1] =					dw_2.object.compute_2[1]
							return 1


						end if
						
						
					end if
					
		
			
End Choose
	
end event

event itemerror;return 1
end event

event itemfocuschanged;dw_1.object.valor_total[1] =					dw_2.object.compute_2[1]
end event

event losefocus;dw_1.object.valor_total[1] =					dw_2.object.compute_2[1]
end event

event clicked;this.scrolltorow(row)
end event

event editchanged;Choose case this.GetColumnName()
		
			Case 'entrada_produtos_quantidade'

			if ( integer(this.GetText()) <= 0 ) then
      				//messagebox("Atenção!","A Quantidade tem que ser maior que 0, setando para 1")
					dw_2.SetColumn(2)
					m_confirmar = False
					m_menu.m_editar.m_confirmar.enabled = False
					//return 1
				else
					m_confirmar = true
					m_menu.m_editar.m_confirmar.enabled = True
				end if
				
		End choose
				
end event

type dw_1 from datawindow within w_entrada_produtos
integer x = 46
integer y = 80
integer width = 4329
integer height = 564
integer taborder = 10
string title = "none"
string dataobject = "d_entrada_top"
boolean border = false
boolean livescroll = true
end type

event itemerror;return 1
end event

