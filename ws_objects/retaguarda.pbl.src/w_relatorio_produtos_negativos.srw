$PBExportHeader$w_relatorio_produtos_negativos.srw
forward
global type w_relatorio_produtos_negativos from window
end type
type cb_export_pdf from commandbutton within w_relatorio_produtos_negativos
end type
type dw_1 from datawindow within w_relatorio_produtos_negativos
end type
type gb_1 from groupbox within w_relatorio_produtos_negativos
end type
end forward

global type w_relatorio_produtos_negativos from window
integer width = 4005
integer height = 2552
boolean titlebar = true
string title = "Produtos com saldo negativo"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
long backcolor = 67108864
string icon = "Warning!"
boolean clientedge = true
boolean center = true
event ue_gerar ( )
event ue_imprimir ( )
cb_export_pdf cb_export_pdf
dw_1 dw_1
gb_1 gb_1
end type
global w_relatorio_produtos_negativos w_relatorio_produtos_negativos

type variables
Boolean m_confirmar, m_incluir, m_excluir, m_gerar, m_fechar, m_imprimir
end variables

event ue_gerar();Integer recuperar

dw_1.settransobject(SQLCA)
recuperar = dw_1.retrieve()

if recuperar > 0 then
	m_menu.m_editar.m_imprimir.enabled = true
	m_imprimir = true
	cb_export_pdf.enabled = true
else
	m_menu.m_editar.m_imprimir.enabled = false
	m_imprimir = false
	cb_export_pdf.enabled = false
	MessageBox("Atenção", "Não foi encontrado nenhum produto com saldo negativo.")
end if
end event

event ue_imprimir();datastore lds_aux
int li_return
lds_aux = create datastore
lds_aux.dataobject = 'd_relatorio_produtos_negativos_print'
lds_aux.settransobject(sqlca)
lds_aux.retrieve()

//cabeçalho
lds_aux.Object.t_5.Text = t_5
lds_aux.Object.t_6.Text = t_6
lds_aux.Object.t_7.Text = t_7
lds_aux.Object.t_8.Text = t_8
lds_aux.Object.t_9.Text = t_9

li_return = lds_aux.Print(false,true)
	if isnull(li_return) or li_return = -1 then
		messagebox('','Erro print em d_relatorio_produtos_negativos. Reporte ao desenvolvedor!')
	end if
destroy lds_aux

end event

event activate;of_menu_activated( m_confirmar, m_incluir, m_excluir, m_gerar, m_imprimir, m_fechar)
end event

event close;of_menu_in_close()
end event

event open;m_fechar = True
m_incluir = False
m_gerar = true
m_confirmar = False
m_excluir = False
m_imprimir = false
end event

on w_relatorio_produtos_negativos.create
this.cb_export_pdf=create cb_export_pdf
this.dw_1=create dw_1
this.gb_1=create gb_1
this.Control[]={this.cb_export_pdf,&
this.dw_1,&
this.gb_1}
end on

on w_relatorio_produtos_negativos.destroy
destroy(this.cb_export_pdf)
destroy(this.dw_1)
destroy(this.gb_1)
end on

type cb_export_pdf from commandbutton within w_relatorio_produtos_negativos
integer x = 78
integer y = 36
integer width = 603
integer height = 100
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "Exportar para &PDF"
end type

event clicked;string hoje
hoje = "Produtos_Negativos-"+String(Today(), "yyyy-m-d")+".pdf"

datastore lds_aux
int li_return
lds_aux = create datastore
lds_aux.dataobject = 'd_relatorio_produtos_negativos_print'
lds_aux.SetTransObject(SQLCA)
lds_aux.Retrieve()
lds_aux.Object.DataWindow.Export.PDF.Method = NativePDF!

//cabeçalho
lds_aux.Object.t_5.Text = t_5
lds_aux.Object.t_6.Text = t_6
lds_aux.Object.t_7.Text = t_7
lds_aux.Object.t_8.Text = t_8
lds_aux.Object.t_9.Text = t_9

string gs_app_dir
gs_app_dir = GetCurrentDirectory()
lds_aux.Saveas(gs_app_dir+"\pdf\"+hoje, PDF!, True)
MessageBox("Exportado!", "Exportado para ->"+ gs_app_dir+"\pdf\"+hoje)


end event

type dw_1 from datawindow within w_relatorio_produtos_negativos
integer x = 105
integer y = 256
integer width = 3685
integer height = 2120
integer taborder = 10
string title = "none"
string dataobject = "d_relatorio_produtos_negativos"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_1 from groupbox within w_relatorio_produtos_negativos
integer x = 73
integer y = 164
integer width = 3785
integer height = 2260
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Microsoft Sans Serif"
long textcolor = 16711680
long backcolor = 67108864
string text = "Produtos"
end type

