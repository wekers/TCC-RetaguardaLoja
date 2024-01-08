$PBExportHeader$w_logoff.srw
forward
global type w_logoff from window
end type
type cb_cancelar from commandbutton within w_logoff
end type
type dw_1 from datawindow within w_logoff
end type
type gb_1 from groupbox within w_logoff
end type
end forward

global type w_logoff from window
integer width = 2039
integer height = 1036
boolean titlebar = true
string title = "Efetuar troca de usuário"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "UserObject5!"
boolean center = true
cb_cancelar cb_cancelar
dw_1 dw_1
gb_1 gb_1
end type
global w_logoff w_logoff

type variables
Integer tentativa = 0
end variables

on w_logoff.create
this.cb_cancelar=create cb_cancelar
this.dw_1=create dw_1
this.gb_1=create gb_1
this.Control[]={this.cb_cancelar,&
this.dw_1,&
this.gb_1}
end on

on w_logoff.destroy
destroy(this.cb_cancelar)
destroy(this.dw_1)
destroy(this.gb_1)
end on

event open;dw_1.insertrow(0)
dw_1.SetFocus()
w_index.SetMicroHelp("LOGADO: "+string(codigo_usuario)+" - "+nome_usuario)


end event

type cb_cancelar from commandbutton within w_logoff
integer x = 1605
integer y = 800
integer width = 329
integer height = 88
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&CANCELAR"
boolean cancel = true
end type

event clicked;Close(parent)
Close(w_index)
end event

type dw_1 from datawindow within w_logoff
integer x = 174
integer y = 316
integer width = 1728
integer height = 384
integer taborder = 20
string title = "none"
string dataobject = "d_login"
boolean border = false
boolean livescroll = true
borderstyle borderstyle = stylelowered!
end type

event itemchanged;Choose case this.GetColumnName()
		
		Case 'cod'
			
			if IsNumber (this.GetText()) then
			
				codigo_usuario = long(this.GetText())
				select nome, senha
				into :nome_usuario, :senha_usuario
				from usuarios
				where cod = :codigo_usuario;
				
					if SQLCA.SQLCode = 100 then 
						MessageBox ("Atenção!", "Código de usuário inválido ou inexistente!", Information!) 
						return 1
					end if
				
				this.object.nome[1] = nome_usuario
				
			end if
			
			
				
		Case 'senha'
			
			String senha_usuario_check
			senha_usuario_check = this.GetText()
 
			Blob lblb_data
			String ls_Base64Str

			CoderObject lnv_CoderObject
			lnv_CoderObject = Create CoderObject

			ls_Base64Str = lnv_CoderObject.Base64Encode(Blob(senha_usuario_check, EncodingANSI!))
			lblb_data = lnv_CoderObject.Base64Decode(ls_Base64Str)
			senha_usuario_check = string(ls_Base64Str)
			
			
 

				if (senha_usuario_check = senha_usuario) then
					
					tentativa = 0
					codigo_usuario 	= codigo_usuario
					nome_usuario 	= nome_usuario
					senha_usuario 	= senha_usuario
					w_index.TriggerEvent("open")
					Close(parent)	
					

	
				else
					tentativa = tentativa+1
						if(tentativa = 3) then
							Messagebox("Atenção", "Você tentou acessar o Sistema 3x com senha incorreta. Esgotou o número de tentativas!", StopSign!)
							cb_cancelar.TriggerEvent("clicked")
						else
							messagebox("Atenção","A senha do usuário não confere. Por Favor, Digite sua senha novamente!", Information!)
							this.object.senha[1] = ""
							return 1
						end if
		
				end if

			
			
End Choose
end event

event itemerror;return 1
end event

type gb_1 from groupbox within w_logoff
integer x = 64
integer y = 116
integer width = 1888
integer height = 648
integer taborder = 10
integer textsize = -10
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long textcolor = 33554432
long backcolor = 67108864
string text = "Logoff de Usuário"
end type

