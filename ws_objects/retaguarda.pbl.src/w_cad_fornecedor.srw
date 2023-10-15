$PBExportHeader$w_cad_fornecedor.srw
forward
global type w_cad_fornecedor from window
end type
type dw_2 from datawindow within w_cad_fornecedor
end type
type dw_1 from datawindow within w_cad_fornecedor
end type
type gb_forn from groupbox within w_cad_fornecedor
end type
end forward

shared variables

end variables

global type w_cad_fornecedor from window
integer width = 3808
integer height = 2592
boolean titlebar = true
string title = "Cadastro de Fornecedores"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
long backcolor = 67108864
string icon = "DosEdit5!"
boolean center = true
event ue_salvar ( )
dw_2 dw_2
dw_1 dw_1
gb_forn gb_forn
end type
global w_cad_fornecedor w_cad_fornecedor

type variables
Boolean m_confirmar, m_incluir, m_excluir, m_gerar, m_fechar, m_imprimir
boolean retorna_cep = false
Boolean tipo_p = False
Boolean tipo_n = False
end variables

event ue_salvar();string valida_cep, valida_cnpj_cpf, tipo_c, valida_nome
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
	
	open(w_response_msg)
	w_response_msg.st_msg.Text = "Fornecedor adicionado a base de dados.."
	sleep(3)
	close(w_response_msg)
		
	dw_1.reset()
	dw_2.reset()
	dw_1.insertrow(0)
	dw_2.insertrow(0)
	m_menu.m_editar.m_confirmar.enabled = False
	m_confirmar = False
Else
	MessageBox("Erro",SQLCA.SQLErrText)
	RollBack;
End If
end event

on w_cad_fornecedor.create
this.dw_2=create dw_2
this.dw_1=create dw_1
this.gb_forn=create gb_forn
this.Control[]={this.dw_2,&
this.dw_1,&
this.gb_forn}
end on

on w_cad_fornecedor.destroy
destroy(this.dw_2)
destroy(this.dw_1)
destroy(this.gb_forn)
end on

event open;dw_1.InsertRow(0)
dw_2.InsertRow(0)

m_fechar = True
m_incluir = False
m_gerar = False
m_confirmar = False
m_excluir = False
m_imprimir = False


end event

event activate;of_menu_activated( m_confirmar, m_incluir, m_excluir, m_gerar, m_imprimir, m_fechar)
end event

event close;of_menu_in_close()
end event

type dw_2 from datawindow within w_cad_fornecedor
integer x = 133
integer y = 532
integer width = 2007
integer height = 372
integer taborder = 20
string dataobject = "d_ddd_ceps"
boolean border = false
boolean livescroll = true
end type

event retrievestart;Open(w_response_cep)
end event

event retrieveend;Close(w_response_cep)
end event

type dw_1 from datawindow within w_cad_fornecedor
integer x = 91
integer y = 212
integer width = 3602
integer height = 1924
integer taborder = 10
string title = "none"
string dataobject = "d_cad_fornecedor"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean border = false
boolean livescroll = true
end type

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
	
			string EmailAddressValidateExpression = "^[a-zA-Z0-9_\.][a-zA-Z0-9_\.]*\@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-][a-zA-Z0-9\.]*[a-zA-Z0-9]$"
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
		end if
		
		if this.GetText() = 'N' then
			dw_1.Modify("cnpj_cpf.EditMask.mask='##.###.###/####-##'")
			dw_1.Modify("cnpj_t.text='Cnpj:'")
			this.object.cnpj_cpf[1] = ""
			this.Object.cnpj_cpf.Background.color = 15780518
			dw_1.SetTabOrder (6, 50)	
			tipo_p = False
			tipo_n = True
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

event itemerror;return 1
end event

event buttonclicked;de_fornecedor = True
open(w_busca_cep)
end event

event editchanged;m_menu.m_editar.m_confirmar.enabled = True
m_confirmar = True
end event

type gb_forn from groupbox within w_cad_fornecedor
integer x = 41
integer y = 84
integer width = 3721
integer height = 2136
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "@Arial Unicode MS"
long backcolor = 67108864
string text = "Cadastro Fornecedor"
end type

