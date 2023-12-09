$PBExportHeader$w_cad_produto.srw
forward
global type w_cad_produto from window
end type
type st_maior_codigo from statictext within w_cad_produto
end type
type st_2 from statictext within w_cad_produto
end type
type st_1 from statictext within w_cad_produto
end type
type gb_3 from groupbox within w_cad_produto
end type
type ddlb_fornecedor from dropdownlistbox within w_cad_produto
end type
type dw_1 from datawindow within w_cad_produto
end type
type gb_2 from groupbox within w_cad_produto
end type
type gb_1 from groupbox within w_cad_produto
end type
end forward

global type w_cad_produto from window
integer width = 9225
integer height = 3520
boolean titlebar = true
string title = "Cadastro de Produtos"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean hscrollbar = true
boolean vscrollbar = true
windowtype windowtype = child!
long backcolor = 67108864
string icon = "Report5!"
boolean center = true
event ue_incluir ( )
event ue_excluir ( )
event ue_salvar ( )
event ue_protect ( )
event f5 pbm_dwnkey
st_maior_codigo st_maior_codigo
st_2 st_2
st_1 st_1
gb_3 gb_3
ddlb_fornecedor ddlb_fornecedor
dw_1 dw_1
gb_2 gb_2
gb_1 gb_1
end type
global w_cad_produto w_cad_produto

type variables
Boolean m_confirmar, m_incluir, m_excluir, m_gerar, m_fechar, m_imprimir, prossegue


end variables

event ue_incluir();long linha

If prossegue Then
		linha = dw_1.InsertRow(0)
		dw_1.ScrollToRow(linha)
		dw_1.SetColumn(1)
		dw_1.object.desconto[linha] = 0
		dw_1.SetFocus()
		
		
		
		prossegue = false
		dw_1.Modify("codigo.Protect='1~tIf(getrow() = rowcount(), 0, 1)'")
		dw_1.Modify("codigo_barras.Protect='1~tIf(getrow() = rowcount(), 0, 1)'")
		dw_1.Modify("ncm.Protect='1~tIf(getrow() = rowcount(), 0, 1)'")
		dw_1.Modify("descricao.Protect='1~tIf(getrow() = rowcount(), 0, 1)'")
		dw_1.Modify("und.Protect='1~tIf(getrow() = rowcount(), 0, 1)'")
		dw_1.Modify("peso.Protect='1~tIf(getrow() = rowcount(), 0, 1)'")
		dw_1.Modify("id_categoria.Protect='1~tIf(getrow() = rowcount(), 0, 1)'")
		dw_1.Modify("estacao.Protect='1~tIf(getrow() = rowcount(), 0, 1)'")
		dw_1.Modify("preco_custo.Protect='1~tIf(getrow() = rowcount(), 0, 1)'")
		dw_1.Modify("preco_venda.Protect='1~tIf(getrow() = rowcount(), 0, 1)'")
		dw_1.Modify("desconto.Protect='1~tIf(getrow() = rowcount(), 0, 1)'")
		dw_1.Modify("preco_final_venda.Protect='1~tIf(getrow() = rowcount(), 0, 1)'")

		
		m_excluir = True
		m_confirmar = false
		m_incluir = false
		of_menu_activated( m_confirmar, m_incluir, m_excluir, m_gerar, m_imprimir, m_fechar)
		
	End If



end event

event ue_excluir();integer row


prossegue = True
dw_1.Modify("codigo.Protect='0'")
dw_1.Modify("codigo_barras.Protect='0'")
dw_1.Modify("ncm.Protect='0'")
dw_1.Modify("descricao.Protect='0'")
dw_1.Modify("und.Protect='0'")
dw_1.Modify("peso.Protect='0'")
dw_1.Modify("id_categoria.Protect='0'")
dw_1.Modify("estacao.Protect='0'")
dw_1.Modify("preco_custo.Protect='0'")
dw_1.Modify("preco_venda.Protect='0'")
dw_1.Modify("desconto.Protect='0'")
dw_1.Modify("preco_final_venda.Protect='0'")


m_confirmar = True
m_incluir = True



row = dw_1.GetRow()
dw_1.DeleteRow(row)


if dw_1.RowCount() = 0 then
	m_confirmar = False
	m_excluir = False
end if

of_menu_activated( m_confirmar, m_incluir, m_excluir, m_gerar, m_imprimir, m_fechar)
end event

event ue_salvar();integer gravar, id_for
String nome_forn

If ddlb_fornecedor.text = "" then
	Messagebox("Atenção!","Selecione um fornecedor.")
else

dw_1.settransobject(SQLCA)


nome_forn =  string(ddlb_fornecedor.text)
			select  id
			into 	:id_for
			from 	fornecedor
			where nome = :nome_forn;
long ll_n

	FOR ll_n = 1 to dw_1.RowCount()
   	    dw_1.object.id_fornecedor[ll_n]  =  id_for
	NEXT


gravar = dw_1.Update(True, True)

	If gravar = 1 Then
		
		//Commit;
				
		//seleciona maior codigo cadastrado
		string maior_codigo_cadastrado
		select max(cast (codigo as integer))
		into :maior_codigo_cadastrado
		from produto ;

			if SQLCA.SQLCode = 0 then
				st_maior_codigo.text = "Item Código: [   "+maior_codigo_cadastrado+"   ]"
				//Messagebox("Atenção","O Código informado já está cadastrado")
				//return 1
			End if	
		//termina maior codigo cadastrado
		
		
		
	Else
		MessageBox("Erro ao gravar Produto",SQLCA.SQLErrText)
		RollBack;
		return
	
	End If
	
End if //gravar produto




//itens gravar ok?
if gravar = 1  then
	
	
	
	Commit;

		messagebox("Operação efetuada com sucesso!","Todos produtos foram cadastrados com exito!")
		ddlb_fornecedor.reset() //reseta fornecedor
		w_cad_produto.ddlb_fornecedor.TriggerEvent("constructor") //constroi fornecedor novamente
		dw_1.reset() //produto
		
		
		
		
		m_confirmar = False
		m_excluir = False
		m_incluir = False
		of_menu_activated( m_confirmar, m_incluir, m_excluir, m_gerar, m_imprimir, m_fechar)

		
		
	else
		RollBack;
		messagebox("Operação não efetuada!","Erro ao salvar dados!")
		
	end if
end event

on w_cad_produto.create
this.st_maior_codigo=create st_maior_codigo
this.st_2=create st_2
this.st_1=create st_1
this.gb_3=create gb_3
this.ddlb_fornecedor=create ddlb_fornecedor
this.dw_1=create dw_1
this.gb_2=create gb_2
this.gb_1=create gb_1
this.Control[]={this.st_maior_codigo,&
this.st_2,&
this.st_1,&
this.gb_3,&
this.ddlb_fornecedor,&
this.dw_1,&
this.gb_2,&
this.gb_1}
end on

on w_cad_produto.destroy
destroy(this.st_maior_codigo)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.gb_3)
destroy(this.ddlb_fornecedor)
destroy(this.dw_1)
destroy(this.gb_2)
destroy(this.gb_1)
end on

event open;m_fechar = True
m_incluir = False
m_gerar = False
m_confirmar = False
m_excluir = False


gb_3.visible = false
st_1.visible = false
st_2.visible = false
st_maior_codigo.visible = false



		
		

end event

event activate;of_menu_activated( m_confirmar, m_incluir, m_excluir, m_gerar, m_imprimir, m_fechar)
end event

event close;of_menu_in_close()
end event

type st_maior_codigo from statictext within w_cad_produto
integer x = 142
integer y = 400
integer width = 654
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 16711680
long backcolor = 67108864
string text = "[Não há registro]"
boolean focusrectangle = false
end type

type st_2 from statictext within w_cad_produto
integer x = 142
integer y = 340
integer width = 357
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Anteriormente:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_cad_produto
integer x = 142
integer y = 280
integer width = 562
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Maior Código Cadastrado"
boolean focusrectangle = false
end type

type gb_3 from groupbox within w_cad_produto
integer x = 101
integer y = 212
integer width = 709
integer height = 264
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Registro:"
end type

type ddlb_fornecedor from dropdownlistbox within w_cad_produto
integer x = 1376
integer y = 268
integer width = 1550
integer height = 580
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Microsoft Sans Serif"
long backcolor = 15780518
boolean border = false
boolean vscrollbar = true
integer limit = 1
borderstyle borderstyle = stylelowered!
end type

event constructor;int i_err
String nome


DECLARE dyn_cursor CURSOR FOR SELECT nome from fornecedor;
OPEN dyn_cursor;

DO
     FETCH dyn_cursor into :nome;
     i_err = SQLCA.SQLCode
	     IF(i_err = 0) THEN
   	       ddlb_fornecedor.additem(nome)
     	END IF
		  
LOOP WHILE(i_err = 0)
CLOSE dyn_cursor;



		


end event

event selectionchanged;string maior_codigo_cadastrado

if dw_1.RowCount() < 1 then //abre rowcount
	
dw_1.SetTransObject(SQLCA) // produto	
dw_1.InsertRow(0)


dw_1.object.desconto[1] = 0


dw_1.SetFocus()


select max(cast (codigo as integer))
into :maior_codigo_cadastrado
from produto ;

			if SQLCA.SQLCode = 0 then
				st_maior_codigo.text = "Item Código: [   "+maior_codigo_cadastrado+"   ]"
				//Messagebox("Atenção","O Código informado já está cadastrado")
				//return 1
			End if	
			
			
gb_3.visible = true
st_1.visible = true
st_2.visible = true
st_maior_codigo.visible = true




end if //fecha rowcount menor < 1




end event

type dw_1 from datawindow within w_cad_produto
event enter pbm_dwnprocessenter
event f5 pbm_dwnkey
integer x = 50
integer y = 548
integer width = 5851
integer height = 2104
integer taborder = 20
string title = "none"
string dataobject = "d_produto"
boolean minbox = true
boolean maxbox = true
boolean border = false
boolean livescroll = true
end type

event enter;w_cad_produto.GetActiveSheet().TriggerEvent("ue_incluir")
end event

event itemchanged;Integer ll
decimal preco_venda, valor_preco_final, desconto, preco_final_venda, preco_custo, porcentagem
String codigo, cod_produto, cod_barras, t_item_descricao
ll = dw_1.GetRow()

Choose case this.GetColumnName()
		
	Case	'codigo'
		
		cod_produto = this.GetText()
		
		select codigo
		into :cod_produto
		from produto 
		where codigo = :cod_produto;

			if SQLCA.SQLCode = 0 then
				Messagebox("Atenção","O Código informado já está cadastrado")
				return 1
			End if	
			
			long ll_n
			FOR ll_n = 1 to dw_1.RowCount()
				 if (dw_1.object.codigo[ll_n]  =  cod_produto) then
					Messagebox("Atenção","Código Repetido, já informado na linha n: "+string(ll_n))
				return 1
				end if
			NEXT
			
		
			
		Case	'codigo_barras'
			
		cod_barras = this.GetText()
		
		select codigo_barras
		into :cod_barras
		from produto
		where codigo_barras = :cod_barras;

			if SQLCA.SQLCode = 0 then
				Messagebox("Atenção","O Código Barras informado já está cadastrado")
				return 1
			End if	
			
	Case 'desconto'
		
		if IsNumber (this.GetText()) then
			
			desconto = long (this.GetText())
			preco_venda =  dw_1.GetItemdecimal(ll,"preco_venda")
			valor_preco_final = preco_venda * (1 - (desconto*0.01) )
			this.object.preco_final_venda[ll] = valor_preco_final
			
			
			
		End if
		
	Case 'preco_final_venda'
		
			preco_custo =	this.GetItemDecimal(ll,"preco_custo")
			preco_final_venda = double(this.GetText())
			preco_venda = dw_1.GetItemdecimal(ll,"preco_venda")
			desconto = 100  - ((preco_final_venda/preco_venda ) * 100)
			this.object.desconto[ll] = desconto
			
				if (preco_custo > preco_final_venda) then
					MessageBox("Atenção","O 'preço final de venda' não pode ser menor que o 'preço de custo'")
					return 1
				end if
				
		


			
	Case 'preco_custo'			
		
			preco_custo = double(this.GetText())
			preco_venda =	this.GetItemDecimal(ll,"preco_venda")

				if (preco_custo > preco_venda) then
					MessageBox("Atenção","O 'preço de custo' não pode ser maior que o 'preço de venda'")
					return 1
				end if


	Case 'preco_venda'			
		
			preco_venda = double(this.GetText())
			preco_custo =	this.GetItemDecimal(ll,"preco_custo")
			desconto = this.GetItemDecimal(ll,"desconto")
			preco_final_venda = preco_venda * (1 - (desconto * 0.01))
			this.object.preco_final_venda[ll] = preco_final_venda
			
				if (preco_venda < preco_custo) then
					MessageBox("Atenção","O 'preço de venda' não pode ser menor que o 'preço de custo'")
					return 1
				end if
				
				
		
				
					
	String codigo2, preco_custo2, descricao2
	



			codigo2 				= String(dw_1.getitemstring(ll,"codigo"))
			descricao2 			= String(dw_1.getitemstring(ll,"descricao"))			
			preco_custo2 		= String(dw_1.getitemdecimal(ll,"preco_custo"))
						
			
			if not(isNull(codigo2) or (codigo2 = "") or isNull(descricao2) or (descricao2 = "") &
									   or isNull(preco_custo2) or (preco_custo2 = "") )then
								
				prossegue = True
				dw_1.Modify("codigo.Protect='0'")
				dw_1.Modify("codigo_barras.Protect='0'")
				dw_1.Modify("ncm.Protect='0'")
				dw_1.Modify("descricao.Protect='0'")
				dw_1.Modify("und.Protect='0'")
				dw_1.Modify("peso.Protect='0'")
				dw_1.Modify("id_categoria.Protect='0'")
				dw_1.Modify("estacao.Protect='0'")
				dw_1.Modify("preco_custo.Protect='0'")
				dw_1.Modify("preco_venda.Protect='0'")
				dw_1.Modify("desconto.Protect='0'")
				dw_1.Modify("preco_final_venda.Protect='0'")
	
				
				m_menu.m_editar.m_confirmar.enabled = True
				m_confirmar = True
				m_menu.m_editar.m_incluir.enabled = True
				m_incluir = True
				
			end if

			
End Choose


end event

event itemerror;return 1

	
end event

event dberror;	if SQLCA.SQLCode = 0 then 
				MessageBox ("Erro Cadastro!", "Existem 'codigos repetidos'," + &
			"~n~r verifique e tente novamente!", Information!) 
				return 2
	end if

end event

event rowfocuschanged;long linha_atual
linha_atual = dw_1.GetRow()


string codigo_prod					
codigo_prod = this.GetItemString(currentrow,"codigo")	


end event

type gb_2 from groupbox within w_cad_produto
integer x = 1138
integer y = 164
integer width = 1961
integer height = 292
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fornecedor"
end type

type gb_1 from groupbox within w_cad_produto
integer x = 18
integer y = 84
integer width = 5979
integer height = 2628
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Produtos"
end type

