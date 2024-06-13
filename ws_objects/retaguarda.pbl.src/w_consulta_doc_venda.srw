$PBExportHeader$w_consulta_doc_venda.srw
forward
global type w_consulta_doc_venda from window
end type
type st_doc_devolucao from statictext within w_consulta_doc_venda
end type
type st_4 from statictext within w_consulta_doc_venda
end type
type r_1 from rectangle within w_consulta_doc_venda
end type
type st_3 from statictext within w_consulta_doc_venda
end type
type sle_1 from singlelineedit within w_consulta_doc_venda
end type
type st_1 from statictext within w_consulta_doc_venda
end type
type dw_2 from datawindow within w_consulta_doc_venda
end type
type dw_1 from datawindow within w_consulta_doc_venda
end type
type gb_1 from groupbox within w_consulta_doc_venda
end type
type gb_2 from groupbox within w_consulta_doc_venda
end type
type gb_3 from groupbox within w_consulta_doc_venda
end type
type st_2 from statictext within w_consulta_doc_venda
end type
type r_2 from rectangle within w_consulta_doc_venda
end type
type r_3 from rectangle within w_consulta_doc_venda
end type
type r_4 from rectangle within w_consulta_doc_venda
end type
end forward

global type w_consulta_doc_venda from window
integer width = 3968
integer height = 2840
boolean titlebar = true
string title = "Consulta Documento de Venda"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean vscrollbar = true
long backcolor = 67108864
string icon = "DataPipeline!"
boolean center = true
windowanimationstyle closeanimation = rightroll!
event ue_imprimir ( )
st_doc_devolucao st_doc_devolucao
st_4 st_4
r_1 r_1
st_3 st_3
sle_1 sle_1
st_1 st_1
dw_2 dw_2
dw_1 dw_1
gb_1 gb_1
gb_2 gb_2
gb_3 gb_3
st_2 st_2
r_2 r_2
r_3 r_3
r_4 r_4
end type
global w_consulta_doc_venda w_consulta_doc_venda

type variables
Boolean m_confirmar, m_incluir, m_excluir, m_gerar, m_fechar, m_imprimir
String  operador, vendedor
end variables

forward prototypes
public subroutine legenda_devolucao (boolean visivel)
end prototypes

public subroutine legenda_devolucao (boolean visivel);Choose Case visivel
	Case false
		st_2.visible = False
st_3.visible = False
st_4.visible = False
r_1.Visible = False
r_2.Visible = False
r_3.Visible = False
r_4.Visible = False
st_doc_devolucao.Visible = False
Case true
	st_2.visible = true
				st_3.visible = true
				st_4.visible = true
				r_1.Visible = true
				r_2.Visible = true
				r_3.Visible = true
				r_4.Visible = true
				st_doc_devolucao.Visible = true
End Choose
		


/*CHOOSE CASE Long( uf_security_level( ) )
    CASE IS < 4  //only option 1 shows if security level is less than 4
        OPT_1.Visible = TRUE
    CASE 4 //option 1&2 show if security level is 4
        OPT_1.Visible = TRUE
        OPT_2.Visible = TRUE
    CASE ELSE //only option 3 shows if security level is greater than 4
        OPT_3.Visible = TRUE
END CHOOSE*/
end subroutine

on w_consulta_doc_venda.create
this.st_doc_devolucao=create st_doc_devolucao
this.st_4=create st_4
this.r_1=create r_1
this.st_3=create st_3
this.sle_1=create sle_1
this.st_1=create st_1
this.dw_2=create dw_2
this.dw_1=create dw_1
this.gb_1=create gb_1
this.gb_2=create gb_2
this.gb_3=create gb_3
this.st_2=create st_2
this.r_2=create r_2
this.r_3=create r_3
this.r_4=create r_4
this.Control[]={this.st_doc_devolucao,&
this.st_4,&
this.r_1,&
this.st_3,&
this.sle_1,&
this.st_1,&
this.dw_2,&
this.dw_1,&
this.gb_1,&
this.gb_2,&
this.gb_3,&
this.st_2,&
this.r_2,&
this.r_3,&
this.r_4}
end on

on w_consulta_doc_venda.destroy
destroy(this.st_doc_devolucao)
destroy(this.st_4)
destroy(this.r_1)
destroy(this.st_3)
destroy(this.sle_1)
destroy(this.st_1)
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.gb_1)
destroy(this.gb_2)
destroy(this.gb_3)
destroy(this.st_2)
destroy(this.r_2)
destroy(this.r_3)
destroy(this.r_4)
end on

event open;m_fechar = True
m_incluir = False
m_gerar = False
m_confirmar = False
m_excluir = False
m_imprimir = false


legenda_devolucao(false) //oculta legenda devolução
end event

event activate;of_menu_activated( m_confirmar, m_incluir, m_excluir, m_gerar, m_imprimir, m_fechar)
end event

event close;of_menu_in_close()
end event

type st_doc_devolucao from statictext within w_consulta_doc_venda
integer x = 1422
integer y = 1380
integer width = 658
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 8421376
long backcolor = 67108864
string text = "-> Doc N°"
boolean focusrectangle = false
end type

type st_4 from statictext within w_consulta_doc_venda
integer x = 169
integer y = 1380
integer width = 247
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 16711680
long backcolor = 12639424
string text = "* Cod"
boolean focusrectangle = false
end type

type r_1 from rectangle within w_consulta_doc_venda
long linecolor = 33554432
integer linethickness = 4
long fillcolor = 12639424
integer x = 137
integer y = 1376
integer width = 640
integer height = 60
end type

type st_3 from statictext within w_consulta_doc_venda
integer x = 809
integer y = 1380
integer width = 635
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 8421376
long backcolor = 67108864
string text = "= * Item em devolução"
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within w_consulta_doc_venda
integer x = 603
integer y = 108
integer width = 402
integer height = 80
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

event modified;Integer n_doc	
Integer recuperar_dw1, recuperar_dw2
n_doc = integer(this.text)

if (n_doc>0) then



dw_1.settransobject(SQLCA)
recuperar_dw1 = dw_1.retrieve(n_doc)

	if(recuperar_dw1 = 0) then
	
		dw_1.object.t_operador.text = ""
		dw_1.object.t_vendedor.text = ""
		dw_1.object.t_operador.visible = false
		dw_1.object.t_vendedor.visible = false
		
		dw_2.reset()
		Messagebox("Atenção", "Não existe nenhum documento referente ao numero: "+ string(n_doc))
		this.setfocus()
		//m_menu.m_editar.m_imprimir.enabled = false
		//m_imprimir = false
	
		legenda_devolucao(false) //oculta legenda devolução
	else
		
		Integer codigo_movimento
		codigo_movimento = n_doc
		dw_2.settransobject(SQLCA)
		recuperar_dw2 = dw_2.retrieve(codigo_movimento)
		
		String cod_operador
		integer cod_vendedor
		cod_operador = dw_1.GetItemString(1, "movimento_saida_cod_operador")
		cod_vendedor = dw_1.GetItemNumber(1, "movimento_saida_cod_vendedor")
		
		select nome
		into :operador
		from usuarios
		where CAST(cod as text) = :cod_operador;
	
		select nome
		into :vendedor
		from usuarios
		where cod = :cod_vendedor;
		
		dw_1.object.t_operador.visible = true
		dw_1.object.t_vendedor.visible = true	
		dw_1.object.t_operador.text = operador
		dw_1.object.t_vendedor.text = vendedor
		
		
	
		//m_menu.m_editar.m_imprimir.enabled = true
		//m_imprimir = true

		//************************************************
		
		Integer id_devolucao
		Select id
		Into :id_devolucao
		from movimento_devolucao
		where cast(n_doc_venda as integer) = :n_doc;
		
		String codigo_produto_devolucao
		Integer quantidade_devolucao
		Decimal preco_devolucao

			if (id_devolucao>0 ) then
								
				Long ll_count		
				Select Count(id) Into :ll_count 
				from devolucao_produtos
				where codigo_movimento = :id_devolucao;

				Long ll_n
					FOR ll_n = 1 to ll_count
						select  codigo, quantidade, preco
						into :codigo_produto_devolucao,  :quantidade_devolucao, :preco_devolucao
						from (select row_Number() over (order by id asc) as numero, codigo, quantidade, codigo_movimento, preco, id 
						from devolucao_produtos where codigo_movimento = :id_devolucao) as devolucao_temp where numero = :ll_n ;
						dw_2.insertrow(0)
						Integer linha
						linha = dw_2.RowCount()

						dw_2.object.saida_produtos_codigo[linha] = "*"+codigo_produto_devolucao
			
						String descricao_produto, und_produto
						Select descricao, und	
						Into :descricao_produto, :und_produto
						From produto
						Where codigo = :codigo_produto_devolucao;
		
						dw_2.object.produto_descricao[linha] = descricao_produto
						dw_2.object.produto_und[linha] = und_produto
						dw_2.object.saida_produtos_quantidade[linha] = quantidade_devolucao
						dw_2.object.saida_produtos_preco_total[linha] = preco_devolucao
						dw_2.object.saida_produtos_preco[linha] = (preco_devolucao/quantidade_devolucao)
						dw_2.object.saida_produtos_desconto[linha] = 0
						dw_1.object.movimento_saida_valor_total[1] = dw_1.object.movimento_saida_valor_total[1] // + preco_devolucao

					NEXT	
					legenda_devolucao(true) // mostra legenda devolução
					st_doc_devolucao.text = "-> Doc Devolução N°: "+string(id_devolucao)
			else
					
				legenda_devolucao(false) //oculta legenda devolução
			
			end if
			
			//***************************************************************************
			
			
			
	end if

else
	
	Messagebox("Atenção", "O Campo 'Nº Documento' deve conter apenas números")
	this.text = ""
	this.setfocus()
	return 1
end if

this.text = ""
this.setfocus()





end event

type st_1 from statictext within w_consulta_doc_venda
integer x = 178
integer y = 120
integer width = 411
integer height = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nº Documento:"
boolean focusrectangle = false
end type

type dw_2 from datawindow within w_consulta_doc_venda
integer x = 96
integer y = 1520
integer width = 3666
integer height = 1204
integer taborder = 20
string title = "none"
string dataobject = "d_consulta_doc_venda_produtos"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

type dw_1 from datawindow within w_consulta_doc_venda
integer x = 96
integer y = 308
integer width = 2793
integer height = 992
string title = "none"
string dataobject = "d_consulta_doc_venda_top"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within w_consulta_doc_venda
integer x = 64
integer y = 20
integer width = 1083
integer height = 212
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Pesquisa"
end type

type gb_2 from groupbox within w_consulta_doc_venda
integer x = 64
integer y = 1456
integer width = 3721
integer height = 1300
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Produtos"
end type

type gb_3 from groupbox within w_consulta_doc_venda
integer x = 64
integer y = 256
integer width = 2834
integer height = 1092
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Informações"
end type

type st_2 from statictext within w_consulta_doc_venda
integer x = 471
integer y = 1380
integer width = 288
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 16711680
long backcolor = 12639424
string text = "Descrição..."
fillpattern fillpattern = horizontal!
boolean focusrectangle = false
end type

type r_2 from rectangle within w_consulta_doc_venda
long linecolor = 33554432
integer linethickness = 4
long fillcolor = 8421376
integer x = 430
integer y = 1376
integer width = 9
integer height = 60
end type

type r_3 from rectangle within w_consulta_doc_venda
long linecolor = 33554432
integer linethickness = 4
long fillcolor = 8421376
integer x = 142
integer y = 1376
integer width = 14
integer height = 60
end type

type r_4 from rectangle within w_consulta_doc_venda
long linecolor = 33554432
integer linethickness = 4
long fillcolor = 8421376
integer x = 763
integer y = 1376
integer width = 14
integer height = 60
end type

