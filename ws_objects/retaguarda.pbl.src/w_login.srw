$PBExportHeader$w_login.srw
forward
global type w_login from window
end type
type dw_1 from datawindow within w_login
end type
type cb_cancelar from commandbutton within w_login
end type
type st_1 from statictext within w_login
end type
type gb_1 from groupbox within w_login
end type
end forward

global type w_login from window
integer width = 1893
integer height = 1112
boolean titlebar = true
string title = "Retaguarda de Loja"
long backcolor = 67108864
string icon = "UserObject5!"
boolean center = true
dw_1 dw_1
cb_cancelar cb_cancelar
st_1 st_1
gb_1 gb_1
end type
global w_login w_login

type variables
Integer tentativa = 0
end variables

on w_login.create
this.dw_1=create dw_1
this.cb_cancelar=create cb_cancelar
this.st_1=create st_1
this.gb_1=create gb_1
this.Control[]={this.dw_1,&
this.cb_cancelar,&
this.st_1,&
this.gb_1}
end on

on w_login.destroy
destroy(this.dw_1)
destroy(this.cb_cancelar)
destroy(this.st_1)
destroy(this.gb_1)
end on

event open;dw_1.insertrow(0)
dw_1.SetFocus()

end event

type dw_1 from datawindow within w_login
integer x = 133
integer y = 372
integer width = 1641
integer height = 444
integer taborder = 20
boolean bringtotop = true
string title = "none"
string dataobject = "d_login"
boolean border = false
boolean livescroll = true
end type

event itemchanged;

Choose case this.GetColumnName()
		
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

					if (this.GetText() = string(codigo_usuario)) then
						Messagebox("Atenção", " Sua senha ainda é a mesma que seu Código de Usuário...~n Por Favor Altere!~n Menu: Usuários -> Alterar Senha.",Exclamation!)
					end if
					
					Open(w_index)
					Close(w_login)	
	
				else
					tentativa = tentativa+1
						if(tentativa = 3) then
							Messagebox("Atenção", "Você tentou acessar o Sistema 3x com senha incorreta. Esgotou o número de tentativas!", StopSign!)
							Close(parent)
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

type cb_cancelar from commandbutton within w_login
integer x = 1472
integer y = 908
integer width = 325
integer height = 84
integer taborder = 40
integer textsize = -9
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&CANCELAR"
boolean cancel = true
end type

event clicked;Close(w_login)
end event

type st_1 from statictext within w_login
integer x = 366
integer y = 92
integer width = 1211
integer height = 96
integer textsize = -11
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "@MS PGothic"
long textcolor = 16711680
long backcolor = 67108864
string text = "ENTRADA RETAGUARDA DE LOJA"
boolean focusrectangle = false
end type

type gb_1 from groupbox within w_login
integer x = 78
integer y = 220
integer width = 1719
integer height = 648
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
long backcolor = 67108864
string text = "Campo de login"
end type

