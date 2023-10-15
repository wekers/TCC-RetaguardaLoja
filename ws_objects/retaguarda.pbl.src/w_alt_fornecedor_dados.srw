$PBExportHeader$w_alt_fornecedor_dados.srw
forward
global type w_alt_fornecedor_dados from window
end type
type cb_fechar from commandbutton within w_alt_fornecedor_dados
end type
type cb_salvar from commandbutton within w_alt_fornecedor_dados
end type
type dw_2 from datawindow within w_alt_fornecedor_dados
end type
type dw_1 from datawindow within w_alt_fornecedor_dados
end type
type gb_1 from groupbox within w_alt_fornecedor_dados
end type
end forward

global type w_alt_fornecedor_dados from window
integer width = 3470
integer height = 2000
boolean titlebar = true
string title = "Alterar Dados de Fornecedor"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
cb_fechar cb_fechar
cb_salvar cb_salvar
dw_2 dw_2
dw_1 dw_1
gb_1 gb_1
end type
global w_alt_fornecedor_dados w_alt_fornecedor_dados

type variables
Boolean auto_retrieve 
Boolean tipo_p = False
Boolean tipo_n = False
end variables

on w_alt_fornecedor_dados.create
this.cb_fechar=create cb_fechar
this.cb_salvar=create cb_salvar
this.dw_2=create dw_2
this.dw_1=create dw_1
this.gb_1=create gb_1
this.Control[]={this.cb_fechar,&
this.cb_salvar,&
this.dw_2,&
this.dw_1,&
this.gb_1}
end on

on w_alt_fornecedor_dados.destroy
destroy(this.cb_fechar)
destroy(this.cb_salvar)
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event open;Long ll_rows, ll, id
String id_cep

ll = w_alt_fornecedor.dw_1.GetRow()
id =	w_alt_fornecedor.dw_1.GetItemNumber(ll,"id")

dw_1.settransobject(SQLCA)
dw_1.retrieve(id)

id_cep =	String(dw_1.GetItemString(1,"cep"))

dw_2.settransobject(SQLCA)
dw_2.Retrieve(id_cep)


if SQLCA.SQLCode = -1 then
	
	MessageBox ('Error', SQLCA.SQLErrText)
	
end if

dw_1.Object.cnpj_cpf.Background.color = 15780518
String tipo

tipo = dw_1.getitemString(1,"tipo_c")

	if (tipo = "N") then
		dw_1.Modify("cnpj_cpf.EditMask.mask='##.###.###/####-##'")
		dw_1.Modify("cnpj_t.text='Cnpj:'")
		dw_1.SetTabOrder (6, 50)	
	elseif (tipo = "P") then
		dw_1.Modify("cnpj_cpf.EditMask.mask='###.###.###-##'")
		dw_1.Modify("cnpj_t.text='Cpf:'")
		dw_1.SetTabOrder (6, 50)	
	end if



end event

event close;if auto_retrieve then
w_alt_fornecedor.dw_1.settransobject(SQLCA)
w_alt_fornecedor.dw_1.retrieve()
end if

end event

type cb_fechar from commandbutton within w_alt_fornecedor_dados
integer x = 2962
integer y = 1736
integer width = 370
integer height = 96
integer taborder = 40
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&Fechar"
boolean cancel = true
end type

event clicked;Close(w_alt_fornecedor_dados)
end event

type cb_salvar from commandbutton within w_alt_fornecedor_dados
integer x = 2510
integer y = 1736
integer width = 370
integer height = 96
integer taborder = 30
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
boolean enabled = false
string text = "&Salvar"
end type

event clicked;string valida_cep, valida_cnpj_cpf, tipo_c, valida_nome
integer gravar

valida_cep = dw_1.getitemstring(1,"cep")

 	if isNull(valida_cep) or (valida_cep = "        ") then
   		      messagebox("Atenção!","É obrigatório preencher o campo CEP")
               return
     end if
	  
valida_nome = dw_1.getitemstring(1,"nome")

	if  isNull(valida_nome) or valida_nome = "" then
   		      messagebox("Atenção!","É obrigatório preencher o campo Nome")
               return 
     end if

dw_1.settransobject(SQLCA)
gravar = dw_1.Update(True, True)
If gravar = 1 Then
	Commit;
	this.enabled = False
	auto_retrieve = true
Else
	MessageBox("Erro",SQLCA.SQLErrText)
	RollBack;
End If
end event

type dw_2 from datawindow within w_alt_fornecedor_dados
integer x = 155
integer y = 532
integer width = 2002
integer height = 372
integer taborder = 20
string title = "none"
string dataobject = "w_ddd_ceps"
boolean border = false
boolean livescroll = true
end type

event retrievestart;Open(w_response_fornecedor)
end event

event retrieveend;Close(w_response_fornecedor)
end event

type dw_1 from datawindow within w_alt_fornecedor_dados
integer x = 114
integer y = 212
integer width = 3205
integer height = 1376
integer taborder = 10
string title = "none"
string dataobject = "w_cad_fornecedor"
boolean border = false
boolean livescroll = true
end type

event editchanged;cb_salvar.enabled = True
end event

event itemchanged;String id_cep
long ll_rows


choose case this.GetColumnName()
		
		case 'cep'
		
		if IsNumber (this.GetText()) then
			
			id_cep = String (this.GetText())
			dw_2.settransobject(SQLCA)
			ll_rows = dw_2.Retrieve(id_cep)
						
				if ll_rows = 0  Then
					MessageBox ("Atenção!", "CEP não localizado ou inválido. Por favor insira um CEP válido", Information!) 
					dw_2.insertrow(0)
					return 1
				end if

				if SQLCA.SQLCode = -1 then
					MessageBox ('Error', SQLCA.SQLErrText)
				end if
			
		end if
		

		case 'email'
	
			string EmailAddressValidateExpression = "^[a-zA-Z0-9-_\.][a-zA-Z0-9-_\.]*\@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-][a-zA-Z0-9\.]*[a-zA-Z0-9]$"
			string    as_emailaddress
			as_emailaddress =  String (this.GetText())

				if not match(as_emailaddress, EmailAddressValidateExpression) then
   						MessageBox("Atenção!", "Endereço de e-mail invalido. Digite o endereço corretamente!")
					    Return 2
				end if
			
		case 'tipo_c'
		
		if this.GetText() = 'P' then
			dw_1.Modify("cnpj_cpf.EditMask.mask='###.###.###-##'")
			dw_1.Modify("cnpj_t.text='Cpf:'")
			this.object.cnpj_cpf[1] = ""
			this.Object.cnpj_cpf.Background.color = 15780518
			dw_1.SetTabOrder (6, 50)	
			tipo_n = False
			tipo_p = True
			cb_salvar.enabled = True
		end if
		
		if this.GetText() = 'N' then
			dw_1.Modify("cnpj_cpf.EditMask.mask='##.###.###/####-##'")
			dw_1.Modify("cnpj_t.text='Cnpj:'")
			this.object.cnpj_cpf[1] = ""
			this.Object.cnpj_cpf.Background.color = 15780518
			dw_1.SetTabOrder (6, 50)	
			tipo_p = False
			tipo_n = True
			cb_salvar.enabled = True
		end if	
			
			
		case 'cnpj_cpf'
			
				if tipo_p then
		string ls_dig, ls_CPF, ls_digitos, cnpj_cpf
		integer li_loop, li_digito1, li_digito2, li_controle1, li_controle2, li_resto

		cnpj_cpf = this.GetText()
		li_controle1 = 10
		li_controle2 = 11
		ls_dig = Right( Left( cnpj_cpf + SPACE(11), 11 ), 2 )
		ls_CPF = Left( cnpj_cpf + SPACE(09), 09 )
		li_digito1 = 0
		For li_loop = 1 to 9
		li_digito1 += ( Long( Mid( ls_CPF, li_loop, 1 ) ) * li_controle1 )
		li_controle1 --
		
	Next

	li_resto = Mod(li_digito1, 11)
		If 	li_resto = 0 Or li_resto = 1 Then
   			li_digito1 = 0
		Else
			li_digito1 = 11 - li_resto
		End if
		
	li_digito2 = 0
	
		For li_loop = 1 to 9
			
			li_digito2 += ( Long( Mid( ls_CPF, li_loop, 1 ) ) * li_controle2 )
			li_controle2 --
			
		Next
		
		li_digito2 += (2 * li_digito1)
		li_resto = Mod(li_digito2, 11)
		
			If li_resto = 0 Or li_resto = 1 Then
				li_digito2 = 0
			Else
				li_digito2 = 11 - li_resto
			End if
			
			if string(li_digito1) + string(li_digito2) <> ls_dig then
				MessageBox ("Atenção!", "CPF Invalido, Insira um CPF Válido", Information!) 
				return 2
			end if
			
		end if
	

	if tipo_n then

		string ls_dig_c, ls_CGC, ls_digito1_c, ls_digito2_c, cnpj_cpf_c
		integer li_loop_c, li_digito1_c, li_digito2_c
		
		cnpj_cpf_c = this.GetText()		

		ls_dig_c = Right( Left( cnpj_cpf_c + SPACE(14), 14 ), 2 )
		ls_CGC = Left( cnpj_cpf_c + SPACE(12), 12 )

		li_digito1_c = 0
		
		For li_loop_c = 1 to 4
		li_digito1_c += ( Long( Mid( ls_CGC, li_loop_c, 1 ) ) * ( 6 - li_loop_c ) )
		Next

		For li_loop_c = 5 to 12
		li_digito1_c += ( Long( Mid( ls_CGC, li_loop_c, 1 ) ) * ( 14 - li_loop_c ) )
		Next

		ls_digito1_c = Right( String( Mod( li_digito1_c * 10, 11 ) ), 1 )
		ls_CGC += ls_digito1_c
		li_digito2_c = 0
		
		For li_loop_c = 1 to 5
		li_digito2_c += ( Long( Mid( ls_CGC, li_loop_c, 1 ) ) * ( 7 - li_loop_c ) )
		Next

		For li_loop_c = 6 to 13
		li_digito2_c += ( Long( Mid( ls_CGC, li_loop_c, 1 ) ) * ( 15 - li_loop_c ) )
		Next

		ls_digito2_c = Right( String( Mod( li_digito2_c * 10, 11) ), 1 )

			if ls_digito1_c + ls_digito2_c <> ls_dig_c then
				MessageBox ("Atenção!", "CNPJ Invalido, Insira um CNPJ Válido", Information!) 
				Return 2
			end if

		end if
				
end choose
end event

event buttonclicked;de_alt_fornecedor = True
open(w_busca_cep)

end event

event itemerror;return 1
end event

type gb_1 from groupbox within w_alt_fornecedor_dados
integer x = 64
integer y = 84
integer width = 3314
integer height = 1608
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Dados Fornecedor"
end type

