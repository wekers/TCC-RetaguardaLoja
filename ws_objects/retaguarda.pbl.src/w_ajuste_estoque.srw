$PBExportHeader$w_ajuste_estoque.srw
forward
global type w_ajuste_estoque from window
end type
type dw_2 from datawindow within w_ajuste_estoque
end type
type dw_1 from datawindow within w_ajuste_estoque
end type
end forward

global type w_ajuste_estoque from window
integer width = 3950
integer height = 2284
boolean titlebar = true
string title = "Ajuste de Estoque"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
long backcolor = 67108864
string icon = "RunReport5!"
boolean center = true
event ue_incluir ( )
event ue_excluir ( )
event ue_salvar ( )
dw_2 dw_2
dw_1 dw_1
end type
global w_ajuste_estoque w_ajuste_estoque

type variables
Boolean m_confirmar, m_incluir, m_excluir, m_gerar, m_fechar, m_imprimir, prossegue, adicao
String tipo
end variables

event ue_incluir();If prossegue Then
		
		long linha
		this.dw_2.SetTabOrder (2, 10)
		linha = dw_2.InsertRow(0)
		dw_2.ScrollToRow(linha)
		dw_2.SetColumn(2)
		prossegue = false
		m_menu.m_editar.m_excluir.enabled = true
		m_excluir = True
		m_menu.m_editar.m_confirmar.enabled = false
		m_confirmar = False
		m_menu.m_editar.m_incluir.enabled = false
		m_incluir = False
		
	
	End If
end event

event ue_excluir();dw_2.DeleteRow(dw_2.GetRow())

if (dw_2.RowCount() = 0) then
	m_menu.m_editar.m_confirmar.enabled = false
	m_confirmar = false
	m_menu.m_editar.m_excluir.enabled = false
	m_excluir = false
	prossegue = true
else
	prossegue = True
	m_menu.m_editar.m_confirmar.enabled = true
	m_confirmar = true
	m_menu.m_editar.m_incluir.enabled = True
	m_incluir = True
end if
end event

event ue_salvar();integer gravar, gravar_top

String ls_mod, ls_err, id_fornecedor
long id_movimento


dw_1.settransobject(SQLCA)

gravar_top = dw_1.Update(True, True)

	if gravar_top = 1 then
	
		Commit;
	
		If sqlca.sqlcode <> 0 Then
			Messagebox("Error on Commit",Sqlca.sqlerrtext)
		End If
			
		dw_2.settransobject(SQLCA)
		id_movimento = long(dw_1.GetItemnumber(1,"id"))

		long ll_n
		FOR ll_n = 1 to dw_2.RowCount()
   		    dw_2.object.ajuste_produtos_codigo_movimento[ll_n]  =  id_movimento
		NEXT

		gravar = dw_2.Update(True, True)
		
		If gravar = 1 Then
				
			long ll_nn 
			double saldo_final
			String codigo_update
			
			FOR ll_nn = 1 to dw_2.RowCount()
				codigo_update = dw_2.GetitemString(ll_nn,"ajuste_produtos_codigo")
				saldo_final = dw_2.GetitemNumber(ll_nn,"ajuste_produtos_quantidade")
				
				if (tipo = "ENTRADA") then
					
					UPDATE produto 
				      	SET saldo = saldo + :saldo_final  
					WHERE codigo  = :codigo_update
				     USING SQLCA ;
					  
				else // "SAIDA"
					
					UPDATE produto 
				      	SET saldo = saldo - :saldo_final  
				     WHERE codigo  = :codigo_update
				     USING SQLCA ;
				end if
				
			NEXT
				
			Commit;
			
			If sqlca.sqlcode <> 0 Then
				Messagebox("Error on Commit",Sqlca.sqlerrtext)
			End If
			
			dw_1.reset()
			dw_1.insertrow(0)
			dw_1.object.cod_operador[1] = String(codigo_usuario)
			dw_2.reset()
			dw_1.SetTabOrder (1, 10)	
			dw_2.SetTabOrder (2, 10)	
			prossegue = false
			m_menu.m_editar.m_confirmar.enabled = False
			m_confirmar = False
			m_menu.m_editar.m_excluir.enabled = False
			m_excluir = False
			MessageBox("Operação Realizada", "O ajuste de estoque foi efetuada com exito")
		
		Else //gravar <> 1
			
			Messagebox("Gravação de ajuste falhou","Rolling back changes to " +&
			"d_ajuste_estoque_produtos")
			RollBack;
			return
			
		End If
		
		
			
	else //gravar_top <> 1
			
		Messagebox("Gravação de ajuste falhou","Rolling back changes to " +&
	 						"d_ajuste_estoque_top")
		RollBack;
		return
			
	End If


	

end event

on w_ajuste_estoque.create
this.dw_2=create dw_2
this.dw_1=create dw_1
this.Control[]={this.dw_2,&
this.dw_1}
end on

on w_ajuste_estoque.destroy
destroy(this.dw_2)
destroy(this.dw_1)
end on

event open;m_fechar = True
m_incluir = False
m_gerar = False
m_confirmar = False
m_excluir = False

dw_1.insertrow(0)
dw_1.object.cod_operador[1] = String(codigo_usuario)
end event

event activate;of_menu_activated( m_confirmar, m_incluir, m_excluir, m_gerar, m_imprimir, m_fechar)
end event

event close;of_menu_in_close()
end event

type dw_2 from datawindow within w_ajuste_estoque
event enter pbm_dwnprocessenter
integer x = 59
integer y = 228
integer width = 3639
integer height = 1816
integer taborder = 20
string title = "none"
string dataobject = "d_ajuste_estoque_produtos"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event enter;GetActiveSheet().TriggerEvent("ue_incluir")
end event

event itemerror;return 1
end event

event itemchanged;String cod_produto, descricao, und, codigo
Decimal preco_custo
Integer ll

ll = dw_2.GetRow()

Choose Case this.GetColumnName()
		
	Case 'produto_descricao'
		
		cod_produto = this.GetText()
		
		SELECT descricao, codigo, und, preco_custo
			into :descricao, :codigo, :und, :preco_custo
		FROM produto
		WHERE codigo = :cod_produto;

		if SQLCA.SQLCode = -1 then
			MessageBox ('Error', SQLCA.SQLErrText)
		end if
				
		/* codigo igual, entao + 1 quantidade */		
		long ll_n
		FOR ll_n = 1 to dw_2.RowCount()
   		    if (dw_2.object.ajuste_produtos_codigo[ll_n]  =  cod_produto) then
					dw_2.object.ajuste_produtos_quantidade[ll_n] = 	dw_2.object.ajuste_produtos_quantidade[ll_n] + 1
					adicao = true
			end if
		NEXT

		/* abre busca */
		if SQLCA.SQLCode = 100 then
			
			Open(w_ajuste_estoque_busca)
			return 1
			
		else
		
			if not adicao then	
		
				this.object.ajuste_produtos_codigo[ll] = codigo
				this.object.produto_descricao[ll] = descricao
				this.object.produto_und[ll] = und
				this.object.ajuste_produtos_preco_custo[ll] = preco_custo
				this.object.ajuste_produtos_quantidade[ll] = 1

				if (tipo = "ENTRADA") then
					this.SetItem(ll, 'ajuste_produtos_motivo', "SOBRA")
				else
					this.SetItem(ll, 'ajuste_produtos_motivo', "DEFEITO")
				end if

				this.SetTabOrder (2, 0)	
				this.SetColumn(5)
				prossegue = true
				m_menu.m_editar.m_confirmar.enabled = True
				m_confirmar = True
				m_menu.m_editar.m_incluir.enabled = True
				m_incluir = True
				return 1
				
			else // adição
							
				adicao = false
				this.object.produto_descricao[ll] = "" 
				return 1

			end if


		end if //SQLCA.SQLCode = 100
		
		
End Choose
end event

type dw_1 from datawindow within w_ajuste_estoque
integer x = 55
integer y = 140
integer width = 1102
integer height = 128
integer taborder = 10
string title = "none"
string dataobject = "d_ajuste_estoque_top"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;Choose Case this.GetColumnName()
		
	Case	'tipo'
		
		tipo = this.GetText()
		this.SetTabOrder (1, 0)	
		dw_2.insertrow(0)
		dw_2.setfocus()
		m_menu.m_editar.m_incluir.enabled = false
		m_incluir = False
		
		if (tipo = "ENTRADA") then
				
			dw_2.Object.ajuste_produtos_motivo.Values = "SOBRA~tSOBRA/ERRO ENTRADA~tERRO ENTRADA"		
				
		Else
				
			dw_2.Object.ajuste_produtos_motivo.Values = "DEFEITO~tDEFEITO/ERRO ENTRADA~tERRO ENTRADA/FURTO~tFURTO"
				
		End if
		
End Choose
end event

