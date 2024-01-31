$PBExportHeader$w_saida_top.srw
forward
global type w_saida_top from window
end type
type cb_cancelar from commandbutton within w_saida_top
end type
type cb_ok from commandbutton within w_saida_top
end type
type dw_1 from datawindow within w_saida_top
end type
type gb_1 from groupbox within w_saida_top
end type
end forward

global type w_saida_top from window
integer width = 2277
integer height = 2100
boolean titlebar = true
string title = "Fecha Venda"
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean clientedge = true
boolean center = true
cb_cancelar cb_cancelar
cb_ok cb_ok
dw_1 dw_1
gb_1 gb_1
end type
global w_saida_top w_saida_top

on w_saida_top.create
this.cb_cancelar=create cb_cancelar
this.cb_ok=create cb_ok
this.dw_1=create dw_1
this.gb_1=create gb_1
this.Control[]={this.cb_cancelar,&
this.cb_ok,&
this.dw_1,&
this.gb_1}
end on

on w_saida_top.destroy
destroy(this.cb_cancelar)
destroy(this.cb_ok)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event open;String nome_cliente
Integer codigo_cliente


dw_1.object.operacao[1] = "A Vista"

dw_1.object.t_nome_usuario.text = nome_usuario
dw_1.object.cod_operador[1] = string(codigo_usuario)
Decimal valor_total_produtos
valor_total_produtos = w_saida_produtos.dw_1.GetItemDecimal(1,"compute_valor_total_produtos")
dw_1.object.valor_total[1] = valor_total_produtos

dw_1.object.imprimir[1] = 0
dw_1.insertrow(0)

dw_1.object.data_saida[1] = date(now())

dw_1.object.tipo_venda[1] = "local" //venda local
codigo_cliente = 1 //venda local
dw_1.object.id_cliente[1] = string(codigo_cliente)
dw_1.object.t_nome_cliente.text ="VENDA LOCAL" //nome_cliente
dw_1.object.frete[1] = "VENDA LOCAL"
dw_1.object.valor_frete[1] = 0

dw_1.SetTabOrder ("frete", 0)	
dw_1.SetTabOrder ("valor_frete", 0)



end event

type cb_cancelar from commandbutton within w_saida_top
integer x = 1806
integer y = 1808
integer width = 329
integer height = 100
integer taborder = 30
integer textsize = -8
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

type cb_ok from commandbutton within w_saida_top
integer x = 1399
integer y = 1808
integer width = 329
integer height = 100
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "&OK"
boolean default = true
end type

event clicked;string codigo_vendedor, id_cliente
Integer gravar_top, gravar_produtos
Long cod_operador, id_movimento



codigo_vendedor = string(dw_1.GetItemString(1,"cod_vendedor"))



	if isNull(codigo_vendedor) or (codigo_vendedor = "") then
   	    messagebox("Atenção!","O campo vendedor não pode ser vazio")
		dw_1.SetFocus()
	    	return 1
				  
	  
	else	
	
	dw_1.object.cod_operador[1] = 	String(codigo_usuario)
	dw_1.settransobject(SQLCA)
	gravar_top = dw_1.Update(True, True)

		if gravar_top = 1 then
	
			Commit;
					
		Else
			
			RollBack;
			MessageBox("Erro ao gravar saida produtos top",SQLCA.SQLErrText)
			
		End If
	
	w_saida_produtos.dw_1.settransobject(SQLCA)
	id_movimento = long(dw_1.GetItemnumber(1,"id"))
	w_saida_produtos.dw_1.DeleteRow(w_saida_produtos.dw_1.RowCount())

	long ll_n
	
	FOR ll_n = 1 to w_saida_produtos.dw_1.RowCount()
   	    w_saida_produtos.dw_1.object.saida_produtos_codigo_movimento[ll_n]  =  id_movimento
     	 w_saida_produtos.dw_1.object.saida_produtos_preco_total[ll_n] = w_saida_produtos.dw_1.getitemdecimal(ll_n,"compute_preco_total")
	NEXT
	
	gravar_produtos = w_saida_produtos.dw_1.Update(True,True)
	
		if	gravar_produtos = 1 then
			
			long ll_nn 
			double saldo_final
			String codigo_update
			
			FOR ll_nn = 1 to w_saida_produtos.dw_1.RowCount()
				codigo_update = w_saida_produtos.dw_1.GetitemString(ll_nn,"saida_produtos_codigo")
				saldo_final = w_saida_produtos.dw_1.GetitemNumber(ll_nn,"saida_produtos_quantidade")
					UPDATE produto 
			      		SET saldo = saldo - :saldo_final  
		   		    WHERE codigo  = :codigo_update
		       		USING SQLCA ;
			NEXT

			
			
			Commit;
	
	
	/*Impressão foi marcada no checkbox*/			
	
			////parte impressao parte1
			
			integer imprimir
			Integer id, codigo_movimento
			id = id_movimento
			codigo_movimento = id_movimento
			
		IF (w_saida_top.dw_1.object.imprimir[1] = 1) THEN

			datastore lds_aux
			int li_return
			lds_aux = create datastore
			lds_aux.dataobject = 'd_saida_print'

			DataWindowChild dwc_1
			lds_aux.GetChild("dw_1", dwc_1)
			dwc_1.SetTransObject(SQLCA)
			dwc_1.Retrieve(id)
			
			lds_aux.object.dw_1.object.operacao[1] = ""
			lds_aux.object.dw_1.object.t_operacao.Text = ""

		//cabeçalho
		lds_aux.Object.dw_1.object.t_5.Text = t_5
		lds_aux.Object.dw_1.object.t_6.Text = t_6
		lds_aux.Object.dw_1.object.t_7.Text = t_7
		lds_aux.Object.dw_1.object.t_8.Text = t_8
		lds_aux.Object.dw_1.object.t_9.Text = t_9


			
			DataWindowChild dwc_2
			lds_aux.GetChild("dw_2", dwc_2)
			dwc_2.SetTransObject(SQLCA)
			dwc_2.Retrieve(codigo_movimento)

			//configura pagina p/ formulario razao

			lds_aux.Object.DataWindow.Print.Paper.Size = 256
			lds_aux.Object.DataWindow.Print.CustomPage.Length = 140 // 10 inches
			lds_aux.Object.DataWindow.Print.CustomPage.Width = 215 // 7 inches

			//termina form razao
			
			li_return = lds_aux.Print(false,false)
		
			if isnull(li_return) or li_return = -1 then
				messagebox('','Não foi possível imprimir ou a impressão foi cancelada')
			end if
			
			destroy lds_aux
			
		end if 

///termina parte1 impressao

	////parte impressao parte2
			


		IF (w_saida_top.dw_1.object.imprimir[1] = 1) THEN

			
			datastore lds_aux2
			int li_return2
			lds_aux2 = create datastore
			lds_aux2.dataobject = 'd_saida_print2'

			DataWindowChild dwc_1p2
			lds_aux2.GetChild("dw_1", dwc_1p2)
			dwc_1p2.SetTransObject(SQLCA)
			dwc_1p2.Retrieve(id)

		//cabeçalho
		lds_aux.Object.dw_1.object.t_5.Text = t_5
		lds_aux.Object.dw_1.object.t_6.Text = t_6
		lds_aux.Object.dw_1.object.t_7.Text = t_7
		lds_aux.Object.dw_1.object.t_8.Text = t_8
		lds_aux.Object.dw_1.object.t_9.Text = t_9



			DataWindowChild dwc_2p2
			lds_aux2.GetChild("dw_2", dwc_2p2)
			dwc_2p2.SetTransObject(SQLCA)
			dwc_2p2.Retrieve(codigo_movimento)

			//configura pagina p/ formulario razao
			
			lds_aux2.Object.DataWindow.Print.Paper.Size = 256
			lds_aux2.Object.DataWindow.Print.CustomPage.Length = 140 // 10 inches
			lds_aux2.Object.DataWindow.Print.CustomPage.Width = 215 // 7 inches

			//termina form razao

			li_return2 = lds_aux2.Print(false,false)
			li_return2 = lds_aux2.Print(false,false)
				if isnull(li_return2) or li_return2 = -1 then
					messagebox('','Não foi possível imprimir a 2 folha ou a impressão foi cancelada')
				end if
			
			destroy lds_aux2
			
		end if

///termina parte2 impressao
			
				
			w_saida_produtos.dw_1.reset()
			dw_1.reset()
			w_saida_produtos.dw_1.insertrow(0)
			long linha
			w_saida_produtos.dw_1.SetTabOrder (6, 10)	
			w_saida_produtos.dw_1.SetColumn(6)
			w_saida_produtos.dw_1.ScrollToRow(linha)
			w_saida_produtos.prossegue = false
			w_saida_produtos.adicao = false
			m_menu.m_editar.m_excluir.enabled = false
			w_saida_produtos.m_excluir = False
			close(parent)

		
		else
			
			MessageBox("Erro ao gravar produtos saida",SQLCA.SQLErrText)		
			RollBack;
				
		end if
		
	
	End if
end event

type dw_1 from datawindow within w_saida_top
event f6 pbm_keydown
event alt_price_f6 pbm_dwnkey
integer x = 206
integer y = 248
integer width = 1842
integer height = 1472
integer taborder = 10
string dataobject = "d_saida_top"
boolean border = false
end type

event alt_price_f6;CHOOSE CASE KEY
CASE KEYF6!


this.SetTabOrder(1, 40)	
this.SetColumn(1)
//f5 = true

	
END CHOOSE 
end event

event itemchanged;long codigo_vendedor, codigo_cliente
String nome_vendedor, nome_cliente, codigo_cliente_nome
String cep, uf, faixa1, faixa2
decimal valor_frete


Choose case this.GetColumnName()
		
	Case 'id_cliente'
		
			codigo_cliente_nome = this.GetText()
			codigo_cliente = long(this.GetText())
			
			SELECT nome
				into :nome_cliente
			FROM clientes
			WHERE nome LIKE '%:codigo_cliente_nome%' OR id = :codigo_cliente;
		
			if SQLCA.SQLCode = 100 then  //Não encontrado, abrir busca
				Open(w_clientes_busca)
				return 1
			end if
				
			if	codigo_cliente <> 1 and dw_1.GetItemString(1,"tipo_venda") =  "ecommerce" then
				this.object.t_nome_cliente.text = nome_cliente
				cb_ok.enabled = true	
			end if
			
			
		
	Case 'cod_vendedor'
		
				codigo_vendedor = long(this.GetText())
				select nome
				into :nome_vendedor
				from usuarios
				where cod = :codigo_vendedor;
				
					if SQLCA.SQLCode = 100 then 
						MessageBox ("Atenção!", "Código de vendedor inválido ou inexistente!", Information!) 
						return 1
					end if
				
				this.object.t_nome.text = nome_vendedor
				cb_ok.enabled = true		
				
	Case 'tipo_venda' 
				
				if this.GetText() = "ecommerce"  then
					
					this.object.id_cliente[1] = ""
					this.object.t_nome_cliente.text = ""
					dw_1.object.frete[1] = "SEDEX"
					dw_1.SetColumn("frete")
					cb_ok.enabled = false
					dw_1.SetTabOrder ("frete", 20)	
					dw_1.SetTabOrder ("valor_frete", 60)
				else
					codigo_cliente = 1 //venda local
					dw_1.object.id_cliente[1] = string(codigo_cliente)
					dw_1.object.t_nome_cliente.text ="VENDA LOCAL"
					dw_1.object.frete[1] = "VENDA LOCAL"
					dw_1.object.valor_frete[1] = 0
					
				end if
				
	Case 'valor_frete' 
		
				cb_ok.enabled = true		
				
				
			
End Choose
end event

event itemerror;return 1
end event

event constructor;DataWindowChild fpag

dw_1.GetChild("operacao", fpag)
fpag.SetTransObject(SQLCA)
fpag.Retrieve()


end event

event itemfocuschanged;Choose case this.GetColumnName()

	/* não aceita campo cliente vazio */
	Case 'cod_vendedor'

		IF dw_1.GetItemString(1,"id_cliente") = "" or dw_1.GetItemString(1,"id_cliente") = "1" and dw_1.GetItemString(1,"tipo_venda") =  "ecommerce" THEN
				dw_1.SetColumn("id_cliente")
			end if
		
End Choose
end event

type gb_1 from groupbox within w_saida_top
integer x = 32
integer y = 64
integer width = 2162
integer height = 1700
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Operação de venda"
end type

