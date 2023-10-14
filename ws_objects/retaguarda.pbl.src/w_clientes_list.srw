$PBExportHeader$w_clientes_list.srw
forward
global type w_clientes_list from window
end type
type st_3 from statictext within w_clientes_list
end type
type st_2 from statictext within w_clientes_list
end type
type st_1 from statictext within w_clientes_list
end type
type rb_fone from radiobutton within w_clientes_list
end type
type rb_email from radiobutton within w_clientes_list
end type
type rb_cnpj_cpf from radiobutton within w_clientes_list
end type
type rb_nome from radiobutton within w_clientes_list
end type
type sle_buscar from singlelineedit within w_clientes_list
end type
type cb_cancelar from commandbutton within w_clientes_list
end type
type cb_ok from commandbutton within w_clientes_list
end type
type dw_1 from datawindow within w_clientes_list
end type
type gb_1 from groupbox within w_clientes_list
end type
type rr_1 from roundrectangle within w_clientes_list
end type
end forward

global type w_clientes_list from window
integer width = 5618
integer height = 2936
boolean titlebar = true
string title = "Lista de Clientes"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "Form!"
boolean clientedge = true
boolean center = true
st_3 st_3
st_2 st_2
st_1 st_1
rb_fone rb_fone
rb_email rb_email
rb_cnpj_cpf rb_cnpj_cpf
rb_nome rb_nome
sle_buscar sle_buscar
cb_cancelar cb_cancelar
cb_ok cb_ok
dw_1 dw_1
gb_1 gb_1
rr_1 rr_1
end type
global w_clientes_list w_clientes_list

on w_clientes_list.create
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.rb_fone=create rb_fone
this.rb_email=create rb_email
this.rb_cnpj_cpf=create rb_cnpj_cpf
this.rb_nome=create rb_nome
this.sle_buscar=create sle_buscar
this.cb_cancelar=create cb_cancelar
this.cb_ok=create cb_ok
this.dw_1=create dw_1
this.gb_1=create gb_1
this.rr_1=create rr_1
this.Control[]={this.st_3,&
this.st_2,&
this.st_1,&
this.rb_fone,&
this.rb_email,&
this.rb_cnpj_cpf,&
this.rb_nome,&
this.sle_buscar,&
this.cb_cancelar,&
this.cb_ok,&
this.dw_1,&
this.gb_1,&
this.rr_1}
end on

on w_clientes_list.destroy
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.rb_fone)
destroy(this.rb_email)
destroy(this.rb_cnpj_cpf)
destroy(this.rb_nome)
destroy(this.sle_buscar)
destroy(this.cb_cancelar)
destroy(this.cb_ok)
destroy(this.dw_1)
destroy(this.gb_1)
destroy(this.rr_1)
end on

event open;dw_1.settransobject(SQLCA)
dw_1.retrieve()







end event

type st_3 from statictext within w_clientes_list
integer x = 4270
integer y = 412
integer width = 1248
integer height = 52
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 12632256
long backcolor = 67108864
string text = "*Click sobre o ~"Titulo~" para ordenar por ordem alfabética"
boolean focusrectangle = false
end type

type st_2 from statictext within w_clientes_list
integer x = 160
integer y = 60
integer width = 430
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Tipo de Pesquisa"
boolean focusrectangle = false
end type

type st_1 from statictext within w_clientes_list
integer x = 1111
integer y = 184
integer width = 626
integer height = 56
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Campo de busca:"
boolean focusrectangle = false
end type

type rb_fone from radiobutton within w_clientes_list
integer x = 654
integer y = 256
integer width = 343
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Fone"
end type

event clicked;sle_buscar.Setfocus()
dw_1.SetRedraw(false)
dw_1.SetSort("fone asc")
dw_1.Sort()
dw_1.SetRedraw(true)
sle_buscar.text = ""
//sle_buscar.SetMask(NumericMask!, "(##) ####-####")




end event

type rb_email from radiobutton within w_clientes_list
integer x = 137
integer y = 256
integer width = 343
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "E-Mail"
end type

event clicked;sle_buscar.Setfocus()
dw_1.SetRedraw(false)
dw_1.SetSort("email asc")
dw_1.Sort()
dw_1.SetRedraw(true)
sle_buscar.text = ""
end event

type rb_cnpj_cpf from radiobutton within w_clientes_list
integer x = 654
integer y = 160
integer width = 343
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "CPF/CNPJ"
end type

event clicked;sle_buscar.Setfocus()
dw_1.SetRedraw(false)
dw_1.SetSort("cnpj_cpf asc")
dw_1.Sort()
dw_1.SetRedraw(true)
sle_buscar.text = ""
end event

type rb_nome from radiobutton within w_clientes_list
integer x = 137
integer y = 160
integer width = 535
integer height = 72
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nome/Razão Social"
boolean checked = true
end type

event clicked;sle_buscar.Setfocus()
dw_1.SetSort("nome asc")
dw_1.Sort()
dw_1.SetRedraw(true)

sle_buscar.text = ""
end event

type sle_buscar from singlelineedit within w_clientes_list
event buscar pbm_enchange
event enter pbm_keydown
integer x = 1106
integer y = 244
integer width = 1371
integer height = 80
integer taborder = 10
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
textcase textcase = upper!
borderstyle borderstyle = stylelowered!
end type

event buscar;string ls_busca, ls_columna, li_columna
integer li_fila,li_largo


ls_busca = trim(sle_buscar.text)
li_largo=len(ls_busca)

//li_columna = dw_1.Describe("#1.Name")

if rb_nome.Checked then
	sle_buscar.TextCase = upper!
	li_columna = "nome"
elseif rb_cnpj_cpf.Checked then
	li_columna = "cnpj_cpf"
elseif rb_email.checked then
	sle_buscar.TextCase = lower!
	li_columna = "email"
elseif rb_fone.checked then
	li_columna = "fone"
	
end if

ls_busca = "Mid (" + li_columna + ",1,"+ string(li_largo)+ " ) = '" + ls_busca + "'"


//ls_busca = "Match("+ li_columna +", '"+sle_buscar.text+"')"
//ls_busca = "pos("+ li_columna +", '"+sle_buscar.text+"') > 0"
//ll_find = dw_main.Find("Pos(last_name,'a') > 0", ll_find, ll_end)


li_fila = dw_1.Find (ls_busca, 1, dw_1.rowcount())



IF li_fila > 0 THEN
	dw_1.setrow ( li_fila )
	dw_1.ScrollToRow ( li_fila )

else

	dw_1.setrow (1)
	dw_1.ScrollToRow (1)
	
END IF 


end event

event enter;IF KeyDown(KeyEnter!) THEN 
dw_1.SetFocus( ) 
END IF
end event

type cb_cancelar from commandbutton within w_clientes_list
integer x = 5061
integer y = 2696
integer width = 375
integer height = 96
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&CANCELAR"
boolean cancel = true
end type

event clicked;//retrieve_cancel = false
Close(parent)


end event

type cb_ok from commandbutton within w_clientes_list
integer x = 4626
integer y = 2700
integer width = 357
integer height = 96
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "&OK"
end type

event clicked;Integer ll, id

ll = dw_1.GetRow()

if ll > 0 then
dw_1.settransobject(SQLCA)
id =  dw_1.GetItemNumber(ll,"id")
w_cad_clientes.dw_1.Reset()
w_cad_clientes.dw_1.retrieve(id)

string settings
settings = w_cad_clientes.dw_1.Describe("cnpj_cpf.Protect")

	if settings = "1" then
			w_cad_clientes.dw_1.Modify("cnpj_cpf.Protect='0'")
			w_cad_clientes.dw_1.Modify("ie.Protect='0'")
			w_cad_clientes.dw_1.Modify("isuf.Protect='0'")
			w_cad_clientes.dw_1.Modify("cep.Protect='0'")
			w_cad_clientes.dw_1.Modify("logradouro.Protect='0'")
			w_cad_clientes.dw_1.Modify("n_endereco.Protect='0'")
			w_cad_clientes.dw_1.Modify("bairro.Protect='0'")
			w_cad_clientes.dw_1.Modify("logradouro_cpl.Protect='0'")
			w_cad_clientes.dw_1.Modify("cidade.Protect='0'")
			w_cad_clientes.dw_1.Modify("uf.Protect='0'")
			w_cad_clientes.dw_1.Modify("cmun.Protect='0'")
			w_cad_clientes.dw_1.Modify("fone.Protect='0'")
			w_cad_clientes.dw_1.Modify("celular.Protect='0'")
			w_cad_clientes.dw_1.Modify("apelido_ml.Protect='0'")
			w_cad_clientes.dw_1.Modify("email.Protect='0'")
			w_cad_clientes.dw_1.Modify("email_alt.Protect='0'")
			w_cad_clientes.dw_1.Modify("endereco_ent_dif.Protect='0'")
	end if
	
	String tipo_c
	tipo_c = w_cad_clientes.dw_1.GetItemString(1,"tipo_c")
	
	if tipo_c = 'P' then
			w_cad_clientes.dw_1.Modify("cnpj_cpf.EditMask.mask='###.###.###-##'")
			w_cad_clientes.dw_1.Modify("t_cnpj_cpf.text='CPF:'")
//			w_cad_clientes.dw_1.object.cnpj_cpf[1] = ""
			w_cad_clientes.dw_1.Object.ie.Background.color = "8421504" 
			w_cad_clientes.dw_1.Object.isuf.Background.color = "8421504"
			w_cad_clientes.dw_1.SetTabOrder ("ie", 0)	
			w_cad_clientes.dw_1.SetTabOrder ("isuf", 0)	

			w_cad_clientes.tipo_n = False
			w_cad_clientes.tipo_p = True
		end if
		
		if tipo_c = 'N' then
			w_cad_clientes.dw_1.Modify("cnpj_cpf.EditMask.mask='##.###.###/####-##'")
			w_cad_clientes.dw_1.Modify("t_cnpj_cpf.text='CNPJ:'")
	//		w_cad_clientes.dw_1.object.cnpj_cpf[1] = ""
			w_cad_clientes.dw_1.Object.ie.Background.color = 15780518
			w_cad_clientes.dw_1.Object.isuf.Background.color = 15780518
			w_cad_clientes.dw_1.SetTabOrder ("ie", 40)	
			w_cad_clientes.dw_1.SetTabOrder ("isuf", 50)	
			w_cad_clientes.tipo_p = False
			w_cad_clientes.tipo_n = True
		end if	
		
		String tipo_endereco_ent_dif
		
		tipo_endereco_ent_dif = w_cad_clientes.dw_1.GetItemString(1, "endereco_ent_dif")
		
		if tipo_endereco_ent_dif = 'S' then		
			w_cad_clientes.gb_forn.height= 2704
			w_cad_clientes.dw_1.height = 2500
		else
			w_cad_clientes.dw_1.height = 1750
			w_cad_clientes.gb_forn.height= 1948

		end if
		
		
		
		
	
close(parent)

else
	
close(parent)

end if

end event

type dw_1 from datawindow within w_clientes_list
event enter pbm_dwnprocessenter
integer x = 41
integer y = 552
integer width = 5481
integer height = 2076
integer taborder = 20
string title = "none"
string dataobject = "d_clientes_lista"
boolean vscrollbar = true
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event enter;cb_ok.TriggerEvent("clicked")
end event

event doubleclicked;cb_ok.TriggerEvent("clicked")
end event

event rowfocuschanged;cb_ok.enabled = true
end event

event clicked;String            ls_Object
ls_Object = String(dwo.name)


	If ls_Object = "t_id" Then

		dw_1.SetRedraw(false)
		dw_1.SetSort("id asc")
		dw_1.Sort()
		dw_1.SetRedraw(true)

	elseif ls_Object = "t_nome" Then
		dw_1.SetRedraw(false)
		dw_1.SetSort("nome asc")
		dw_1.Sort()
		dw_1.SetRedraw(true)
	elseif ls_Object = "t_apelido_ml" Then
		dw_1.SetRedraw(false)
		dw_1.SetSort("apelido_ml asc")
		dw_1.Sort()
		dw_1.SetRedraw(true)
	elseif ls_Object = "t_email" Then
		dw_1.SetRedraw(false)
		dw_1.SetSort("email asc")
		dw_1.Sort()
		dw_1.SetRedraw(true)
	elseif ls_Object = "t_fone" Then
		dw_1.SetRedraw(false)
		dw_1.SetSort("fone asc")
		dw_1.Sort()
		dw_1.SetRedraw(true)
	elseif ls_Object = "t_cidade" Then
		dw_1.SetRedraw(false)
		dw_1.SetSort("cidade asc")
		dw_1.Sort()
		dw_1.SetRedraw(true)
	elseif ls_Object = "t_uf" Then
		dw_1.SetRedraw(false)
		dw_1.SetSort("uf asc")
		dw_1.Sort()
		dw_1.SetRedraw(true)
	elseif ls_Object = "t_cnpj_cpf" Then
		dw_1.SetRedraw(false)
		dw_1.SetSort("cnpj_cpf asc")
		dw_1.Sort()
		dw_1.SetRedraw(true)

	End If
end event

type gb_1 from groupbox within w_clientes_list
integer x = 23
integer y = 448
integer width = 5531
integer height = 2220
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Resultado"
end type

type rr_1 from roundrectangle within w_clientes_list
long linecolor = 33554432
integer linethickness = 4
long fillcolor = 67108864
integer x = 69
integer y = 84
integer width = 2473
integer height = 300
integer cornerheight = 40
integer cornerwidth = 46
end type

