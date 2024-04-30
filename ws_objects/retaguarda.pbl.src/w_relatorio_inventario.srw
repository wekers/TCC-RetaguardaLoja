$PBExportHeader$w_relatorio_inventario.srw
forward
global type w_relatorio_inventario from window
end type
type cb_export_pdf from commandbutton within w_relatorio_inventario
end type
type cb_export_excel from commandbutton within w_relatorio_inventario
end type
type rb_2 from radiobutton within w_relatorio_inventario
end type
type rb_1 from radiobutton within w_relatorio_inventario
end type
type uo_1 from u_progress_bar within w_relatorio_inventario
end type
type dw_1 from datawindow within w_relatorio_inventario
end type
type gb_1 from groupbox within w_relatorio_inventario
end type
type gb_2 from groupbox within w_relatorio_inventario
end type
end forward

global type w_relatorio_inventario from window
integer width = 3973
integer height = 2548
boolean titlebar = true
string title = "Relatório de Inventário"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
long backcolor = 67108864
string icon = "Report5!"
boolean clientedge = true
boolean center = true
event ue_gerar ( )
event ue_imprimir ( )
cb_export_pdf cb_export_pdf
cb_export_excel cb_export_excel
rb_2 rb_2
rb_1 rb_1
uo_1 uo_1
dw_1 dw_1
gb_1 gb_1
gb_2 gb_2
end type
global w_relatorio_inventario w_relatorio_inventario

type variables
Boolean m_confirmar, m_incluir, m_excluir, m_gerar, m_fechar, m_imprimir
long vi_total, vi_fila_actual
boolean retrieve_cancel = false
end variables

event ue_gerar();Integer recuperar

dw_1.settransobject(SQLCA)
recuperar = dw_1.retrieve()

m_menu.m_editar.m_imprimir.enabled = true
m_imprimir = true
cb_export_excel.enabled = true
cb_export_pdf.enabled = true

if(rb_1.checked = true) then

	dw_1.SetRedraw(false)
	dw_1.SetSort("#1 A")
	dw_1.Sort()
	dw_1.SetRedraw(true)

else
		
	dw_1.SetRedraw(false)
	dw_1.setsort("#2 A")
	dw_1.sort()
	dw_1.SetRedraw(true)
	
end if
	
dw_1.object.codigo.Color =  "0~tIf(saldo<0,255,if(saldo=0,0,16711680))"
dw_1.object.descricao.Color =  "0~tIf(saldo<0,255,if(saldo=0,0,16711680))"
dw_1.object.und.Color =  "0~tIf(saldo<0,255,if(saldo=0,0,16711680))"
dw_1.object.preco_custo.Color =  "0~tIf(saldo<0,255,if(saldo=0,0,16711680))"
dw_1.object.preco_venda.Color =  "0~tIf(saldo<0,255,if(saldo=0,0,16711680))"
dw_1.object.desconto.Color =  "0~tIf(saldo<0,255,if(saldo=0,0,16711680))"
dw_1.object.preco_final_venda.Color =  "0~tIf(saldo<0,255,if(saldo=0,0,16711680))"
dw_1.object.saldo.Color =  "0~tIf(saldo<0,255,if(saldo=0,0,16711680))"
dw_1.object.t_2.Color =  "0~tIf(saldo<0,255,if(saldo=0,0,16711680))"


end event

event ue_imprimir();
datastore lds_aux
int li_return
lds_aux = create datastore
lds_aux.dataobject = 'd_relatorio_inventario_print'
lds_aux.SetTransObject(SQLCA)
lds_aux.Retrieve()


	if(rb_1.checked = true) then

		lds_aux.SetSort("#1 A")
		lds_aux.Sort()

	else
	
		lds_aux.setsort("#2 A")
		lds_aux.sort()
	
	end if
	
lds_aux.object.codigo.Color =  "0~tIf(saldo<0,255,if(saldo=0,0,16711680))"
lds_aux.object.descricao.Color =  "0~tIf(saldo<0,255,if(saldo=0,0,16711680))"
lds_aux.object.und.Color =  "0~tIf(saldo<0,255,if(saldo=0,0,16711680))"
lds_aux.object.preco_custo.Color =  "0~tIf(saldo<0,255,if(saldo=0,0,16711680))"
lds_aux.object.preco_venda.Color =  "0~tIf(saldo<0,255,if(saldo=0,0,16711680))"
lds_aux.object.desconto.Color =  "0~tIf(saldo<0,255,if(saldo=0,0,16711680))"
lds_aux.object.preco_final_venda.Color =  "0~tIf(saldo<0,255,if(saldo=0,0,16711680))"
lds_aux.object.saldo.Color =  "0~tIf(saldo<0,255,if(saldo=0,0,16711680))"
lds_aux.object.t_2.Color =  "0~tIf(saldo<0,255,if(saldo=0,0,16711680))"

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

on w_relatorio_inventario.create
this.cb_export_pdf=create cb_export_pdf
this.cb_export_excel=create cb_export_excel
this.rb_2=create rb_2
this.rb_1=create rb_1
this.uo_1=create uo_1
this.dw_1=create dw_1
this.gb_1=create gb_1
this.gb_2=create gb_2
this.Control[]={this.cb_export_pdf,&
this.cb_export_excel,&
this.rb_2,&
this.rb_1,&
this.uo_1,&
this.dw_1,&
this.gb_1,&
this.gb_2}
end on

on w_relatorio_inventario.destroy
destroy(this.cb_export_pdf)
destroy(this.cb_export_excel)
destroy(this.rb_2)
destroy(this.rb_1)
destroy(this.uo_1)
destroy(this.dw_1)
destroy(this.gb_1)
destroy(this.gb_2)
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


end event

type cb_export_pdf from commandbutton within w_relatorio_inventario
integer x = 3013
integer y = 52
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
string text = "Exportar para &PDF"
end type

event clicked;string hoje
hoje = "Inventario-"+String(Today(), "yyyy-m-d")+".pdf"

datastore lds_aux
int li_return
lds_aux = create datastore
lds_aux.dataobject = 'd_relatorio_inventario_print'
lds_aux.SetTransObject(SQLCA)
lds_aux.Retrieve()


	if(rb_1.checked = true) then

		lds_aux.SetSort("#1 A")
		lds_aux.Sort()

	else
	
		lds_aux.setsort("#2 A")
		lds_aux.sort()
	
	end if
	
lds_aux.object.codigo.Color =  "0~tIf(saldo<0,255,if(saldo=0,0,16711680))"
lds_aux.object.descricao.Color =  "0~tIf(saldo<0,255,if(saldo=0,0,16711680))"
lds_aux.object.und.Color =  "0~tIf(saldo<0,255,if(saldo=0,0,16711680))"
lds_aux.object.preco_custo.Color =  "0~tIf(saldo<0,255,if(saldo=0,0,16711680))"
lds_aux.object.preco_venda.Color =  "0~tIf(saldo<0,255,if(saldo=0,0,16711680))"
lds_aux.object.desconto.Color =  "0~tIf(saldo<0,255,if(saldo=0,0,16711680))"
lds_aux.object.preco_final_venda.Color =  "0~tIf(saldo<0,255,if(saldo=0,0,16711680))"
lds_aux.object.saldo.Color =  "0~tIf(saldo<0,255,if(saldo=0,0,16711680))"
lds_aux.object.t_2.Color =  "0~tIf(saldo<0,255,if(saldo=0,0,16711680))"
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

type cb_export_excel from commandbutton within w_relatorio_inventario
integer x = 2299
integer y = 52
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

event clicked;string hoje
hoje = "Inventario-"+String(Today(), "yyyy-m-d")+".xlsx"
string gs_app_dir
gs_app_dir = GetCurrentDirectory()
dw_1.Saveas(gs_app_dir+"\excel\"+hoje, XLSX!, True)
MessageBox("Exportado!", "Exportado para ->"+ gs_app_dir+"\excel\"+hoje)


//st_date.Text = String(Today(), "yy/m/d")
//lds_datastore.Saveas("Document\export.xls",Excel!,TRUE)
////Global var
//string gs_app_dir
//app start
//gs_app_dir = GetCurrentDirectory()
end event

type rb_2 from radiobutton within w_relatorio_inventario
integer x = 1842
integer y = 80
integer width = 338
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Descrição"
boolean checked = true
end type

event clicked;dw_1.SetRedraw(false)
dw_1.setsort("#2 A")
dw_1.sort()
dw_1.SetRedraw(true)

end event

type rb_1 from radiobutton within w_relatorio_inventario
integer x = 1568
integer y = 80
integer width = 274
integer height = 76
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Código"
end type

event clicked;dw_1.SetRedraw(false)
dw_1.SetSort("#1 A")
dw_1.Sort()
dw_1.SetRedraw(true)


end event

type uo_1 from u_progress_bar within w_relatorio_inventario
boolean visible = false
integer x = 1339
integer y = 984
integer taborder = 20
boolean bringtotop = true
end type

on uo_1.destroy
call u_progress_bar::destroy
end on

type dw_1 from datawindow within w_relatorio_inventario
integer x = 69
integer y = 252
integer width = 3767
integer height = 2032
integer taborder = 10
string title = "none"
string dataobject = "d_relatorio_inventario"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event retrievestart;string descricao
vi_fila_actual = 0
uo_1.VISIBLE = true				

SELECT Count(codigo) INTO :vi_total 
    FROM "produto" ;
end event

event retrieverow;vi_fila_actual ++											
uo_1.porcentage( (vi_fila_actual*100)/vi_total) 
this.scrolltorow( vi_fila_actual)		
end event

event retrieveend;uo_1.visible = false
uo_1.porcentage(0)
retrieve_cancel = false

end event

type gb_1 from groupbox within w_relatorio_inventario
integer x = 46
integer y = 168
integer width = 3845
integer height = 2140
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Produtos"
end type

type gb_2 from groupbox within w_relatorio_inventario
integer x = 1486
integer y = 24
integer width = 731
integer height = 140
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Ordenar"
end type

