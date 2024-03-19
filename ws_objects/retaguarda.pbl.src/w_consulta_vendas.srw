﻿$PBExportHeader$w_consulta_vendas.srw
forward
global type w_consulta_vendas from window
end type
type cb_export from commandbutton within w_consulta_vendas
end type
type st_nome from statictext within w_consulta_vendas
end type
type st_4 from statictext within w_consulta_vendas
end type
type st_3 from statictext within w_consulta_vendas
end type
type sle_cod from singlelineedit within w_consulta_vendas
end type
type st_2 from statictext within w_consulta_vendas
end type
type dw_1 from datawindow within w_consulta_vendas
end type
type st_1 from statictext within w_consulta_vendas
end type
type em_final from editmask within w_consulta_vendas
end type
type em_inicial from editmask within w_consulta_vendas
end type
type rr_1 from roundrectangle within w_consulta_vendas
end type
type rr_2 from roundrectangle within w_consulta_vendas
end type
end forward

global type w_consulta_vendas from window
integer width = 3159
integer height = 2752
boolean titlebar = true
string title = "Consulta Vendas"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
long backcolor = 67108864
string icon = "DosEdit5!"
boolean clientedge = true
boolean center = true
event ue_gerar ( )
event ue_imprimir ( )
cb_export cb_export
st_nome st_nome
st_4 st_4
st_3 st_3
sle_cod sle_cod
st_2 st_2
dw_1 dw_1
st_1 st_1
em_final em_final
em_inicial em_inicial
rr_1 rr_1
rr_2 rr_2
end type
global w_consulta_vendas w_consulta_vendas

type prototypes


end prototypes

type variables
Boolean m_confirmar, m_incluir, m_excluir, m_gerar, m_fechar, m_imprimir
date inicio, final
String vendedor


end variables

event ue_gerar();Integer recuperar
dw_1.settransobject(SQLCA)
vendedor = sle_cod.text

if(date(em_inicial.text)) > (date(em_final.text)) then
	Messagebox("Atenção","A data inicial não pode ser maior que a final")
	SetFocus( em_inicial )
else

	if isNull(vendedor) or (vendedor = "") then
		vendedor = "%"
	end if

	inicio = date(em_inicial.text)
	final = date(em_final.text)
	recuperar = dw_1.retrieve(inicio,final,vendedor)
		
	if recuperar > 0 then
		m_menu.m_editar.m_imprimir.enabled = true
		m_imprimir = true
		cb_export.enabled = True
	else
		m_menu.m_editar.m_imprimir.enabled = false
		m_imprimir = false
		cb_export.enabled = False
		Messagebox("Atenção", "Sem dados para o período informado!")
	end if
	
end if
end event

event ue_imprimir();datastore lds_aux
int li_return
lds_aux = create datastore
lds_aux.dataobject = 'd_consulta_vendas_print'
lds_aux.settransobject(sqlca)
lds_aux.retrieve(inicio,final,vendedor)
lds_aux.object.t_periodo.text = "De "+ String(em_inicial.text)+ " até " +String(em_final.text)

//cabeçalho
lds_aux.Object.t_5.Text = t_5
lds_aux.Object.t_6.Text = t_6
lds_aux.Object.t_7.Text = t_7
lds_aux.Object.t_8.Text = t_8
lds_aux.Object.t_9.Text = t_9

li_return = lds_aux.Print(false,true)
	if isnull(li_return) or li_return = -1 then
		messagebox('','Erro ao imprimir em ref:d_consulta_vendas_print. Reporte ao analista do sistema!')
	end if
destroy lds_aux


end event

on w_consulta_vendas.create
this.cb_export=create cb_export
this.st_nome=create st_nome
this.st_4=create st_4
this.st_3=create st_3
this.sle_cod=create sle_cod
this.st_2=create st_2
this.dw_1=create dw_1
this.st_1=create st_1
this.em_final=create em_final
this.em_inicial=create em_inicial
this.rr_1=create rr_1
this.rr_2=create rr_2
this.Control[]={this.cb_export,&
this.st_nome,&
this.st_4,&
this.st_3,&
this.sle_cod,&
this.st_2,&
this.dw_1,&
this.st_1,&
this.em_final,&
this.em_inicial,&
this.rr_1,&
this.rr_2}
end on

on w_consulta_vendas.destroy
destroy(this.cb_export)
destroy(this.st_nome)
destroy(this.st_4)
destroy(this.st_3)
destroy(this.sle_cod)
destroy(this.st_2)
destroy(this.dw_1)
destroy(this.st_1)
destroy(this.em_final)
destroy(this.em_inicial)
destroy(this.rr_1)
destroy(this.rr_2)
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

event close;of_menu_in_close()
end event

event activate;of_menu_activated( m_confirmar, m_incluir, m_excluir, m_gerar, m_imprimir, m_fechar)
end event

type cb_export from commandbutton within w_consulta_vendas
integer x = 1847
integer y = 148
integer width = 571
integer height = 100
integer taborder = 10
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

inicio = date(em_inicial.text)
final = date(em_final.text)
inicio_s = String(inicio,"yyyy-mm-dd")
final_s = String(final,"yyyy-mm-dd")

//dw_1.Object.DataWindow.Export.PDF.Method = NativePDF!


datastore lds_aux
int li_return
lds_aux = create datastore
lds_aux.dataobject = 'd_consulta_vendas_print'
lds_aux.settransobject(sqlca)
lds_aux.retrieve(inicio,final,vendedor)
lds_aux.object.t_periodo.text = "De "+ String(em_inicial.text)+ " até " +String(em_final.text)
lds_aux.Object.DataWindow.Export.PDF.Method = NativePDF!

//cabeçalho
lds_aux.Object.t_5.Text = t_5
lds_aux.Object.t_6.Text = t_6
lds_aux.Object.t_7.Text = t_7
lds_aux.Object.t_8.Text = t_8
lds_aux.Object.t_9.Text = t_9

periodo = "Consulta-Vendas-"+inicio_s+"-a-"+final_s+".pdf"
string gs_app_dir
gs_app_dir = GetCurrentDirectory()
lds_aux.Saveas(gs_app_dir+"\pdf\"+periodo, PDF!, True)

MessageBox("Exportado!", "Exportado para ->"+ gs_app_dir+"\pdf\"+periodo)

end event

type st_nome from statictext within w_consulta_vendas
integer x = 887
integer y = 400
integer width = 1134
integer height = 76
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15780518
boolean border = true
boolean focusrectangle = false
end type

type st_4 from statictext within w_consulta_vendas
integer x = 891
integer y = 344
integer width = 293
integer height = 52
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Bell MT"
long textcolor = 33554432
long backcolor = 12639424
string text = "Nome:"
boolean focusrectangle = false
end type

type st_3 from statictext within w_consulta_vendas
integer x = 530
integer y = 344
integer width = 343
integer height = 52
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Bell MT"
long textcolor = 33554432
long backcolor = 12639424
string text = "Cód Vendedor:"
boolean focusrectangle = false
end type

type sle_cod from singlelineedit within w_consulta_vendas
integer x = 530
integer y = 400
integer width = 334
integer height = 76
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15780518
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
boolean hideselection = false
end type

event modified;String nome
SELECT nome
	into :nome
FROM usuarios
WHERE CAST(cod as text) = :this.text;

if nome = "" or isNull(nome) then
	MessageBox("Atenção","Código Vendedor Invalido!")
	this.text = ""
	st_nome.text = ""
	SetFocus( this )
	return 1
end if

st_nome.text = " "+nome
end event

type st_2 from statictext within w_consulta_vendas
integer x = 1170
integer y = 116
integer width = 229
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = roman!
string facename = "Bell MT"
long textcolor = 33554432
long backcolor = 12639424
string text = "Período:"
boolean focusrectangle = false
end type

type dw_1 from datawindow within w_consulta_vendas
integer x = 105
integer y = 568
integer width = 2400
integer height = 1624
integer taborder = 40
string title = "none"
string dataobject = "d_consulta_vendas"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

type st_1 from statictext within w_consulta_vendas
integer x = 1253
integer y = 196
integer width = 73
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 12639424
string text = "à"
boolean focusrectangle = false
end type

type em_final from editmask within w_consulta_vendas
integer x = 1349
integer y = 184
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

type em_inicial from editmask within w_consulta_vendas
integer x = 823
integer y = 184
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

type rr_1 from roundrectangle within w_consulta_vendas
long linecolor = 33554432
integer linethickness = 4
long fillcolor = 12639424
integer x = 759
integer y = 112
integer width = 1038
integer height = 172
integer cornerheight = 40
integer cornerwidth = 46
end type

type rr_2 from roundrectangle within w_consulta_vendas
long linecolor = 33554432
integer linethickness = 4
long fillcolor = 12639424
integer x = 494
integer y = 340
integer width = 1554
integer height = 164
integer cornerheight = 40
integer cornerwidth = 46
end type
