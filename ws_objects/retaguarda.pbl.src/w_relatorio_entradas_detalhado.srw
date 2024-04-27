$PBExportHeader$w_relatorio_entradas_detalhado.srw
forward
global type w_relatorio_entradas_detalhado from window
end type
type cb_export_pdf from commandbutton within w_relatorio_entradas_detalhado
end type
type cb_export from commandbutton within w_relatorio_entradas_detalhado
end type
type em_inicial from editmask within w_relatorio_entradas_detalhado
end type
type em_final from editmask within w_relatorio_entradas_detalhado
end type
type st_1 from statictext within w_relatorio_entradas_detalhado
end type
type dw_1 from datawindow within w_relatorio_entradas_detalhado
end type
type gb_3 from groupbox within w_relatorio_entradas_detalhado
end type
end forward

global type w_relatorio_entradas_detalhado from window
integer width = 9280
integer height = 2648
boolean titlebar = true
string title = "Relatório Entradas Detalhado"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean hscrollbar = true
boolean vscrollbar = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
event ue_gerar ( )
event ue_imprimir ( )
cb_export_pdf cb_export_pdf
cb_export cb_export
em_inicial em_inicial
em_final em_final
st_1 st_1
dw_1 dw_1
gb_3 gb_3
end type
global w_relatorio_entradas_detalhado w_relatorio_entradas_detalhado

type variables
Boolean m_confirmar, m_incluir, m_excluir, m_gerar, m_fechar, m_imprimir
Integer recuperar
end variables

event ue_gerar();Date inicio, final


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
		//cb_export.enabled = true
		//dw_1.SetRedraw(false)
	  	//dw_1.GroupCalc()
		//dw_1.setfilter("isnull(saida_produtos_codigo[-1]) or saida_produtos_codigo[-1] <> saida_produtos_codigo")
		//dw_1.filter()
		//dw_1.Sort()	
		//dw_1.SetRedraw(true)

	if (recuperar = 0) then
		m_menu.m_editar.m_imprimir.enabled = false
		m_imprimir = false
		cb_export.enabled = false
		cb_export_pdf.enabled = false
		dw_1.Visible = false
		MessageBox("Atenção", "Não foi encontrado nenhum produto referente a este período.")
	else
		dw_1.Visible = true
		cb_export.enabled = true
		cb_export_pdf.enabled = true
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
lds_aux.dataobject = 'd_relatorio_entradas_detalhado_print'

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

on w_relatorio_entradas_detalhado.create
this.cb_export_pdf=create cb_export_pdf
this.cb_export=create cb_export
this.em_inicial=create em_inicial
this.em_final=create em_final
this.st_1=create st_1
this.dw_1=create dw_1
this.gb_3=create gb_3
this.Control[]={this.cb_export_pdf,&
this.cb_export,&
this.em_inicial,&
this.em_final,&
this.st_1,&
this.dw_1,&
this.gb_3}
end on

on w_relatorio_entradas_detalhado.destroy
destroy(this.cb_export_pdf)
destroy(this.cb_export)
destroy(this.em_inicial)
destroy(this.em_final)
destroy(this.st_1)
destroy(this.dw_1)
destroy(this.gb_3)
end on

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


em_inicial.text = string(today())
em_final.text  = string(today())

dw_1.Visible = False
end event

type cb_export_pdf from commandbutton within w_relatorio_entradas_detalhado
integer x = 1911
integer y = 112
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


datastore lds_aux
int li_return
lds_aux = create datastore
lds_aux.dataobject = 'd_relatorio_entradas_detalhado_print'
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


periodo = "Entradas-detalhado-"+inicio_s+"-a-"+final_s+".pdf"
string gs_app_dir
gs_app_dir = GetCurrentDirectory()
lds_aux.Saveas(gs_app_dir+"\pdf\"+periodo, PDF!, True)

MessageBox("Exportado!", "Exportado para ->"+ gs_app_dir+"\pdf\"+periodo)


end event

type cb_export from commandbutton within w_relatorio_entradas_detalhado
integer x = 1230
integer y = 112
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
string text = "E&xportar para Excel"
end type

event clicked;string periodo, inicio_s, final_s
Date inicio, final

inicio = date(em_inicial.text)
final = date(em_final.text)
inicio_s = String(inicio,"yyyy-mm-dd")
final_s = String(final,"yyyy-mm-dd")

//hoje = "Inventario-"+String(Today(), "yyyy-m-d")+".xlsx"
periodo = "Entradas-detalhado-"+inicio_s+"-a-"+final_s+".xlsx"
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

type em_inicial from editmask within w_relatorio_entradas_detalhado
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

event modified;	cb_export.enabled = false
	cb_export_pdf.enabled = false

end event

type em_final from editmask within w_relatorio_entradas_detalhado
integer x = 617
integer y = 136
integer width = 379
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

event modified;	cb_export.enabled = false
	cb_export_pdf.enabled = false

end event

type st_1 from statictext within w_relatorio_entradas_detalhado
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

type dw_1 from datawindow within w_relatorio_entradas_detalhado
event leftrightkey pbm_dwnkey
integer x = 69
integer y = 308
integer width = 8434
integer height = 2096
integer taborder = 10
string title = "none"
string dataobject = "d_relatorio_entradas_detalhado"
boolean hscrollbar = true
boolean vscrollbar = true
boolean border = false
boolean hsplitscroll = true
borderstyle borderstyle = stylelowered!
end type

event leftrightkey;/*
if key=keyRightArrow! then
    Send(Handle(this),256,9,Long(0,0))
	 	  return 1
elseif key=keyLeftArrow! then
	Send(Handle(This),256, 161,Long(0,0))  
	  Send(Handle(this),256,9,Long(0,0))
	  return 1
end if
*/




// ##########################
// # ATENÇÃO!! ##
// Em global external functions:
//	subroutine keybd_event(uint bVk,uint bScan,long dwFlags,long dwExtraInfo ) library 'user32.dll'
// ##########################

integer VK_TAB = 09
integer VK_SHIFT = 16

if key = KeyLeftArrow! then
	keybd_event(VK_SHIFT,0,0,0) // pressiona shift
	keybd_event(VK_TAB,0,0,0) //pressiona tab
	keybd_event(VK_TAB,0,2,0) // libera tab
	keybd_event(VK_SHIFT,0,2,0) //liberashift
	return 1
end if

if key = KeyRightArrow! then
	keybd_event(VK_TAB,0,0,0) //pressiona tab
	keybd_event(VK_TAB,0,2,0) //libera tab
	return 1
end if
end event

event clicked;String ls_old_sort, ls_column 
Char lc_sort 

/* Check when the user clicks on the header */ 

IF Right(dwo.Name,2) = "_t" THEN 

   ls_column = LEFT(dwo.Name, LEN(String(dwo.Name)) - 2) 

   /*Save the last sort, if there were any*/ 
   ls_old_sort = dw_1.Describe("Datawindow.Table.sort") 

   /* It checks when a column was previously ordered and the one that is clicked at the moment is the same or not. If it is the same, then the order of ordering of the previous order (A - Ascending, D - Descending) is checked and changed. If the columns are not the same, order them in ascending order. */ 


   IF ls_column = LEFT(ls_old_sort, LEN(ls_old_sort) - 2) THEN 

      lc_sort = RIGHT(ls_old_sort, 1) 

      IF lc_sort = 'A' THEN 

         lc_sort = 'D' 

      ELSE 

         lc_sort = 'A' 

      END IF 

      dw_1.SetSort(ls_column+" "+lc_sort) 

   ELSE 

      dw_1.SetSort(ls_column+" A") 

   END IF 

   dw_1.Sort() 

END IF 

/*string ls_columnheader,ls_columnName,ls_sortcriteria
ls_columnheader=dwo.name

ls_sortcriteria = this.Object.DataWindow.Table.Sort

if right(ls_columnheader,2)='_t' then // Column header contains _t
 ls_columnName=left(ls_columnheader,(len(ls_columnheader)-2))
 // while sorting we should not have the _t in the name 
 if right(ls_sortcriteria,2)=" D" then
 this.setsort(ls_columnName+" A")
 else
 this.setsort(ls_columnName+" D")
 end if  
 setpointer(hourglass!)
 this.sort( ) 
 
end if */
end event

type gb_3 from groupbox within w_relatorio_entradas_detalhado
integer x = 87
integer y = 36
integer width = 951
integer height = 232
integer taborder = 10
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

