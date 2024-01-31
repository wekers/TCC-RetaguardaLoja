$PBExportHeader$w_saida_produtos.srw
forward
global type w_saida_produtos from window
end type
type st_5 from statictext within w_saida_produtos
end type
type st_4 from statictext within w_saida_produtos
end type
type st_3 from statictext within w_saida_produtos
end type
type st_1 from statictext within w_saida_produtos
end type
type rr_3 from roundrectangle within w_saida_produtos
end type
type st_operador from statictext within w_saida_produtos
end type
type st_2 from statictext within w_saida_produtos
end type
type dw_1 from datawindow within w_saida_produtos
end type
type rr_1 from roundrectangle within w_saida_produtos
end type
type rr_2 from roundrectangle within w_saida_produtos
end type
end forward

global type w_saida_produtos from window
integer width = 5710
integer height = 2464
boolean titlebar = true
string title = "Vendas"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "WebPBWizard!"
boolean clientedge = true
boolean center = true
event ue_incluir ( )
event ue_excluir ( )
st_5 st_5
st_4 st_4
st_3 st_3
st_1 st_1
rr_3 rr_3
st_operador st_operador
st_2 st_2
dw_1 dw_1
rr_1 rr_1
rr_2 rr_2
end type
global w_saida_produtos w_saida_produtos

type variables
Boolean m_confirmar, m_incluir, m_excluir, m_gerar, m_fechar, m_imprimir, prossegue, adicao, f5, f6
end variables

event ue_incluir();If prossegue Then
		
		long linha
		if f5 then 
			this.dw_1.SetTabOrder (3, 0)	
			f5 = false
		end if
		
	//	if f6 then 
	//		this.dw_1.SetTabOrder (5, 0)	
	//		f6 = false
	//	end if
		
		
		this.dw_1.SetTabOrder (6, 10)
		linha = dw_1.InsertRow(0)
		dw_1.object.saida_produtos_desconto[linha] = 0
		dw_1.ScrollToRow(linha)
		dw_1.SetColumn(6)
	
		this.dw_1.SetTabOrder (2, 0)	
		this.dw_1.SetTabOrder (4, 0)	
	
		prossegue = false
		m_menu.m_editar.m_excluir.enabled = true
		m_excluir = True
		
	
	End If
end event

event ue_excluir();If (dw_1.object.saida_produtos_codigo[dw_1.RowCount()] = "") or isNull(dw_1.object.saida_produtos_codigo[dw_1.RowCount()]) then 
	dw_1.SetTabOrder (6, 0)
	
end if

dw_1.DeleteRow(dw_1.GetRow())
prossegue = True

this.dw_1.SetTabOrder (2,10)	
this.dw_1.SetTabOrder (4,20)	
end event

on w_saida_produtos.create
this.st_5=create st_5
this.st_4=create st_4
this.st_3=create st_3
this.st_1=create st_1
this.rr_3=create rr_3
this.st_operador=create st_operador
this.st_2=create st_2
this.dw_1=create dw_1
this.rr_1=create rr_1
this.rr_2=create rr_2
this.Control[]={this.st_5,&
this.st_4,&
this.st_3,&
this.st_1,&
this.rr_3,&
this.st_operador,&
this.st_2,&
this.dw_1,&
this.rr_1,&
this.rr_2}
end on

on w_saida_produtos.destroy
destroy(this.st_5)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.st_1)
destroy(this.rr_3)
destroy(this.st_operador)
destroy(this.st_2)
destroy(this.dw_1)
destroy(this.rr_1)
destroy(this.rr_2)
end on

event open;m_fechar = True
m_incluir = True
m_gerar = False
m_confirmar = False
m_excluir = False

long linha_nova
linha_nova = dw_1.insertrow(0)
dw_1.object.saida_produtos_desconto[linha_nova] = 0
st_operador.text = nome_usuario
w_saida_produtos.st_4.text = string(date(now()))

end event

event close;of_menu_in_close()
end event

event activate;of_menu_activated( m_confirmar, m_incluir, m_excluir, m_gerar, m_imprimir, m_fechar)
end event

type st_5 from statictext within w_saida_produtos
integer x = 1970
integer y = 132
integer width = 128
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Calibri"
long backcolor = 15780518
string text = "Data:"
boolean focusrectangle = false
end type

type st_4 from statictext within w_saida_produtos
integer x = 2098
integer y = 132
integer width = 325
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Calibri"
long backcolor = 15780518
boolean focusrectangle = false
end type

type st_3 from statictext within w_saida_produtos
integer x = 3456
integer y = 32
integer width = 439
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 16711680
long backcolor = 67108864
string text = "[ *F5 - Altera Valor ]"
boolean focusrectangle = false
end type

type st_1 from statictext within w_saida_produtos
integer x = 2235
integer y = 184
integer width = 1371
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 15780518
string text = "SAíDA DE PRODUTOS"
alignment alignment = center!
boolean focusrectangle = false
end type

type rr_3 from roundrectangle within w_saida_produtos
long linecolor = 33554432
integer linethickness = 4
long fillcolor = 15780518
integer x = 1947
integer y = 116
integer width = 1952
integer height = 192
integer cornerheight = 40
integer cornerwidth = 46
end type

type st_operador from statictext within w_saida_produtos
integer x = 283
integer y = 204
integer width = 1129
integer height = 64
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Candara"
long backcolor = 15780518
boolean focusrectangle = false
end type

type st_2 from statictext within w_saida_produtos
integer x = 265
integer y = 128
integer width = 297
integer height = 76
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "@Arial Unicode MS"
long backcolor = 15780518
string text = "Operador:"
alignment alignment = center!
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_saida_produtos
event enter pbm_dwnprocessenter
event f5 pbm_dwnkey
integer x = 55
integer y = 308
integer width = 3927
integer height = 1948
integer taborder = 10
string title = "none"
string dataobject = "d_saida_produtos"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event enter;String codigo_prod

Choose case this.GetColumnName()
		
		Case 'produto_descricao'
			
				codigo_prod = String (this.GetText())
				
				if dw_1.rowcount() > 1 then
				
					if (codigo_prod = "") or isNull(codigo_prod) then
						Open(w_saida_top)
					end if
					
				end if

End Choose

GetActiveSheet().TriggerEvent("ue_incluir")











end event

event f5;CHOOSE CASE KEY

CASE KEYF5!

	if prossegue then
		this.SetTabOrder (3, 20)	
		this.SetColumn(3)
		f5 = true 
	end if	
	
CASE KEYF6!
	
	if prossegue then
		this.SetTabOrder (5, 40)	
		this.SetColumn(5)
		f6 = true
	end if	


END CHOOSE 
end event

event itemchanged;String codigo_prod, descricao, codigo, und, cod_barras 
Decimal preco_venda, desconto, preco_custo
Integer ll, saldo
ll = dw_1.GetRow()

Choose case this.GetColumnName()
		
		Case 'produto_descricao'
				
				codigo_prod = String (this.GetText())
				
				SELECT descricao, codigo, und, preco_venda, desconto, preco_custo, codigo_barras, saldo
					into :descricao, :codigo, :und, :preco_venda, :desconto, :preco_custo, :cod_barras, :saldo
				FROM produto
				WHERE codigo = :codigo_prod or codigo_barras = :codigo_prod;

					if SQLCA.SQLCode = -1 then
						MessageBox ('Error', SQLCA.SQLErrText)
					end if
				
					
					
					
			long ll_n
			FOR ll_n = 1 to dw_1.RowCount()
   			    if (dw_1.object.saida_produtos_codigo[ll_n]  =  codigo_prod or dw_1.object.produto_codigo_barras[ll_n] = codigo_prod) then

					dw_1.object.saida_produtos_quantidade[ll_n] = 	dw_1.object.saida_produtos_quantidade[ll_n] + 1
					adicao = true
								
				end if
			NEXT
	
	
				if SQLCA.SQLCode = 100 then
						Open(w_saida_produtos_busca)
						return 1
						
						

				else			

			
					if not adicao then	
				
						this.object.saida_produtos_codigo[ll] = codigo
						this.object.produto_codigo_barras[ll] = cod_barras
						this.object.produto_descricao[ll] = descricao
						this.object.produto_und[ll] = und
						this.object.saida_produtos_preco[ll] = preco_venda
						this.object.saida_produtos_quantidade[ll] = 1
						this.object.saida_produtos_desconto[ll] = desconto
						this.object.saida_produtos_preco_custo[ll] = preco_custo
						this.SetTabOrder (6, 0)	
						this.SetTabOrder (4, 30)	
						this.SetTabOrder (2, 20)	
						this.SetColumn(2)
						prossegue = true
						return 1
				
					else
							
						adicao = false
						this.object.produto_descricao[ll] = "" 
						return 1

					end if
						
					
			end if
								

	Case 'saida_produtos_quantidade'
		
				codigo_prod = this.object.saida_produtos_codigo[ll] 
				
				SELECT descricao, codigo, und, preco_venda, desconto, preco_custo, codigo_barras, saldo
					into :descricao, :codigo, :und, :preco_venda, :desconto, :preco_custo, :cod_barras, :saldo
				FROM produto
				WHERE codigo = :codigo_prod or codigo_barras = :codigo_prod;

					if SQLCA.SQLCode = -1 then
						MessageBox ('Error', SQLCA.SQLErrText)
					end if
					
				Integer quantidade_saida
				quantidade_saida = integer(this.GetText())
		
				this.SetTabOrder (4, 30)	
				this.SetTabOrder (2, 20)	
					
				
			
			
End Choose


end event

event itemerror;return 1
end event

event clicked;this.ScrolltoRow(row)
end event

type rr_1 from roundrectangle within w_saida_produtos
long linecolor = 33554432
integer linethickness = 4
long fillcolor = 15780518
integer x = 64
integer y = 116
integer width = 1874
integer height = 192
integer cornerheight = 40
integer cornerwidth = 46
end type

type rr_2 from roundrectangle within w_saida_produtos
integer linethickness = 4
long fillcolor = 15780518
integer x = 219
integer y = 156
integer width = 1262
integer height = 116
integer cornerheight = 40
integer cornerwidth = 46
end type

