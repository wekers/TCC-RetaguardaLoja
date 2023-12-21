$PBExportHeader$w_alt_produto.srw
forward
global type w_alt_produto from window
end type
type st_1 from statictext within w_alt_produto
end type
type gb_2 from groupbox within w_alt_produto
end type
type sle_1 from singlelineedit within w_alt_produto
end type
type gb_1 from groupbox within w_alt_produto
end type
type dw_1 from datawindow within w_alt_produto
end type
end forward

global type w_alt_produto from window
integer width = 5774
integer height = 2932
boolean titlebar = true
string title = "Alteração de Produtos"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
long backcolor = 67108864
string icon = "DosEdit5!"
boolean center = true
event ue_excluir ( )
event ue_salvar ( )
st_1 st_1
gb_2 gb_2
sle_1 sle_1
gb_1 gb_1
dw_1 dw_1
end type
global w_alt_produto w_alt_produto

type variables
Boolean m_confirmar, m_incluir, m_excluir, m_gerar, m_fechar, m_imprimir


end variables

event ue_excluir();Integer gravar, wk_ret, ll

String cod_prod
ll = dw_1.GetRow()


cod_prod =	dw_1.GetItemString(ll,"codigo")

wk_ret = MessageBox("Atenção", & 
					"Deseja Realmente Excluir o Produto: " + "[" +String(dw_1.GetItemString(ll,"codigo")) +"]", &
		    		 Exclamation!,YesNo!,1)


	IF wk_ret = 1 Then //ok na msg de delete
	
		dw_1.DeleteRow(dw_1.GetRow()) // Produto

		//gravar produto
		dw_1.settransobject(SQLCA)
		gravar = dw_1.Update(True, True)
	
			if gravar = 1 then
				
				Commit;
				dw_1.reset()
				m_menu.m_editar.m_excluir.enabled = False
				m_excluir = False
				sle_1.setfocus()
			Else
				MessageBox("Erro",SQLCA.SQLErrText)
				RollBack;

			End if //fim gravar

	End if //wk_ret = 1


end event

event ue_salvar();integer gravar

dw_1.settransobject(SQLCA)
gravar = dw_1.Update(True, True)

//gravar produto
if gravar = 1 then
		
	Commit;
			
	dw_1.reset()
			
	m_menu.m_editar.m_confirmar.enabled = False
	m_confirmar = False
	m_menu.m_editar.m_excluir.enabled = False
	m_excluir = False
	messagebox("Feito!","O produto foi alterado com sucesso!")
	sle_1.setfocus()	

else
	
	MessageBox("Erro",SQLCA.SQLErrText)
	RollBack;
	messagebox("Operação não efetuada!","Erro ao salvar dados!")

End if //fim gravar ok
		
	
		
		
		

end event

on w_alt_produto.create
this.st_1=create st_1
this.gb_2=create gb_2
this.sle_1=create sle_1
this.gb_1=create gb_1
this.dw_1=create dw_1
this.Control[]={this.st_1,&
this.gb_2,&
this.sle_1,&
this.gb_1,&
this.dw_1}
end on

on w_alt_produto.destroy
destroy(this.st_1)
destroy(this.gb_2)
destroy(this.sle_1)
destroy(this.gb_1)
destroy(this.dw_1)
end on

event open;m_fechar = True
m_incluir = False
m_gerar = False
m_confirmar = False
m_excluir = False


sle_1.setfocus()


end event

event close;of_menu_in_close()
end event

event activate;of_menu_activated( m_confirmar, m_incluir, m_excluir, m_gerar, m_imprimir, m_fechar)

end event

type st_1 from statictext within w_alt_produto
integer x = 485
integer y = 172
integer width = 261
integer height = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Produto:"
boolean focusrectangle = false
end type

type gb_2 from groupbox within w_alt_produto
integer x = 343
integer y = 72
integer width = 1627
integer height = 244
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
end type

type sle_1 from singlelineedit within w_alt_produto
integer x = 763
integer y = 160
integer width = 1134
integer height = 72
integer taborder = 10
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 12639424
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

event modified;dw_1.reset()

String cod_prod
Integer recuperar, recuperar_ipi
double porcent, preco_final_venda
cod_prod = this.text


dw_1.settransobject(SQLCA)
recuperar = dw_1.retrieve(cod_prod)

if(recuperar = 0) then

m_menu.m_editar.m_confirmar.enabled = false
m_confirmar = false
m_menu.m_editar.m_excluir.enabled = false
m_excluir = false
open(w_alt_produto_busca)



end if //fecha recuperar

this.text = ""





end event

type gb_1 from groupbox within w_alt_produto
integer x = 41
integer y = 28
integer width = 2935
integer height = 2136
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Produto"
end type

type dw_1 from datawindow within w_alt_produto
integer x = 78
integer y = 416
integer width = 2651
integer height = 1332
integer taborder = 20
boolean bringtotop = true
string dataobject = "d_alt_produto"
boolean border = false
boolean livescroll = true
end type

event itemchanged;Integer ll
decimal preco_venda, valor_preco_final, desconto, preco_final_venda, preco_custo,porcentagem
String codigo, cod_produto, t_item_descricao
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
				
				if ( preco_final_venda > preco_venda ) then
					MessageBox("Atenção","O 'preço final de venda' não pode ser maior que o 'preço de venda'")
					this.object.desconto[ll] = 0
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
				
				
End Choose

m_menu.m_editar.m_confirmar.enabled = TRUE
m_confirmar = TRUE
end event

event itemerror;return 1
end event

event editchanged;m_menu.m_editar.m_confirmar.enabled = TRUE
m_confirmar = TRUE
end event

event rowfocuschanging;m_menu.m_editar.m_excluir.enabled = True
m_excluir = True
end event

