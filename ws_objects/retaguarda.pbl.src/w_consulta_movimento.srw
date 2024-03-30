$PBExportHeader$w_consulta_movimento.srw
forward
global type w_consulta_movimento from window
end type
type st_2 from statictext within w_consulta_movimento
end type
type dw_2 from datawindow within w_consulta_movimento
end type
type dw_1 from datawindow within w_consulta_movimento
end type
type sle_text from singlelineedit within w_consulta_movimento
end type
type st_3 from statictext within w_consulta_movimento
end type
type em_inicial from editmask within w_consulta_movimento
end type
type em_final from editmask within w_consulta_movimento
end type
type st_1 from statictext within w_consulta_movimento
end type
type gb_2 from groupbox within w_consulta_movimento
end type
type gb_1 from groupbox within w_consulta_movimento
end type
type gb_3 from groupbox within w_consulta_movimento
end type
end forward

global type w_consulta_movimento from window
integer width = 3250
integer height = 2608
boolean titlebar = true
string title = "Movimentação de Estoque"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
long backcolor = 67108864
string icon = "ServerProfile!"
boolean clientedge = true
boolean center = true
event ue_gerar ( )
event ue_imprimir ( )
st_2 st_2
dw_2 dw_2
dw_1 dw_1
sle_text sle_text
st_3 st_3
em_inicial em_inicial
em_final em_final
st_1 st_1
gb_2 gb_2
gb_1 gb_1
gb_3 gb_3
end type
global w_consulta_movimento w_consulta_movimento

type prototypes

end prototypes

type variables
Boolean m_confirmar, m_incluir, m_excluir, m_gerar, m_fechar, m_imprimir
end variables

event ue_gerar();String codigo
Date inicio, final
Integer recuperar
inicio = date(em_inicial.text)
final = date(em_final.text)


codigo = dw_1.GetItemString(1,"codigo")

	if(date(em_inicial.text)) > (date(em_final.text)) then
		Messagebox("Atenção","A data inicial não pode ser maior que a final")
		SetFocus( em_inicial )

	else
	
		dw_2.settransobject(SQLCA)
		recuperar =	dw_2.retrieve(codigo,inicio,final)
			
			if recuperar > 0 then
				m_menu.m_editar.m_imprimir.enabled = true
				m_imprimir = true
			else
				m_menu.m_editar.m_imprimir.enabled = false
				m_imprimir = false
			end if
			
			
			Long ll_n
			FOR ll_n = 1 to dw_2.RowCount()
				String ls
				ls = dw_2.object.compute_operacao[ll_n]
				if (ls = "ENTRADA") then
			   	    dw_2.object.compute_operacao[ll_n]  =  "Ajuste Entrada"
				elseif (ls = "SAIDA") then
   	   				 dw_2.object.compute_operacao[ll_n]  =  "Ajuste Saida"
				end if
			NEXT
	
	end if
	
	

end event

event ue_imprimir();String codigo
Date inicio, final
inicio = date(em_inicial.text)
final = date(em_final.text)
codigo = dw_1.GetItemString(1,"codigo")

datastore lds_aux
int li_return
lds_aux = create datastore
lds_aux.dataobject = 'd_consulta_movimento_print'

DataWindowChild dwc_first
lds_aux.GetChild("dw_2", dwc_first)
dwc_first.SetTransObject(SQLCA)
dwc_first.Retrieve(codigo)

DataWindowChild dwc_second
lds_aux.GetChild("dw_1", dwc_second)
dwc_second.SetTransObject(SQLCA)
dwc_second.Retrieve(codigo, inicio, final)
lds_aux.object.t_periodo.text = "Período: "+String(inicio) +" à " +String(final)

//cabeçalho
lds_aux.Object.t_5.Text = t_5
lds_aux.Object.t_6.Text = t_6
lds_aux.Object.t_7.Text = t_7
lds_aux.Object.t_8.Text = t_8
lds_aux.Object.t_9.Text = t_9

Long ll_n
			FOR ll_n = 1 to dwc_second.RowCount()
				String ls
				ls = lds_aux.object.dw_1.object.compute_operacao[ll_n]
				if (ls = "ENTRADA") then
			   	    lds_aux.object.dw_1.object.compute_operacao[ll_n]  =  "Ajuste Entrada"
				elseif (ls = "SAIDA") then
   	   				 lds_aux.object.dw_1.object.compute_operacao[ll_n]  =  "Ajuste Saida"
				end if
			NEXT

li_return = lds_aux.Print(false,true)
	if isnull(li_return) or li_return = -1 then
		messagebox('','Não foi possível imprimir ou a impressão foi cancelada')
	end if
destroy lds_aux



end event

on w_consulta_movimento.create
this.st_2=create st_2
this.dw_2=create dw_2
this.dw_1=create dw_1
this.sle_text=create sle_text
this.st_3=create st_3
this.em_inicial=create em_inicial
this.em_final=create em_final
this.st_1=create st_1
this.gb_2=create gb_2
this.gb_1=create gb_1
this.gb_3=create gb_3
this.Control[]={this.st_2,&
this.dw_2,&
this.dw_1,&
this.sle_text,&
this.st_3,&
this.em_inicial,&
this.em_final,&
this.st_1,&
this.gb_2,&
this.gb_1,&
this.gb_3}
end on

on w_consulta_movimento.destroy
destroy(this.st_2)
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.sle_text)
destroy(this.st_3)
destroy(this.em_inicial)
destroy(this.em_final)
destroy(this.st_1)
destroy(this.gb_2)
destroy(this.gb_1)
destroy(this.gb_3)
end on

event open;m_fechar = True
m_incluir = False
m_gerar = false
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

type st_2 from statictext within w_consulta_movimento
integer x = 562
integer y = 2420
integer width = 1874
integer height = 68
integer textsize = -9
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean underline = true
long textcolor = 255
long backcolor = 67108864
string text = "*Para abrir o documento e visualizar -> Duplo click no n° do DOC"
boolean focusrectangle = false
end type

type dw_2 from datawindow within w_consulta_movimento
integer x = 608
integer y = 888
integer width = 1769
integer height = 1496
integer taborder = 40
string title = "none"
string dataobject = "d_consulta_movimento_geral"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event doubleclicked;Integer ll

ll = dw_2.GetRow()

Choose Case this.GetColumnName()
		
	Case 'movimento_entrada_id'

		String operacao
		integer doc
				
		operacao =	dw_2.GetItemString(ll,"compute_operacao")
		
				
		
		if operacao = "Devolução" then
			
			Open(w_consulta_doc_devolucao, w_consulta_movimento)
			
			doc =	dw_2.GetItemnumber(ll,"movimento_entrada_id")			
			w_consulta_doc_devolucao.sle_1.text = string(doc)
			w_consulta_doc_devolucao.sle_1.displayonly = true

			w_consulta_doc_devolucao.sle_1.event modified() 
			w_consulta_doc_devolucao.sle_1.text = string(doc)
			
		elseif operacao = "Saida" then
			
			Open (w_consulta_doc_venda, w_consulta_movimento)
			
			doc =	dw_2.GetItemNumber(ll,"movimento_entrada_id")			
			w_consulta_doc_venda.sle_1.text = string(doc)
			w_consulta_doc_venda.sle_1.displayonly = true

			w_consulta_doc_venda.sle_1.event modified() 
			w_consulta_doc_venda.sle_1.text = string(doc)
		
		elseif operacao = "Entrada" then
			
			Open (w_consulta_doc_entrada, w_consulta_movimento)
			
			doc =	dw_2.GetItemNumber(ll,"movimento_entrada_id")			
			w_consulta_doc_entrada.sle_1.text = string(doc)
			w_consulta_doc_entrada.sle_1.displayonly = true
			w_consulta_doc_entrada.sle_2.displayonly = true

			w_consulta_doc_entrada.sle_1.event modified() 
			w_consulta_doc_entrada.sle_1.text = string(doc)
			
		elseif operacao = "Ajuste Entrada" or operacao = "Ajuste Saida" then
		
			Open (w_consulta_doc_ajuste, w_consulta_movimento)
			
			doc =	dw_2.GetItemNumber(ll,"movimento_entrada_id")			
			w_consulta_doc_ajuste.sle_1.text = string(doc)
			w_consulta_doc_ajuste.sle_1.displayonly = true

			w_consulta_doc_ajuste.sle_1.event modified() 
			w_consulta_doc_ajuste.sle_1.text = string(doc)
			
		end if
	

End Choose


if SQLCA.SQLCode = -1 then
	
	MessageBox ('Error', SQLCA.SQLErrText)
	
end if
end event

type dw_1 from datawindow within w_consulta_movimento
integer x = 87
integer y = 556
integer width = 2994
integer height = 200
string title = "none"
string dataobject = "d_consulta_movimento_produto"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanged;m_menu.m_editar.m_gerar.enabled = true
m_gerar = true
m_menu.m_editar.m_imprimir.enabled = false
m_imprimir = false
end event

type sle_text from singlelineedit within w_consulta_movimento
integer x = 425
integer y = 364
integer width = 1134
integer height = 72
integer taborder = 30
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 15780518
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

event modified;String cod_prod
Integer recuperar
cod_prod = this.text

dw_1.settransobject(SQLCA)
recuperar = dw_1.retrieve(cod_prod)
dw_1.Modify("codigo.Color = ' 0~tIf(saldo < 0,255,0)'")
dw_1.Modify("codigo_fornecedor.Color = ' 0~tIf(saldo < 0,255,0)'")
dw_1.Modify("descricao.Color = ' 0~tIf(saldo < 0,255,0)'")
dw_1.Modify("und.Color = ' 0~tIf(saldo < 0,255,0)'")
dw_1.Modify("saldo.Color = ' 0~tIf(saldo < 0,255,0)'")
dw_2.reset()
m_menu.m_editar.m_imprimir.enabled = false
m_imprimir = false

if(recuperar = 0) then
	openwithparm(w_consulta_movimento_busca_produtos, cod_prod)
	String ls_retorno
	ls_retorno = Message.StringParm
	
	if(ls_retorno = "valido") then
		m_menu.m_editar.m_gerar.enabled = false
		m_gerar = false
	else
		dw_1.retrieve(ls_retorno)
	end if
	
end if

this.text = ""








end event

type st_3 from statictext within w_consulta_movimento
integer x = 146
integer y = 376
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

type em_inicial from editmask within w_consulta_movimento
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

type em_final from editmask within w_consulta_movimento
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

type st_1 from statictext within w_consulta_movimento
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

type gb_2 from groupbox within w_consulta_movimento
integer x = 87
integer y = 272
integer width = 1559
integer height = 244
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
end type

type gb_1 from groupbox within w_consulta_movimento
integer x = 503
integer y = 776
integer width = 1920
integer height = 1644
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Movimentação"
end type

type gb_3 from groupbox within w_consulta_movimento
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

