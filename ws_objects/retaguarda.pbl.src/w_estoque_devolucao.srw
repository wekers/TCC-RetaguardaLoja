$PBExportHeader$w_estoque_devolucao.srw
forward
global type w_estoque_devolucao from window
end type
type st_2 from statictext within w_estoque_devolucao
end type
type dw_2 from datawindow within w_estoque_devolucao
end type
type dw_1 from datawindow within w_estoque_devolucao
end type
type st_1 from statictext within w_estoque_devolucao
end type
type gb_3 from groupbox within w_estoque_devolucao
end type
type gb_2 from groupbox within w_estoque_devolucao
end type
type gb_1 from groupbox within w_estoque_devolucao
end type
type sle_1 from singlelineedit within w_estoque_devolucao
end type
end forward

global type w_estoque_devolucao from window
integer width = 3337
integer height = 2848
boolean titlebar = true
string title = "Devolução de Produtos"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
long backcolor = 67108864
string icon = "Query5!"
boolean clientedge = true
boolean center = true
event ue_excluir ( )
event ue_salvar ( )
st_2 st_2
dw_2 dw_2
dw_1 dw_1
st_1 st_1
gb_3 gb_3
gb_2 gb_2
gb_1 gb_1
sle_1 sle_1
end type
global w_estoque_devolucao w_estoque_devolucao

type variables
Boolean m_confirmar, m_incluir, m_excluir, m_gerar, m_fechar, m_imprimir, travar
String  operador,  vendedor
String n_doc	
integer n_doc_int 

end variables

forward prototypes
public subroutine visivel (boolean aparecer)
end prototypes

event ue_excluir();dw_2.DeleteRow(dw_2.GetRow())

if (dw_2.RowCount() = 0) then
	m_menu.m_editar.m_confirmar.enabled = false
	m_confirmar = false
	m_menu.m_editar.m_excluir.enabled = false
	m_excluir = false
	travar = true
end if
end event

event ue_salvar();Double qtd, quantidade_parcial
integer id_movimento
String codigo
Decimal preco, desconto, novo_preco_total

dw_2.SetColumn(5)

if not(travar) then

	long ll_n

	FOR ll_n = 1 to dw_2.RowCount()
		
   	    codigo = dw_2.GetitemString(ll_n,"saida_produtos_codigo")

		n_doc_int = integer(n_doc)

		/* pegando a qtd real da saida */
		SELECT quantidade
			into :qtd
		FROM saida_produtos
		WHERE codigo = :codigo and codigo_movimento = :n_doc_int;

		quantidade_parcial = dw_2.GetItemNumber(ll_n,"saida_produtos_quantidade")
			
		if(qtd <> quantidade_parcial) then //vai ser devolvido uma qtd diferente?
	
	
			preco = dw_2.object.saida_produtos_preco[ll_n] 
			desconto = dw_2.object.saida_produtos_desconto[ll_n]
			novo_preco_total = dw_2.object.saida_produtos_preco_total[ll_n] //o preço atual do produto que vai ser devolvido (qtd * preço)

			/* atualizando o saldo atual + a qtd que vai ser devolvida */
			UPDATE produto 
		      	SET saldo = saldo + :quantidade_parcial
	      	WHERE codigo  = :codigo
	       	USING SQLCA ;
			
			/* faz a inserção na tabela movimento_devolucao */
			INSERT INTO movimento_devolucao (cod_operador, n_doc_venda)
	         VALUES (:codigo_usuario, :n_doc);

			/* pega o id da tabela movimento_devolucao e insere na variável id_movimento, conforme n_doc */
			SELECT id
				into :id_movimento
			FROM movimento_devolucao
			WHERE n_doc_venda = :n_doc;

			/* faz a inserção na tabela devolucao_produtos */
			INSERT INTO devolucao_produtos (codigo, quantidade, codigo_movimento, preco)
		     VALUES (:codigo, :quantidade_parcial, :id_movimento, :novo_preco_total);

			/* Faz update na tabela saida_produtos - qtd devolvida, - preço do produto a ser devolvido */
			UPDATE saida_produtos
		      	SET quantidade = quantidade - :quantidade_parcial, preco_total = preco_total - :novo_preco_total  
			WHERE codigo  = :codigo and codigo_movimento = :n_doc
		    	USING SQLCA ;
			
			/* Faz update na tabela movimento_saida setando agora o seu valor_total */
			UPDATE movimento_saida
				SET valor_total = (valor_total - :novo_preco_total)
			WHERE id = :n_doc
			USING SQLCA;
			
			Commit;
			
			If sqlca.sqlcode <> 0 Then
				MessageBox("Erro ao gravar Produto qtd <> quantidade_parcial",SQLCA.SQLErrText)
				RollBack;
				return
			End If
			
			
		else //caso a qtd(da venda) = quantidade_parcial(qtd a ser devovida)


			novo_preco_total = dw_2.object.saida_produtos_preco_total[ll_n]	
	
			/* atualizando o saldo atual + a qtd que vai ser devolvida */
      		UPDATE produto 
		    		SET saldo = saldo + :quantidade_parcial
		    	WHERE codigo  = :codigo
		    	USING SQLCA ;

			/* faz a inserção na tabela movimento_devolucao */
			INSERT INTO movimento_devolucao (cod_operador, n_doc_venda)
		     VALUES (:codigo_usuario, :n_doc);

			/* pega o id da tabela movimento_devolucao e insere na variável id_movimento, conforme n_doc */
			SELECT id
				into :id_movimento
			FROM movimento_devolucao
			WHERE n_doc_venda = :n_doc;

			/* faz a inserção na tabela devolucao_produtos */
			INSERT INTO devolucao_produtos (codigo, quantidade, codigo_movimento, preco)
		     VALUES (:codigo, :quantidade_parcial, :id_movimento, :novo_preco_total);
				
			/* Faz update na tabela movimento_saida setando agora o seu valor_total */
			UPDATE movimento_saida
				SET valor_total = (valor_total - :novo_preco_total)
			WHERE id = :n_doc
			USING SQLCA;

			/* Não existe mais esse produto da venda relacionado a seu n_doc, 
			todas unidades foram devolvidas, a linha da tabela saida_produtos fica vazia, deleta então a sua respectiva tabela*/
			DELETE FROM saida_produtos
		     WHERE codigo = :codigo and codigo_movimento = :n_doc ;

			Commit;
				
			If sqlca.sqlcode <> 0 Then
				MessageBox("Erro ao gravar Produto",SQLCA.SQLErrText)
				RollBack;
				return
			End If
			
		
		End if //qtd <> quantidade_parcial
			 
			 
	NEXT
	
	
	MessageBox("Operação Realizada", "A devolução referente ao documento [ " +String(n_doc) +" ] foi efetuada com exito")
	dw_1.reset()
	dw_2.reset()
	sle_1.setfocus()
	
	m_menu.m_editar.m_excluir.enabled = false
	m_excluir = false
	m_menu.m_editar.m_confirmar.enabled = false
	m_confirmar = false
	
	dw_1.object.t_operador.text = ""
	dw_1.object.t_vendedor.text = ""
	dw_1.object.t_operador.visible = false
	dw_1.object.t_vendedor.visible = false
	visivel(false)
	
	
end if //travar
	

end event

public subroutine visivel (boolean aparecer);if(aparecer = false) then

	gb_2.visible = false
	gb_3.visible = false
	dw_1.visible = false
	dw_2.visible = false
	st_2.visible = false
	
else
	
	gb_2.visible = true
	gb_3.visible = true
	dw_1.visible = true
	dw_2.visible = true
	st_2.visible = true
	
end if
end subroutine

on w_estoque_devolucao.create
this.st_2=create st_2
this.dw_2=create dw_2
this.dw_1=create dw_1
this.st_1=create st_1
this.gb_3=create gb_3
this.gb_2=create gb_2
this.gb_1=create gb_1
this.sle_1=create sle_1
this.Control[]={this.st_2,&
this.dw_2,&
this.dw_1,&
this.st_1,&
this.gb_3,&
this.gb_2,&
this.gb_1,&
this.sle_1}
end on

on w_estoque_devolucao.destroy
destroy(this.st_2)
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.st_1)
destroy(this.gb_3)
destroy(this.gb_2)
destroy(this.gb_1)
destroy(this.sle_1)
end on

event activate;of_menu_activated( m_confirmar, m_incluir, m_excluir, m_gerar, m_imprimir, m_fechar)
end event

event close;of_menu_in_close()
end event

event open;m_fechar = True
m_incluir = False
m_gerar = False
m_confirmar = False
m_excluir = false
m_imprimir = false


visivel(false)
end event

type st_2 from statictext within w_estoque_devolucao
integer x = 1778
integer y = 2660
integer width = 1403
integer height = 68
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Calibri"
long textcolor = 33554432
long backcolor = 67108864
string text = "*Deixar apenas o(s) produto(s) que vai devolver"
boolean focusrectangle = false
end type

type dw_2 from datawindow within w_estoque_devolucao
integer x = 96
integer y = 1416
integer width = 3045
integer height = 1204
integer taborder = 20
string title = "none"
string dataobject = "d_estoque_devolucao_produtos"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
end type

event itemchanged;Integer ll, quantidade
double qtd
String codigo

ll = dw_2.GetRow()

Choose case this.GetColumnName()
	
	Case 'saida_produtos_quantidade'
	
		quantidade = double(this.GetText())
				
		codigo = dw_2.GetItemString(ll, "saida_produtos_codigo")
		n_doc_int = integer(n_doc)
		
		SELECT quantidade
			into :qtd
		FROM saida_produtos
		WHERE codigo = :codigo and codigo_movimento = :n_doc_int;
			
		if(quantidade > qtd) then
			Messagebox("Atenção", "A quantidade original é: [ "+String(qtd) + " ] você não pode setar uma quantidade maior que a original")
			travar = true
			return 1
		end if
			
		
		if(quantidade = 0) then
			Messagebox("Atenção", "A quantidade não pode ser 0")
			travar = true
			return 1
		end if
			
		travar = false	
		Decimal preco, desconto
		preco = dw_2.object.saida_produtos_preco[ll] 
		desconto = dw_2.object.saida_produtos_desconto[ll]
		dw_2.object.saida_produtos_preco_total[ll] = ( preco * (1 - (desconto * 0.01))) * quantidade


		
		if SQLCA.SQLCode = -1 then
			MessageBox ('Error', SQLCA.SQLErrText)
		end if
	
End Choose

//saida_produtos_quantidade
end event

event itemerror;return 1
end event

type dw_1 from datawindow within w_estoque_devolucao
integer x = 96
integer y = 328
integer width = 2770
integer height = 992
string title = "none"
string dataobject = "d_consulta_doc_venda_top"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_estoque_devolucao
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

type gb_3 from groupbox within w_estoque_devolucao
integer x = 64
integer y = 256
integer width = 2811
integer height = 1072
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

type gb_2 from groupbox within w_estoque_devolucao
integer x = 64
integer y = 1352
integer width = 3118
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

type gb_1 from groupbox within w_estoque_devolucao
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

type sle_1 from singlelineedit within w_estoque_devolucao
integer x = 603
integer y = 108
integer width = 402
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

event modified;Integer recuperar_dw1, recuperar_dw2
n_doc = this.text

/* Só aceita numeros */
if not Match(n_doc,"^[0-9]+$") then
	 Messagebox("Atenção", "O Campo 'Nº Documento' deve conter apenas números")	
	 this.setfocus()
	 return 

else


/* número digitado, então segue */
dw_1.settransobject(SQLCA)
recuperar_dw1 = dw_1.retrieve(integer(n_doc))

	if(recuperar_dw1 = 0) then
	
		dw_1.object.t_operador.text = ""
		dw_1.object.t_vendedor.text = ""
		dw_1.object.t_operador.visible = false
		dw_1.object.t_vendedor.visible = false
		dw_2.reset()
		visivel(false)
		Messagebox("Atenção", "Não existe nenhum documento referente ao numero: "+ n_doc)
		this.setfocus()
		

	else
		
		visivel(true)

		String codigo_movimento
		codigo_movimento = n_doc
		dw_2.settransobject(SQLCA)
		recuperar_dw2 = dw_2.retrieve(codigo_movimento)
		
		
		Integer cod_vendedor, cod_operador
		cod_operador = Integer(dw_1.GetItemString(1, "movimento_saida_cod_operador"))
		cod_vendedor = dw_1.GetItemNumber(1, "movimento_saida_cod_vendedor")
		
		SELECT nome
			into :operador
		FROM usuarios
		WHERE cod = :cod_operador; 
	
		SELECT nome
			into :vendedor
		FROM usuarios
		WHERE cod = :cod_vendedor;
		
		dw_1.object.t_operador.visible = true
		dw_1.object.t_vendedor.visible = true	
	
		dw_1.object.t_operador.text = operador
		dw_1.object.t_vendedor.text = vendedor
		m_menu.m_editar.m_confirmar.enabled = true
		m_confirmar = true
		m_menu.m_editar.m_excluir.enabled = true
		m_excluir = true
		dw_2.setfocus()
		
	end if //recuperar


end if // match

if (dw_2.RowCount() = 0) then
	m_menu.m_editar.m_confirmar.enabled = false
	m_confirmar = false
	m_menu.m_editar.m_excluir.enabled = false
	m_excluir = false
end if

this.text = ""






end event

