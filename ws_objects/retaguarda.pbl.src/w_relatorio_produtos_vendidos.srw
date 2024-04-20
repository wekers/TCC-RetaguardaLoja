$PBExportHeader$w_relatorio_produtos_vendidos.srw
forward
global type w_relatorio_produtos_vendidos from window
end type
type cb_export_pdf from commandbutton within w_relatorio_produtos_vendidos
end type
type cb_export_excel from commandbutton within w_relatorio_produtos_vendidos
end type
type st_1 from statictext within w_relatorio_produtos_vendidos
end type
type em_final from editmask within w_relatorio_produtos_vendidos
end type
type em_inicial from editmask within w_relatorio_produtos_vendidos
end type
type dw_1 from datawindow within w_relatorio_produtos_vendidos
end type
type gb_3 from groupbox within w_relatorio_produtos_vendidos
end type
end forward

global type w_relatorio_produtos_vendidos from window
integer width = 5070
integer height = 2704
boolean titlebar = true
string title = "Produtos Vendidos"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
long backcolor = 67108864
string icon = "OleGenReg!"
boolean clientedge = true
boolean center = true
event ue_gerar ( )
event ue_imprimir ( )
cb_export_pdf cb_export_pdf
cb_export_excel cb_export_excel
st_1 st_1
em_final em_final
em_inicial em_inicial
dw_1 dw_1
gb_3 gb_3
end type
global w_relatorio_produtos_vendidos w_relatorio_produtos_vendidos

type variables
Boolean m_confirmar, m_incluir, m_excluir, m_gerar, m_fechar, m_imprimir
end variables

event ue_gerar();Date inicio, final
Integer recuperar

	if(date(em_inicial.text)) > (date(em_final.text)) then
		Messagebox("Atenção","A data inicial não pode ser maior que a final")
		SetFocus( em_inicial )
		
	else
		
		dw_1.settransobject(SQLCA)
		
		inicio = date(em_inicial.text)
		final = date(em_final.text)
	
		dw_1.SetFilter("")
	   	dw_1.Filter()
		
		recuperar = dw_1.retrieve(inicio, final)
		cb_export_excel.enabled = true
		cb_export_pdf.enabled = true
	
		if (recuperar = 0) then
			m_menu.m_editar.m_imprimir.enabled = false
			m_imprimir = false
			cb_export_excel.enabled = false
			cb_export_pdf.enabled = false
			MessageBox("Atenção", "Não foi encontrado nenhum produto referente a este período.")
		else
			m_menu.m_editar.m_imprimir.enabled = true
			m_imprimir = true
		end if
			
	end if
end event

event ue_imprimir();Date inicio, final

inicio = date(em_inicial.text)
final = date(em_final.text)
	

datastore lds_aux
int li_return
lds_aux = create datastore
lds_aux.dataobject = 'd_relatorio_produtos_vendidos_print'

lds_aux.SetTransObject(SQLCA)
lds_aux.Retrieve(inicio,final)
lds_aux.object.t_periodo.text = "Período: "+String(inicio) +" à " +String(final)

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

on w_relatorio_produtos_vendidos.create
this.cb_export_pdf=create cb_export_pdf
this.cb_export_excel=create cb_export_excel
this.st_1=create st_1
this.em_final=create em_final
this.em_inicial=create em_inicial
this.dw_1=create dw_1
this.gb_3=create gb_3
this.Control[]={this.cb_export_pdf,&
this.cb_export_excel,&
this.st_1,&
this.em_final,&
this.em_inicial,&
this.dw_1,&
this.gb_3}
end on

on w_relatorio_produtos_vendidos.destroy
destroy(this.cb_export_pdf)
destroy(this.cb_export_excel)
destroy(this.st_1)
destroy(this.em_final)
destroy(this.em_inicial)
destroy(this.dw_1)
destroy(this.gb_3)
end on

event open;m_fechar = True
m_incluir = False
m_gerar = true
m_confirmar = False
m_excluir = False
m_imprimir = false

em_inicial.text = string(today())
em_final.text  = string(today())



end event

event activate;of_menu_activated( m_confirmar, m_incluir, m_excluir, m_gerar, m_imprimir, m_fechar)
end event

event close;of_menu_in_close()
end event

type cb_export_pdf from commandbutton within w_relatorio_produtos_vendidos
integer x = 1829
integer y = 124
integer width = 603
integer height = 100
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "E&xportar para PDF"
end type

event clicked;string periodo, inicio_s, final_s
Date inicio, final

inicio = date(em_inicial.text)
final = date(em_final.text)
inicio_s = String(inicio,"yyyy-mm-dd")
final_s = String(final,"yyyy-mm-dd")

//dw_1.Object.DataWindow.Export.PDF.Method = NativePDF!


datastore lds_aux
int li_return
lds_aux = create datastore
lds_aux.dataobject = 'd_relatorio_produtos_vendidos_print'
lds_aux.settransobject(sqlca)
lds_aux.retrieve(inicio,final)
lds_aux.object.t_periodo.text = "De "+ String(em_inicial.text)+ " até " +String(em_final.text)
lds_aux.Object.DataWindow.Export.PDF.Method = NativePDF!

//cabeçalho
lds_aux.Object.t_5.Text = t_5
lds_aux.Object.t_6.Text = t_6
lds_aux.Object.t_7.Text = t_7
lds_aux.Object.t_8.Text = t_8
lds_aux.Object.t_9.Text = t_9

periodo = "Produtos-Vendidos-"+inicio_s+"-a-"+final_s+".pdf"
string gs_app_dir
gs_app_dir = GetCurrentDirectory()
lds_aux.Saveas(gs_app_dir+"\pdf\"+periodo, PDF!, True)

MessageBox("Exportado!", "Exportado para ->"+ gs_app_dir+"\pdf\"+periodo)

/*
string periodo, inicio_s, final_s
Date inicio, final

inicio = date(em_inicial.text)
final = date(em_final.text)
inicio_s = String(inicio,"yyyy-mmm-dd")
final_s = String(final,"yyyy-mmm-dd")

//hoje = "Inventario-"+String(Today(), "yyyy-m-d")+".xlsx"
periodo = "Produtos-Vendidos-"+inicio_s+"-a-"+final_s+".xlsx"
string gs_app_dir
gs_app_dir = GetCurrentDirectory()
dw_1.Saveas(gs_app_dir+"\excel\"+periodo, XLSX!, True)

MessageBox("Exportado!", "Exportado para ->"+ gs_app_dir+"\excel\"+periodo)
*/
end event

type cb_export_excel from commandbutton within w_relatorio_produtos_vendidos
integer x = 1170
integer y = 124
integer width = 603
integer height = 100
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "E&xportar para Excel"
end type

event clicked;string periodo, inicio_s, final_s
Date inicio, final

inicio = date(em_inicial.text)
final = date(em_final.text)
inicio_s = String(inicio,"yyyy-mm-dd")
final_s = String(final,"yyyy-mm-dd")

//hoje = "Inventario-"+String(Today(), "yyyy-m-d")+".xlsx"
periodo = "Produtos-Vendidos-"+inicio_s+"-a-"+final_s+".xlsx"
string gs_app_dir
gs_app_dir = GetCurrentDirectory()
dw_1.Saveas(gs_app_dir+"\excel\"+periodo, XLSX!, True)

MessageBox("Exportado!", "Exportado para ->"+ gs_app_dir+"\excel\"+periodo)


//st_date.Text = String(Today(), "yy/m/d")
//lds_datastore.Saveas("Document\export.xls",Excel!,TRUE)
////Global var
//string gs_app_dir
//app start
//gs_app_dir = GetCurrentDirectory()
end event

type st_1 from statictext within w_relatorio_produtos_vendidos
integer x = 539
integer y = 148
integer width = 73
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "à"
boolean focusrectangle = false
end type

type em_final from editmask within w_relatorio_produtos_vendidos
integer x = 617
integer y = 136
integer width = 379
integer height = 80
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15780518
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yy"
boolean dropdowncalendar = true
end type

type em_inicial from editmask within w_relatorio_produtos_vendidos
integer x = 128
integer y = 136
integer width = 370
integer height = 80
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15780518
borderstyle borderstyle = stylelowered!
maskdatatype maskdatatype = datemask!
string mask = "dd/mm/yy"
boolean dropdowncalendar = true
end type

type dw_1 from datawindow within w_relatorio_produtos_vendidos
integer x = 82
integer y = 300
integer width = 4914
integer height = 1988
integer taborder = 30
string title = "none"
string dataobject = "d_relatorio_produtos_vendidos"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type gb_3 from groupbox within w_relatorio_produtos_vendidos
integer x = 87
integer y = 36
integer width = 951
integer height = 232
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Período"
end type

