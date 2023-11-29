$PBExportHeader$w_cad_produto.srw
forward
global type w_cad_produto from window
end type
type st_maior_codigo from statictext within w_cad_produto
end type
type st_2 from statictext within w_cad_produto
end type
type st_1 from statictext within w_cad_produto
end type
type gb_3 from groupbox within w_cad_produto
end type
type ddlb_fornecedor from dropdownlistbox within w_cad_produto
end type
type dw_1 from datawindow within w_cad_produto
end type
type gb_2 from groupbox within w_cad_produto
end type
type gb_1 from groupbox within w_cad_produto
end type
end forward

global type w_cad_produto from window
integer width = 9225
integer height = 3520
boolean titlebar = true
string title = "Cadastro de Produtos"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean hscrollbar = true
boolean vscrollbar = true
windowtype windowtype = child!
long backcolor = 67108864
string icon = "Report5!"
boolean center = true
event ue_incluir ( )
event ue_excluir ( )
event ue_salvar ( )
event ue_protect ( )
event f5 pbm_dwnkey
st_maior_codigo st_maior_codigo
st_2 st_2
st_1 st_1
gb_3 gb_3
ddlb_fornecedor ddlb_fornecedor
dw_1 dw_1
gb_2 gb_2
gb_1 gb_1
end type
global w_cad_produto w_cad_produto

type variables
Boolean m_confirmar, m_incluir, m_excluir, m_gerar, m_fechar, prossegue


end variables

on w_cad_produto.create
this.st_maior_codigo=create st_maior_codigo
this.st_2=create st_2
this.st_1=create st_1
this.gb_3=create gb_3
this.ddlb_fornecedor=create ddlb_fornecedor
this.dw_1=create dw_1
this.gb_2=create gb_2
this.gb_1=create gb_1
this.Control[]={this.st_maior_codigo,&
this.st_2,&
this.st_1,&
this.gb_3,&
this.ddlb_fornecedor,&
this.dw_1,&
this.gb_2,&
this.gb_1}
end on

on w_cad_produto.destroy
destroy(this.st_maior_codigo)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.gb_3)
destroy(this.ddlb_fornecedor)
destroy(this.dw_1)
destroy(this.gb_2)
destroy(this.gb_1)
end on

type st_maior_codigo from statictext within w_cad_produto
integer x = 142
integer y = 400
integer width = 654
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 16711680
long backcolor = 67108864
string text = "[Não há registro]"
boolean focusrectangle = false
end type

type st_2 from statictext within w_cad_produto
integer x = 142
integer y = 340
integer width = 357
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Anteriormente:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_cad_produto
integer x = 142
integer y = 280
integer width = 562
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Maior Código Cadastrado"
boolean focusrectangle = false
end type

type gb_3 from groupbox within w_cad_produto
integer x = 101
integer y = 212
integer width = 709
integer height = 264
integer textsize = -8
integer weight = 400
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Registro:"
end type

type ddlb_fornecedor from dropdownlistbox within w_cad_produto
integer x = 1376
integer y = 268
integer width = 1550
integer height = 580
integer taborder = 10
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Microsoft Sans Serif"
long backcolor = 15780518
boolean border = false
boolean vscrollbar = true
integer limit = 1
borderstyle borderstyle = stylelowered!
end type

event constructor;int i_err
String nome


DECLARE dyn_cursor CURSOR FOR SELECT nome from fornecedor;
OPEN dyn_cursor;

DO
     FETCH dyn_cursor into :nome;
     i_err = SQLCA.SQLCode
	     IF(i_err = 0) THEN
   	       ddlb_fornecedor.additem(nome)
     	END IF
		  
LOOP WHILE(i_err = 0)
CLOSE dyn_cursor;



		


end event

event selectionchanged;string maior_codigo_cadastrado

if dw_1.RowCount() < 1 then //abre rowcount
	
dw_1.SetTransObject(SQLCA) // produto	
dw_1.InsertRow(0)


dw_1.object.desconto[1] = 0




dw_1.SetFocus()


select max(cast (codigo as integer))
into :maior_codigo_cadastrado
from produto ;

			if SQLCA.SQLCode = 0 then
				st_maior_codigo.text = "Item Código: [   "+maior_codigo_cadastrado+"   ]"
				//Messagebox("Atenção","O Código informado já está cadastrado")
				//return 1
			End if	
			
			
gb_3.visible = true
st_1.visible = true
st_2.visible = true
st_maior_codigo.visible = true




end if //fecha rowcount menor < 1




end event

type dw_1 from datawindow within w_cad_produto
event enter pbm_dwnprocessenter
event f5 pbm_dwnkey
integer x = 50
integer y = 548
integer width = 5851
integer height = 2104
integer taborder = 20
string title = "none"
string dataobject = "d_produto"
boolean minbox = true
boolean maxbox = true
boolean border = false
boolean livescroll = true
end type

event enter;w_cad_produto.GetActiveSheet().TriggerEvent("ue_incluir")
end event

type gb_2 from groupbox within w_cad_produto
integer x = 1138
integer y = 164
integer width = 1961
integer height = 292
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fornecedor"
end type

type gb_1 from groupbox within w_cad_produto
integer x = 18
integer y = 84
integer width = 5979
integer height = 2628
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

