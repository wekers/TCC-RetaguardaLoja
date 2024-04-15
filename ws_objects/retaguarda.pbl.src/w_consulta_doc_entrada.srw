$PBExportHeader$w_consulta_doc_entrada.srw
forward
global type w_consulta_doc_entrada from window
end type
type sle_2 from singlelineedit within w_consulta_doc_entrada
end type
type st_2 from statictext within w_consulta_doc_entrada
end type
type dw_2 from datawindow within w_consulta_doc_entrada
end type
type dw_1 from datawindow within w_consulta_doc_entrada
end type
type sle_1 from singlelineedit within w_consulta_doc_entrada
end type
type st_1 from statictext within w_consulta_doc_entrada
end type
type gb_1 from groupbox within w_consulta_doc_entrada
end type
type gb_3 from groupbox within w_consulta_doc_entrada
end type
type gb_2 from groupbox within w_consulta_doc_entrada
end type
end forward

global type w_consulta_doc_entrada from window
integer width = 3323
integer height = 2284
boolean titlebar = true
string title = "Consulta Nota de Entrada"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
long backcolor = 67108864
string icon = "DataPipeline!"
boolean clientedge = true
boolean center = true
event ue_imprimir ( )
sle_2 sle_2
st_2 st_2
dw_2 dw_2
dw_1 dw_1
sle_1 sle_1
st_1 st_1
gb_1 gb_1
gb_3 gb_3
gb_2 gb_2
end type
global w_consulta_doc_entrada w_consulta_doc_entrada

type variables
Boolean m_confirmar, m_incluir, m_excluir, m_gerar, m_fechar, m_imprimir
end variables

on w_consulta_doc_entrada.create
this.sle_2=create sle_2
this.st_2=create st_2
this.dw_2=create dw_2
this.dw_1=create dw_1
this.sle_1=create sle_1
this.st_1=create st_1
this.gb_1=create gb_1
this.gb_3=create gb_3
this.gb_2=create gb_2
this.Control[]={this.sle_2,&
this.st_2,&
this.dw_2,&
this.dw_1,&
this.sle_1,&
this.st_1,&
this.gb_1,&
this.gb_3,&
this.gb_2}
end on

on w_consulta_doc_entrada.destroy
destroy(this.sle_2)
destroy(this.st_2)
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.sle_1)
destroy(this.st_1)
destroy(this.gb_1)
destroy(this.gb_3)
destroy(this.gb_2)
end on

event open;m_fechar = True
m_incluir = False
m_gerar = False
m_confirmar = False
m_excluir = False
m_imprimir = false


end event

event activate;of_menu_activated( m_confirmar, m_incluir, m_excluir, m_gerar, m_imprimir, m_fechar)
end event

event close;of_menu_in_close()
end event

type sle_2 from singlelineedit within w_consulta_doc_entrada
integer x = 1669
integer y = 108
integer width = 402
integer height = 72
integer taborder = 20
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

event modified;Integer recuperar_dw1, recuperar_dw2, n_nota, nulo
n_nota = integer(this.text)

if (n_nota>0) then



	dw_1.settransobject(SQLCA)
	recuperar_dw1 = dw_1.retrieve(nulo, n_nota)

	if(recuperar_dw1 = 0) then
		dw_1.reset()
		dw_2.reset()
		Messagebox("Atenção", "Não existe nenhuma nota referente ao numero: "+string(n_nota))
		this.setfocus()
	

	else
		
		Integer codigo_movimento
		codigo_movimento = dw_1.GetItemNumber(1,"movimento_entrada_id")
		dw_2.settransobject(SQLCA)
		recuperar_dw2 = dw_2.retrieve(codigo_movimento)
		
		
	end if



else
	
	Messagebox("Atenção", "O Campo 'Nº Documento' deve conter apenas números")
	
end if

this.text = ""
this.setfocus()





end event

type st_2 from statictext within w_consulta_doc_entrada
integer x = 1138
integer y = 120
integer width = 549
integer height = 60
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "ou  Nº Nota Fiscal:"
boolean focusrectangle = false
end type

type dw_2 from datawindow within w_consulta_doc_entrada
integer x = 96
integer y = 840
integer width = 2949
integer height = 1264
integer taborder = 30
string dataobject = "d_consulta_doc_entrada_produtos"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type dw_1 from datawindow within w_consulta_doc_entrada
integer x = 96
integer y = 308
integer width = 2249
integer height = 400
string title = "none"
string dataobject = "d_consulta_doc_entrada_top"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type sle_1 from singlelineedit within w_consulta_doc_entrada
integer x = 672
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

event modified;Integer recuperar_dw1, recuperar_dw2, n_doc, nulo
n_doc = integer(this.text)

if (n_doc>0) then

	
	dw_1.settransobject(SQLCA)
	recuperar_dw1 = dw_1.retrieve(n_doc, nulo)

	if(recuperar_dw1 = 0) then
		dw_1.reset()
		dw_2.reset()
		Messagebox("Atenção", "Não existe nenhum documento referente ao numero: "+ string(n_doc))
		this.setfocus()
			
	else
		
		Integer codigo_movimento
		codigo_movimento = dw_1.GetItemNumber(1,"movimento_entrada_id")
		dw_2.settransobject(SQLCA)
		recuperar_dw2 = dw_2.retrieve(codigo_movimento)
		
	end if


else
	
	Messagebox("Atenção", "O Campo 'Nº Documento' deve conter apenas números")
	
end if

this.text = ""
this.setfocus()





end event

type st_1 from statictext within w_consulta_doc_entrada
integer x = 247
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

type gb_1 from groupbox within w_consulta_doc_entrada
integer x = 64
integer y = 20
integer width = 2304
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

type gb_3 from groupbox within w_consulta_doc_entrada
integer x = 64
integer y = 256
integer width = 2304
integer height = 480
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

type gb_2 from groupbox within w_consulta_doc_entrada
integer x = 64
integer y = 776
integer width = 3022
integer height = 1372
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

