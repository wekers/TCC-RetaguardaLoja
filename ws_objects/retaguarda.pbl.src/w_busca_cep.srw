$PBExportHeader$w_busca_cep.srw
forward
global type w_busca_cep from window
end type
type st_localizar from statictext within w_busca_cep
end type
type cb_fechar from commandbutton within w_busca_cep
end type
type cb_cancelar from commandbutton within w_busca_cep
end type
type cb_inserir from commandbutton within w_busca_cep
end type
type ddlb_1 from dropdownlistbox within w_busca_cep
end type
type dw_1 from datawindow within w_busca_cep
end type
type st_3 from statictext within w_busca_cep
end type
type st_2 from statictext within w_busca_cep
end type
type st_1 from statictext within w_busca_cep
end type
type sle_1 from singlelineedit within w_busca_cep
end type
type gb_1 from groupbox within w_busca_cep
end type
type ddlb_2 from dropdownlistbox within w_busca_cep
end type
end forward

global type w_busca_cep from window
integer width = 3881
integer height = 1300
boolean titlebar = true
string title = "Consulta de Cep por Logradouro"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "DataPipeline!"
boolean center = true
st_localizar st_localizar
cb_fechar cb_fechar
cb_cancelar cb_cancelar
cb_inserir cb_inserir
ddlb_1 ddlb_1
dw_1 dw_1
st_3 st_3
st_2 st_2
st_1 st_1
sle_1 sle_1
gb_1 gb_1
ddlb_2 ddlb_2
end type
global w_busca_cep w_busca_cep

type variables
long vi_total, vi_fila_actual
boolean retrieve_cancel = false
end variables

on w_busca_cep.create
this.st_localizar=create st_localizar
this.cb_fechar=create cb_fechar
this.cb_cancelar=create cb_cancelar
this.cb_inserir=create cb_inserir
this.ddlb_1=create ddlb_1
this.dw_1=create dw_1
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.sle_1=create sle_1
this.gb_1=create gb_1
this.ddlb_2=create ddlb_2
this.Control[]={this.st_localizar,&
this.cb_fechar,&
this.cb_cancelar,&
this.cb_inserir,&
this.ddlb_1,&
this.dw_1,&
this.st_3,&
this.st_2,&
this.st_1,&
this.sle_1,&
this.gb_1,&
this.ddlb_2}
end on

on w_busca_cep.destroy
destroy(this.st_localizar)
destroy(this.cb_fechar)
destroy(this.cb_cancelar)
destroy(this.cb_inserir)
destroy(this.ddlb_1)
destroy(this.dw_1)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.sle_1)
destroy(this.gb_1)
destroy(this.ddlb_2)
end on

event open;st_localizar.visible = false
end event

type st_localizar from statictext within w_busca_cep
integer x = 1513
integer y = 656
integer width = 910
integer height = 128
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 16711680
long backcolor = 15780518
string text = "Localizando Logradouro..."
boolean focusrectangle = false
end type

type cb_fechar from commandbutton within w_busca_cep
integer x = 3401
integer y = 1056
integer width = 370
integer height = 96
integer taborder = 50
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
string text = "Fechar"
end type

event clicked;Close(w_busca_cep)
end event

type cb_cancelar from commandbutton within w_busca_cep
integer x = 2976
integer y = 1056
integer width = 370
integer height = 96
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Cancelar"
end type

event clicked;retrieve_cancel = true


end event

type cb_inserir from commandbutton within w_busca_cep
integer x = 2551
integer y = 1056
integer width = 370
integer height = 96
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
boolean enabled = false
string text = "Inserir"
end type

event clicked;integer ll
string cidade, sigla, cep
ll = dw_1.GetRow()

if de_fornecedor then
w_cad_fornecedor.dw_1.object.cep[1] = string( dw_1.GetItemString(ll,"endereco_cep"))
cep = string( dw_1.GetItemString(ll,"endereco_cep"))
w_cad_fornecedor.dw_2.settransobject(SQLCA)
w_cad_fornecedor.dw_2.Retrieve(cep)
w_cad_fornecedor.dw_1.SetColumn(10)

end if

if de_alt_fornecedor then
w_alt_fornecedor_dados.dw_1.object.cep[1] = string( dw_1.GetItemString(ll,"endereco_cep"))
cep = string( dw_1.GetItemString(ll,"endereco_cep"))
w_alt_fornecedor_dados.dw_2.settransobject(SQLCA)
w_alt_fornecedor_dados.dw_2.Retrieve(cep)
w_alt_fornecedor_dados.dw_1.SetColumn(10)

end if

if de_clientes then
w_cad_clientes.dw_1.object.cep[1] = string(dw_1.GetItemString(ll,"endereco_cep"))
cep = string( dw_1.GetItemString(ll,"endereco_cep"))

	
				string c_bairro, c_logradouro, c_cidade, c_uf, cmun			
	
				SELECT	UPPER("bairro"."bairro_nome"),   
					         UPPER("endereco"."endereco_nome"),   
         					UPPER("cidade"."cidade_nome"),   
         					UPPER("estado"."id_uf"),  
							UPPER("cidade"."codigo_municipio")
				
				INTO :c_bairro, :c_logradouro, :c_cidade, :c_uf, :cmun
			
				FROM "bairro",   
				         "cidade",   
				         "endereco",   
				         "estado"  
			
				WHERE 	( "bairro"."id_cidade" = "cidade"."id_cidade" ) and  
					         ( "endereco"."id_bairro" = "bairro"."id_bairro" ) and  
					         ( "cidade"."id_uf" = "estado"."id_uf" ) and  
					         ( ( "endereco"."cep" = :cep ) )    ;
			

				w_cad_clientes.dw_1.object.logradouro[1] 		= c_logradouro
				w_cad_clientes.dw_1.object.bairro[1] 			= c_bairro
				w_cad_clientes.dw_1.object.cidade[1]			= c_cidade
				w_cad_clientes.dw_1.object.uf[1]					= c_uf
				w_cad_clientes.dw_1.object.cmun[1]					= cmun
				
w_cad_clientes.dw_1.SetColumn(7)

end if

de_alt_fornecedor = false
de_fornecedor = false
de_clientes = false
close(w_busca_cep)
end event

type ddlb_1 from dropdownlistbox within w_busca_cep
integer x = 64
integer y = 204
integer width = 261
integer height = 772
integer taborder = 50
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 12639424
long backcolor = 32768
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event constructor;int i_err
String sigla

DECLARE dyn_cursor CURSOR FOR SELECT id_uf from estado;
OPEN dyn_cursor;

DO
     FETCH dyn_cursor into :sigla;
     i_err = SQLCA.SQLCode
	     IF(i_err = 0) THEN
   	       ddlb_1.additem(sigla)
     	END IF
		  
LOOP WHILE(i_err = 0)
CLOSE dyn_cursor;

ddlb_1.SelectItem ( "SC",2 )

string select_item
string uf_codigo_var

select_item = string(ddlb_1.text)

select		estado.id_uf
into 	 	:uf_codigo_var
from 	 	estado
where 	id_uf = :select_item;

ddlb_2.Reset()

int i_err2
String cidade

DECLARE dyn_cursor2 CURSOR FOR SELECT UPPER (cidade_nome) from cidade where id_uf in (:uf_codigo_var);
OPEN dyn_cursor2;
DO
     FETCH dyn_cursor2 into :cidade;
     i_err2 = SQLCA.SQLCode
	     IF(i_err2 = 0) THEN
   	       ddlb_2.additem(cidade)
     	END IF
		  
LOOP WHILE(i_err2 = 0)
CLOSE dyn_cursor2;

ddlb_2.SelectItem("JOINVILLE",2)

end event

event selectionchanged;string select_item
string uf_codigo_var

select_item = string(ddlb_1.text)

select 	estado.id_uf
into 		:uf_codigo_var
from 		estado
where 	id_uf = :select_item;

ddlb_2.Reset()

int i_err2
String cidade2
DECLARE dyn_cursor2 CURSOR FOR SELECT cidade_nome from cidade where id_uf in (:uf_codigo_var);
OPEN dyn_cursor2;

DO
	
     FETCH dyn_cursor2 into :cidade2;
     i_err2 = SQLCA.SQLCode
	     
		  IF(i_err2 = 0) THEN
   	       ddlb_2.additem(cidade2)
	      END IF
		  
LOOP WHILE(i_err2 = 0)
CLOSE dyn_cursor2;

ddlb_2.SelectItem(1)

sle_1.text = ""
end event

type dw_1 from datawindow within w_busca_cep
integer x = 64
integer y = 500
integer width = 3721
integer height = 544
integer taborder = 20
string dataobject = "d_ceps"
boolean vscrollbar = true
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event rowfocuschanging;cb_inserir.enabled = true
end event

event doubleclicked;long il_selectedrow
il_selectedrow = row

//seletion of row set text to this row and set filter to this
if il_selectedrow <> 0 Then
	cb_inserir.TriggerEvent(Clicked!)
End If
end event

event retrievestart;/*string logradouro, sigla, cidade
vi_fila_actual = 0
uo_1.VISIBLE = true				
logradouro = String("% " +sle_1.text+"%")
sigla = String(ddlb_1.text)
cidade = String(ddlb_2.text)



SELECT Count( ) INTO :vi_total 
    FROM "endereco",   
         	"bairro",   
        		"estado",   
         	"cidade"  
   WHERE ( "endereco"."id_bairro" = "bairro"."id_bairro" ) and  
         ( "bairro"."id_cidade" = "cidade"."id_cidade" ) and  
         ( "cidade"."id_uf" = "estado"."id_uf" ) and  
         ( ( "cidade"."cidade_nome" = :cidade ) AND  
         ( "estado"."id_uf" = :sigla ) AND  
         ( "endereco"."endereco_nome" like :logradouro ) ) ;   
*/




cb_cancelar.enabled = true
cb_fechar.enabled = false
cb_inserir.enabled = false
st_localizar.visible = true
end event

event retrieverow;if retrieve_cancel then 
	messagebox("Ok","Busca Cancelada")
	return 1
end if

/*vi_fila_actual ++											
uo_1.porcentage( (vi_fila_actual*100)/vi_total) 
this.scrolltorow( vi_fila_actual)		*/
end event

event retrieveend;//uo_1.visible = false
//uo_1.porcentage(0)
//retrieve_cancel = false
cb_cancelar.enabled = false
cb_fechar.enabled = true
cb_inserir.enabled = true
st_localizar.visible = false
end event

type st_3 from statictext within w_busca_cep
integer x = 78
integer y = 320
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nome da Rua:"
boolean focusrectangle = false
end type

type st_2 from statictext within w_busca_cep
integer x = 347
integer y = 124
integer width = 402
integer height = 68
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Cidade"
boolean focusrectangle = false
end type

type st_1 from statictext within w_busca_cep
integer x = 96
integer y = 124
integer width = 402
integer height = 64
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Estado"
boolean focusrectangle = false
end type

type sle_1 from singlelineedit within w_busca_cep
integer x = 73
integer y = 388
integer width = 1445
integer height = 88
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 12639424
long backcolor = 32768
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

event modified;String logradouro, sigla, cidade
long result_total
logradouro = Upper(String("% " +sle_1.text+"%"))
sigla = Upper(String(ddlb_1.text))
cidade = Upper(String(ddlb_2.text))

dw_1.settransobject(SQLCA)

	if sle_1.text <> "" then
	
		result_total = dw_1.Retrieve(cidade, sigla, logradouro)
		dw_1.SetFocus()

			if result_total = 0  Then
				cb_inserir.enabled = false
			end if
		
	end if
end event

type gb_1 from groupbox within w_busca_cep
integer x = 27
integer y = 40
integer width = 3790
integer height = 1132
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 67108864
string text = "Busca CEP"
end type

type ddlb_2 from dropdownlistbox within w_busca_cep
integer x = 338
integer y = 204
integer width = 1179
integer height = 908
integer taborder = 40
boolean bringtotop = true
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 12639424
long backcolor = 32768
boolean vscrollbar = true
borderstyle borderstyle = stylelowered!
end type

event selectionchanged;sle_1.text = ""
end event

