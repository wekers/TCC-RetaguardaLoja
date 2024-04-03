$PBExportHeader$w_consulta_doc_devolucao.srw
forward
global type w_consulta_doc_devolucao from window
end type
type dw_1 from datawindow within w_consulta_doc_devolucao
end type
type st_1 from statictext within w_consulta_doc_devolucao
end type
type sle_1 from singlelineedit within w_consulta_doc_devolucao
end type
type gb_1 from groupbox within w_consulta_doc_devolucao
end type
end forward

global type w_consulta_doc_devolucao from window
integer width = 3291
integer height = 2688
boolean titlebar = true
string title = "Consulta Documento Devolução"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean clientedge = true
boolean center = true
event ue_imprimir ( )
dw_1 dw_1
st_1 st_1
sle_1 sle_1
gb_1 gb_1
end type
global w_consulta_doc_devolucao w_consulta_doc_devolucao

type variables
Boolean m_confirmar, m_incluir, m_excluir, m_gerar, m_fechar, m_imprimir
end variables

event ue_imprimir();Integer n_doc
n_doc = dw_1.GetItemNumber(1,"movimento_devolucao_id")


datastore lds_aux
int li_return
lds_aux = create datastore
lds_aux.dataobject = 'd_consulta_doc_devolucao_print'
lds_aux.SetTransObject(SQLCA)
lds_aux.Retrieve(n_doc)

//cabeçalho
lds_aux.Object.t_5.Text = t_5
lds_aux.Object.t_6.Text = t_6
lds_aux.Object.t_7.Text = t_7
lds_aux.Object.t_8.Text = t_8
lds_aux.Object.t_9.Text = t_9

li_return = lds_aux.Print(false,true)
	if isnull(li_return) or li_return = -1 then
		messagebox('','Não foi possível imprimir ou a impressão foi cancelada')
	end if
destroy lds_aux
end event

on w_consulta_doc_devolucao.create
this.dw_1=create dw_1
this.st_1=create st_1
this.sle_1=create sle_1
this.gb_1=create gb_1
this.Control[]={this.dw_1,&
this.st_1,&
this.sle_1,&
this.gb_1}
end on

on w_consulta_doc_devolucao.destroy
destroy(this.dw_1)
destroy(this.st_1)
destroy(this.sle_1)
destroy(this.gb_1)
end on

event activate;of_menu_activated( m_confirmar, m_incluir, m_excluir, m_gerar, m_imprimir, m_fechar)
end event

event close;of_menu_in_close()
end event

event open;m_fechar = True
m_incluir = False
m_gerar = False
m_confirmar = False
m_excluir = False
m_imprimir = false
end event

type dw_1 from datawindow within w_consulta_doc_devolucao
integer x = 18
integer y = 328
integer width = 2985
integer height = 1708
integer taborder = 20
string title = "none"
string dataobject = "d_consulta_doc_devolucao"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_consulta_doc_devolucao
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

type sle_1 from singlelineedit within w_consulta_doc_devolucao
integer x = 603
integer y = 108
integer width = 402
integer height = 72
integer taborder = 10
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

event modified;Integer recuperar, n_doc	
n_doc = integer(this.text)

if (n_doc>0) then



dw_1.settransobject(SQLCA)
recuperar = dw_1.retrieve(n_doc)

	if(recuperar = 0) then
	
		dw_1.reset()
		Messagebox("Atenção", "Não existe nenhum documento referente ao numero: "+ string(n_doc))
		this.setfocus()
		m_menu.m_editar.m_imprimir.enabled = false
		m_imprimir = false

	else
		
		m_menu.m_editar.m_imprimir.enabled = true
		m_imprimir = true
	
	end if

else
	
	Messagebox("Atenção", "O Campo 'Nº Documento' deve conter apenas números")
	
end if

this.text = ""
this.setfocus()





end event

type gb_1 from groupbox within w_consulta_doc_devolucao
integer x = 64
integer y = 20
integer width = 1083
integer height = 212
integer taborder = 10
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

