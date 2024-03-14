$PBExportHeader$w_consulta_estoque.srw
forward
global type w_consulta_estoque from window
end type
type sle_text from singlelineedit within w_consulta_estoque
end type
type st_1 from statictext within w_consulta_estoque
end type
type dw_1 from datawindow within w_consulta_estoque
end type
type gb_2 from groupbox within w_consulta_estoque
end type
type gb_1 from groupbox within w_consulta_estoque
end type
end forward

global type w_consulta_estoque from window
integer width = 4942
integer height = 2000
boolean titlebar = true
string title = "Consulta de Estoque"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
long backcolor = 67108864
string icon = "DataPipeline!"
boolean center = true
sle_text sle_text
st_1 st_1
dw_1 dw_1
gb_2 gb_2
gb_1 gb_1
end type
global w_consulta_estoque w_consulta_estoque

type variables
Boolean m_confirmar, m_incluir, m_excluir, m_gerar, m_fechar, m_imprimir

end variables

on w_consulta_estoque.create
this.sle_text=create sle_text
this.st_1=create st_1
this.dw_1=create dw_1
this.gb_2=create gb_2
this.gb_1=create gb_1
this.Control[]={this.sle_text,&
this.st_1,&
this.dw_1,&
this.gb_2,&
this.gb_1}
end on

on w_consulta_estoque.destroy
destroy(this.sle_text)
destroy(this.st_1)
destroy(this.dw_1)
destroy(this.gb_2)
destroy(this.gb_1)
end on

event open;m_fechar = True
m_incluir = False
m_gerar = False
m_confirmar = False
m_excluir = False


sle_text.setfocus()

end event

event close;of_menu_in_close()
end event

event activate;of_menu_activated( m_confirmar, m_incluir, m_excluir, m_gerar, m_imprimir, m_fechar)
end event

type sle_text from singlelineedit within w_consulta_estoque
integer x = 878
integer y = 284
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

event modified;String cod_prod
Integer recuperar
cod_prod = this.text

dw_1.settransobject(SQLCA)
recuperar = dw_1.retrieve(cod_prod)
dw_1.Modify("codigo.Color = ' 0~tIf(saldo < 0,255,0)'")
dw_1.Modify("descricao.Color = ' 0~tIf(saldo < 0,255,0)'")
dw_1.Modify("und.Color = ' 0~tIf(saldo < 0,255,0)'")
dw_1.Modify("id_categoria.Color = ' 0~tIf(saldo < 0,255,0)'")
dw_1.Modify("preco_venda.Color = ' 0~tIf(saldo < 0,255,0)'")
dw_1.Modify("desconto.Color = ' 0~tIf(saldo < 0,255,0)'")
dw_1.Modify("preco_final_venda.Color = ' 0~tIf(saldo < 0,255,0)'")
dw_1.Modify("saldo.Color = ' 0~tIf(saldo < 0,255,0)'")
dw_1.Modify("t_desconto.Color = ' 0~tIf(saldo < 0,255,0)'")

if(recuperar = 0) then
	open(w_consulta_estoque_busca)
end if

this.text = ""





end event

type st_1 from statictext within w_consulta_estoque
integer x = 599
integer y = 296
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

type dw_1 from datawindow within w_consulta_estoque
integer x = 82
integer y = 556
integer width = 4699
integer height = 716
integer taborder = 20
string dataobject = "d_consulta_estoque"
boolean border = false
end type

type gb_2 from groupbox within w_consulta_estoque
integer x = 457
integer y = 176
integer width = 1627
integer height = 284
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_1 from groupbox within w_consulta_estoque
integer x = 41
integer y = 72
integer width = 4814
integer height = 1304
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Consulta"
end type

