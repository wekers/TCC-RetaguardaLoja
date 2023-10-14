$PBExportHeader$w_cad_clientes.srw
forward
global type w_cad_clientes from window
end type
type dw_1 from datawindow within w_cad_clientes
end type
type gb_forn from groupbox within w_cad_clientes
end type
end forward

global type w_cad_clientes from window
integer width = 4238
integer height = 2920
boolean titlebar = true
string title = "Cadastro de Clientes"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
long backcolor = 67108864
string icon = "ServerProfile!"
boolean center = true
event ue_salvar ( )
event ue_excluir ( )
event ue_retrieve_cnpj_cpf ( )
dw_1 dw_1
gb_forn gb_forn
end type
global w_cad_clientes w_cad_clientes

type variables
Boolean m_confirmar, m_incluir, m_excluir, m_gerar, m_fechar, m_imprimir
Boolean tipo_p = False
Boolean tipo_n = False
end variables

event ue_salvar();String valida_cep, valida_tipo_c, valida_endereco_ent_dif, valida_d_cep, valida_d_nome
Integer gravar


valida_tipo_c = dw_1.getitemstring(1,"tipo_c")

 	if isNull(valida_tipo_c) or (valida_tipo_c = "") then
   		      messagebox("Atenção!","É obrigatório preencher o campo 'Tipo'")
               return
     end if


valida_cep = dw_1.getitemstring(1,"cep")

 	if isNull(valida_cep) or (valida_cep = "        ") then
   		      messagebox("Atenção!","É obrigatório preencher o campo CEP")
					dw_1.SetColumn("cep")
               return
     end if
	  
	  

		
		valida_endereco_ent_dif = dw_1.GetItemString(1, "endereco_ent_dif")
		
		if valida_endereco_ent_dif = 'S' then		
			valida_d_nome = dw_1.GetItemString(1, "d_nome")
			valida_d_cep = dw_1.GetItemString(1, "d_cep")
			if isNull(valida_d_nome) or (valida_d_nome = "") then
   			      messagebox("Atenção!","É obrigatório preencher o campo 'Nome' em endereço de entrega diferente")
						dw_1.SetColumn("d_nome")
         	      return
			elseif isNull(valida_d_cep) or (valida_d_cep = "        ") then
   		      messagebox("Atenção!","É obrigatório preencher o campo CEP em endereço de entrega diferente")
					dw_1.SetColumn("d_cep")
               return
		     end if
			
			
		end if
	  
	  
	  

dw_1.settransobject(SQLCA)
gravar = dw_1.Update(True, True)

	If gravar = 1 Then
	
		Commit;
		dw_1.reset()
		dw_1.insertrow(0)
		m_menu.m_editar.m_confirmar.enabled = False
		m_confirmar = False
		tipo_p = False
		tipo_n = False
		
dw_1.Modify("cnpj_cpf.Protect='1'")
dw_1.Modify("ie.Protect='1'")
dw_1.Modify("isuf.Protect='1'")
dw_1.Modify("cep.Protect='1'")
dw_1.Modify("logradouro.Protect='1'")
dw_1.Modify("n_endereco.Protect='1'")
dw_1.Modify("bairro.Protect='1'")
dw_1.Modify("logradouro_cpl.Protect='1'")
dw_1.Modify("cidade.Protect='1'")
dw_1.Modify("uf.Protect='1'")
dw_1.Modify("cmun.Protect='1'")
dw_1.Modify("fone.Protect='1'")
dw_1.Modify("celular.Protect='1'")
dw_1.Modify("apelido_ml.Protect='1'")
dw_1.Modify("email.Protect='1'")
dw_1.Modify("email_alt.Protect='1'")
dw_1.Modify("endereco_ent_dif.Protect='1'")

	
	Else
		
		MessageBox("Erro",SQLCA.SQLErrText)
		RollBack;
	
End If
end event

event ue_excluir();integer id_cliente, existe_venda_cliente, msg_del, gravar_exclusao
id_cliente =	dw_1.GetItemNumber(1,"id")
Select count()
Into :existe_venda_cliente
From movimento_saida
Where id_cliente = :id_cliente;



If (existe_venda_cliente > 0) then
	Messagebox("Atenção", "Não é possível excluir Cliente: " + "[ " +String(dw_1.GetItemString(1,"nome")) +" ]" &
	+" - Existem dados (vendas) vinculados!", StopSign!)
else
	

msg_del = MessageBox("Atenção", & 
					"Deseja Realmente Excluir Cliente: " + "[" +String(dw_1.GetItemString(1,"nome")) +"] ?", &
		    		 Exclamation!,YesNo!,1)


	IF msg_del = 1 Then
		dw_1.settransobject(SQLCA)
		dw_1.DeleteRow(dw_1.GetRow())
		gravar_exclusao = dw_1.Update(true,true)
		
		if gravar_exclusao = 1 Then
				Commit;
				
				dw_1.reset()
				dw_1.insertrow(0)
				m_menu.m_editar.m_confirmar.enabled = False
				m_confirmar = False
				m_menu.m_editar.m_excluir.enabled = False
				m_excluir = False	
	
				tipo_p = False
				tipo_n = False
		
				dw_1.Modify("cnpj_cpf.Protect='1'")
				dw_1.Modify("ie.Protect='1'")
				dw_1.Modify("isuf.Protect='1'")
				dw_1.Modify("cep.Protect='1'")
				dw_1.Modify("logradouro.Protect='1'")
				dw_1.Modify("n_endereco.Protect='1'")
				dw_1.Modify("bairro.Protect='1'")
				dw_1.Modify("logradouro_cpl.Protect='1'")
				dw_1.Modify("cidade.Protect='1'")
				dw_1.Modify("uf.Protect='1'")
				dw_1.Modify("cmun.Protect='1'")
				dw_1.Modify("fone.Protect='1'")
				dw_1.Modify("celular.Protect='1'")
				dw_1.Modify("apelido_ml.Protect='1'")
				dw_1.Modify("email.Protect='1'")
				dw_1.Modify("email_alt.Protect='1'")
				dw_1.Modify("endereco_ent_dif.Protect='1'")
		Else
				MessageBox("Erro ao gravar IPI",SQLCA.SQLErrText)
				RollBack;
		End If
		
		
	end if
	
end if


end event

event ue_retrieve_cnpj_cpf();string settings
settings = dw_1.Describe("cnpj_cpf.Protect")

	if settings = "1" then
			dw_1.Modify("cnpj_cpf.Protect='0'")
			dw_1.Modify("ie.Protect='0'")
			dw_1.Modify("isuf.Protect='0'")
			dw_1.Modify("cep.Protect='0'")
			dw_1.Modify("logradouro.Protect='0'")
			dw_1.Modify("n_endereco.Protect='0'")
			dw_1.Modify("bairro.Protect='0'")
			dw_1.Modify("logradouro_cpl.Protect='0'")
			dw_1.Modify("cidade.Protect='0'")
			dw_1.Modify("uf.Protect='0'")
			dw_1.Modify("cmun.Protect='0'")
			dw_1.Modify("fone.Protect='0'")
			dw_1.Modify("celular.Protect='0'")
			dw_1.Modify("apelido_ml.Protect='0'")
			dw_1.Modify("email.Protect='0'")
			dw_1.Modify("email_alt.Protect='0'")
			dw_1.Modify("endereco_ent_dif.Protect='0'")
	end if
	
	String tipo_c
	tipo_c = dw_1.GetItemString(1,"tipo_c")
	
	if tipo_c = 'P' then
			dw_1.Modify("cnpj_cpf.EditMask.mask='###.###.###-##'")
			dw_1.Modify("t_cnpj_cpf.text='CPF:'")
//			dw_1.object.cnpj_cpf[1] = ""
			dw_1.Object.ie.Background.color = "8421504" 
			dw_1.Object.isuf.Background.color = "8421504"
			dw_1.SetTabOrder ("ie", 0)	
			dw_1.SetTabOrder ("isuf", 0)	

//			tipo_n = False
	//		tipo_p = True
		end if
		
		if tipo_c = 'N' then
			dw_1.Modify("cnpj_cpf.EditMask.mask='##.###.###/####-##'")
			dw_1.Modify("t_cnpj_cpf.text='CNPJ:'")
	//		dw_1.object.cnpj_cpf[1] = ""
			dw_1.Object.ie.Background.color = 15780518
			dw_1.Object.isuf.Background.color = 15780518
			dw_1.SetTabOrder ("ie", 40)	
			dw_1.SetTabOrder ("isuf", 50)	
//			tipo_p = False
	//		tipo_n = True
		end if	
		
		String tipo_endereco_ent_dif
		
		tipo_endereco_ent_dif = dw_1.GetItemString(1, "endereco_ent_dif")
		
		if tipo_endereco_ent_dif = 'S' then		
			gb_forn.height= 2704
			dw_1.height = 2500
		else
			dw_1.height = 1750
			gb_forn.height= 1948

		end if		
		
end event

on w_cad_clientes.create
this.dw_1=create dw_1
this.gb_forn=create gb_forn
this.Control[]={this.dw_1,&
this.gb_forn}
end on

on w_cad_clientes.destroy
destroy(this.dw_1)
destroy(this.gb_forn)
end on

event activate;of_menu_activated( m_confirmar, m_incluir, m_excluir, m_gerar, m_imprimir, m_fechar)
end event

event close;of_menu_in_close()
end event

event open;dw_1.InsertRow(0)
//m_menu.m_editar.m_fechar.enabled = true
m_fechar = True
//m_menu.m_editar.m_incluir.enabled = false
m_incluir = False
//m_menu.m_editar.m_gerar.enabled = false
m_gerar = False
//m_menu.m_editar.m_confirmar.enabled = false
m_confirmar = False
//m_menu.m_editar.m_excluir.enabled = false
m_excluir = False
m_imprimir = False

dw_1.settransobject(SQLCA)

dw_1.object.endereco_ent_dif[1] = "N"

dw_1.Modify("cnpj_cpf.Protect='1'")
dw_1.Modify("ie.Protect='1'")
dw_1.Modify("isuf.Protect='1'")
dw_1.Modify("cep.Protect='1'")
dw_1.Modify("logradouro.Protect='1'")
dw_1.Modify("n_endereco.Protect='1'")
dw_1.Modify("bairro.Protect='1'")
dw_1.Modify("logradouro_cpl.Protect='1'")
dw_1.Modify("cidade.Protect='1'")
dw_1.Modify("uf.Protect='1'")
dw_1.Modify("cmun.Protect='1'")
dw_1.Modify("fone.Protect='1'")
dw_1.Modify("celular.Protect='1'")
dw_1.Modify("apelido_ml.Protect='1'")
dw_1.Modify("email.Protect='1'")
dw_1.Modify("email_alt.Protect='1'")
dw_1.Modify("endereco_ent_dif.Protect='1'")




/*dw_1.object.rr_end_diferente.visible = 0
dw_1.object.rr_d_cep.visible = 0

dw_1.object.t_d_nome.visible = 0
dw_1.object.d_nome.visible = 0
dw_1.object.t_d_cep.visible = 0
dw_1.object.d_cep.visible = 0
dw_1.object.t_d_logradouro.visible = 0
dw_1.object.d_logradouro.visible = 0
dw_1.object.t_d_n_endereco.visible = 0
dw_1.object.d_n_endereco.visible = 0
dw_1.object.t_d_bairro.visible = 0
dw_1.object.d_bairro.visible = 0
dw_1.object.t_d_logradouro_cpl.visible = 0
dw_1.object.d_logradouro_cpl.visible = 0
dw_1.object.t_d_cidade.visible = 0
dw_1.object.d_cidade.visible = 0
dw_1.object.t_d_uf.visible = 0
dw_1.object.d_uf.visible = 0*/

dw_1.height = 1750
gb_forn.height= 1948








end event

type dw_1 from datawindow within w_cad_clientes
integer x = 91
integer y = 212
integer width = 3803
integer height = 2500
integer taborder = 10
string title = "none"
string dataobject = "d_cad_clientes"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event buttonclicked;String            ls_Object
ls_Object = String(dwo.name)


	If ls_Object = "b_1" Then

		de_clientes = True
		open(w_busca_cep)

	elseif ls_Object = "b_2" Then
		open(w_clientes_list)
	
		

End If
end event

event itemchanged;String id_cep, id_d_cep



choose case this.GetColumnName()
		
		case 'cep'
		
			if IsNumber (this.GetText()) then
			
				Open(w_response_cep)
			
				id_cep = String (this.GetText())
			
				string bairro, logradouro, cidade, uf, cmun	
	
				SELECT	"bairro"."bairro_nome",   
					         "endereco"."endereco_nome",   
         					"cidade"."cidade_nome",   
         					"estado"."id_uf"  ,
							"cidade"."codigo_municipio"
				
				INTO :bairro, :logradouro, : cidade, :uf, :cmun
			
				FROM "bairro",   
				         "cidade",   
				         "endereco",   
				         "estado"  
			
				WHERE 	( "bairro"."id_cidade" = "cidade"."id_cidade" ) and  
					         ( "endereco"."id_bairro" = "bairro"."id_bairro" ) and  
					         ( "cidade"."id_uf" = "estado"."id_uf" ) and  
					         ( ( "endereco"."cep" = :id_cep ) )    ;
			
				Close(w_response_cep)

				
					If sqlca.sqlcode = 100 Then
						MessageBox ("Atenção!", "CEP não encontrado!", Information!) 
						return 0

					else


						this.object.logradouro[1] 	= logradouro
						this.object.bairro[1] 			= bairro
						this.object.cidade[1]			= cidade
						this.object.uf[1]				= uf
						this.object.cmun[1]			= cmun
						
						this.SetColumn(7)
						return 1
					end if
			
			
		end if
		
		
		case 'tipo_c'
			
			m_menu.m_editar.m_confirmar.enabled = True
			m_confirmar = True
			
		if (tipo_n = false and tipo_p = false) then //desprotege colunas apenas uma vez
			dw_1.Modify("cnpj_cpf.Protect='0'")
			dw_1.Modify("ie.Protect='0'")
			dw_1.Modify("isuf.Protect='0'")
			dw_1.Modify("cep.Protect='0'")
			dw_1.Modify("logradouro.Protect='0'")
			dw_1.Modify("n_endereco.Protect='0'")
			dw_1.Modify("bairro.Protect='0'")
			dw_1.Modify("logradouro_cpl.Protect='0'")
			dw_1.Modify("cidade.Protect='0'")
			dw_1.Modify("uf.Protect='0'")
			dw_1.Modify("cmun.Protect='0'")
			dw_1.Modify("fone.Protect='0'")
			dw_1.Modify("celular.Protect='0'")
			dw_1.Modify("apelido_ml.Protect='0'")
			dw_1.Modify("email.Protect='0'")
			dw_1.Modify("email_alt.Protect='0'")
			dw_1.Modify("endereco_ent_dif.Protect='0'")
		end if
		
		if this.GetText() = 'P' then
			dw_1.Modify("cnpj_cpf.EditMask.mask='###.###.###-##'")
			dw_1.Modify("t_cnpj_cpf.text='CPF:'")
			this.object.cnpj_cpf[1] = ""
			this.object.ie[1] = ""
			this.object.isuf[1] = ""
			this.Object.ie.Background.color = "8421504" 
			this.Object.isuf.Background.color = "8421504"
			dw_1.SetTabOrder ("ie", 0)	
			dw_1.SetTabOrder ("isuf", 0)	

			tipo_n = False
			tipo_p = True
		end if
		
		if this.GetText() = 'N' then
			dw_1.Modify("cnpj_cpf.EditMask.mask='##.###.###/####-##'")
			dw_1.Modify("t_cnpj_cpf.text='CNPJ:'")
			this.object.cnpj_cpf[1] = ""
			this.Object.ie.Background.color = 15780518
			this.Object.isuf.Background.color = 15780518
			dw_1.SetTabOrder ("ie", 40)	
			dw_1.SetTabOrder ("isuf", 50)	
			tipo_p = False
			tipo_n = True
		end if	
		
		
			
			
		case 'cnpj_cpf'
			
			Integer id
			String check_cnpj_cpf
			check_cnpj_cpf = This.GetText()
		
		select id, cnpj_cpf
		into :id, :check_cnpj_cpf
		from clientes 
		where cnpj_cpf = :check_cnpj_cpf;

			if SQLCA.SQLCode = 0 then
				if tipo_p then
					integer msgbox
					msgbox = Messagebox("Atenção","Já possui no Sistema um Cadastro com o 'CPF' informado! Deseja Recuperar os dados deste CPF?" ,Exclamation!,YesNo!,1)
						if msgbox = 1 then
							dw_1.Reset()
							dw_1.Retrieve(id)
							w_cad_clientes.TriggerEvent("ue_retrieve_cnpj_cpf")
							return 1
						elseif msgbox = 2 then 
							Messagebox("Opção não recuperar","Insira um CPF diferente")
							return 1
						end if
				elseif tipo_n then
					msgbox = Messagebox("Atenção","Já possui no Sistema um Cadastro com o 'CNPJ' informado! Deseja Recuperar os dados deste CNPJ?",Exclamation!,YesNo!,1)
						if msgbox = 1 then
							dw_1.Reset()
							dw_1.Retrieve(id)
							w_cad_clientes.TriggerEvent("ue_retrieve_cnpj_cpf")
							return 1
						elseif msgbox = 2 then 
							Messagebox("Opção não recuperar","Insira um CNPJ diferente")
							return 1
						end if
				end if
			End if	
			
			
			
			
		if tipo_p and Len(Trim(this.GetText())) <> 0 then
			
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
				return 1
			end if
			
		end if
	

	if tipo_n and Len(Trim(this.GetText())) <> 0 then

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
				Return 1
			end if

		end if
		
		

		case 'email'
	
				string EmailAddressValidateExpression = "^[a-zA-Z0-9_\.-][a-zA-Z0-9_\.-]*\@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-][a-zA-Z0-9\.]*[a-zA-Z0-9]$"
				string    as_emailaddress
				as_emailaddress =  String (this.GetText())

					if not match(as_emailaddress, EmailAddressValidateExpression) and not (as_emailaddress = "") then
   							MessageBox("Atenção!", "Endereço de e-mail invalido. Digite o endereço corretamente!")
						    Return 1
					end if
		
		case 'email_alt'
	
				string EmailAddressValidateExpression_alt = "^[a-zA-Z0-9_\.-][a-zA-Z0-9_\.-]*\@[a-zA-Z0-9\-]+\.[a-zA-Z0-9\-][a-zA-Z0-9\.]*[a-zA-Z0-9]$"
				string    as_emailaddress_alt
				as_emailaddress_alt =  String (this.GetText())

					if not match(as_emailaddress_alt, EmailAddressValidateExpression_alt) and not (as_emailaddress = "") then
   							MessageBox("Atenção!", "Endereço de e-mail invalido. Digite o endereço corretamente!")
						    Return 1
					end if
					
		case 'endereco_ent_dif' 		
			
			if this.GetText() = 'S' then
				
				//dw_1.object.rr_end_diferente_s.brushcolor = 12639424
				
			/*	dw_1.object.rr_end_diferente.visible = 1
				dw_1.object.rr_d_cep.visible = 1

				dw_1.object.t_d_nome.visible = 1
				dw_1.object.d_nome.visible = 1
				dw_1.object.t_d_cep.visible = 1
				dw_1.object.d_cep.visible = 1
				dw_1.object.t_d_logradouro.visible = 1
				dw_1.object.d_logradouro.visible = 1
				dw_1.object.t_d_n_endereco.visible = 1
				dw_1.object.d_n_endereco.visible = 1
				dw_1.object.t_d_bairro.visible = 1
				dw_1.object.d_bairro.visible = 1
				dw_1.object.t_d_logradouro_cpl.visible = 1
				dw_1.object.d_logradouro_cpl.visible = 1
				dw_1.object.t_d_cidade.visible = 1
				dw_1.object.d_cidade.visible = 1
				dw_1.object.t_d_uf.visible = 1
				dw_1.object.d_uf.visible = 1*/

				gb_forn.height= 2704
				dw_1.height = 2500
				


				
			elseif this.GetText() = 'N' then
				
				String nulo
				setnull(nulo)
				
				dw_1.height = 1750
				gb_forn.height= 1948
				
				dw_1.object.d_nome[1] = nulo
				dw_1.object.d_cep[1] = nulo
				dw_1.object.d_logradouro[1] = nulo
				dw_1.object.d_n_endereco[1] = nulo
				dw_1.object.d_bairro[1] = nulo
				dw_1.object.d_logradouro_cpl[1] = nulo
				dw_1.object.d_cidade[1] = nulo
				dw_1.object.d_uf[1] = nulo
							
			end if
			
			
		case 'd_cep'
		
			if IsNumber (this.GetText()) then
			
				Open(w_response_cep)
			
				id_d_cep = String (this.GetText())
			
				string d_bairro, d_logradouro, d_cidade, d_uf	
	
				SELECT	"bairro"."bairro_nome",   
					         "endereco"."endereco_nome",   
         					"cidade"."cidade_nome",   
         					"estado"."id_uf" 
				
				INTO :d_bairro, :d_logradouro, :d_cidade, :d_uf
			
				FROM "bairro",   
				         "cidade",   
				         "endereco",   
				         "estado"  
			
				WHERE 	( "bairro"."id_cidade" = "cidade"."id_cidade" ) and  
					         ( "endereco"."id_bairro" = "bairro"."id_bairro" ) and  
					         ( "cidade"."id_uf" = "estado"."id_uf" ) and  
					         ( ( "endereco"."cep" = :id_d_cep ) )    ;
			
				Close(w_response_cep)

				
					If sqlca.sqlcode = 100 Then
						MessageBox ("Atenção!", "CEP não encontrado!", Information!) 
						return 0

					else


						this.object.d_logradouro[1] 		= d_logradouro
						this.object.d_bairro[1] 			= d_bairro
						this.object.d_cidade[1]			= d_cidade
						this.object.d_uf[1]					= d_uf
						
						this.SetColumn("d_n_endereco")
						return 1
					end if
			
			
		end if			
			
			
		
end choose
end event

event itemerror;return 1
end event

event editchanged;m_menu.m_editar.m_confirmar.enabled = True
m_confirmar = True
end event

event retrieveend;m_menu.m_editar.m_excluir.enabled = True
m_excluir = True
end event

type gb_forn from groupbox within w_cad_clientes
integer x = 41
integer y = 84
integer width = 3867
integer height = 2704
integer taborder = 20
integer textsize = -10
integer weight = 400
fontcharset fontcharset = hangeul!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "@Arial Unicode MS"
long backcolor = 67108864
string text = "Cadastro de Clientes"
end type

