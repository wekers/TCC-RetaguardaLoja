$PBExportHeader$w_troca_senha.srw
forward
global type w_troca_senha from window
end type
type st_4 from statictext within w_troca_senha
end type
type cb_cancelar from commandbutton within w_troca_senha
end type
type cb_ok from commandbutton within w_troca_senha
end type
type sle_confirmar_senha from singlelineedit within w_troca_senha
end type
type sle_nova_senha from singlelineedit within w_troca_senha
end type
type sle_senha_atual from singlelineedit within w_troca_senha
end type
type st_3 from statictext within w_troca_senha
end type
type st_2 from statictext within w_troca_senha
end type
type st_1 from statictext within w_troca_senha
end type
type rr_1 from roundrectangle within w_troca_senha
end type
end forward

global type w_troca_senha from window
integer width = 1454
integer height = 1076
boolean titlebar = true
string title = "Alterar Senha"
boolean controlmenu = true
windowtype windowtype = response!
long backcolor = 67108864
string icon = "UserObject5!"
boolean center = true
st_4 st_4
cb_cancelar cb_cancelar
cb_ok cb_ok
sle_confirmar_senha sle_confirmar_senha
sle_nova_senha sle_nova_senha
sle_senha_atual sle_senha_atual
st_3 st_3
st_2 st_2
st_1 st_1
rr_1 rr_1
end type
global w_troca_senha w_troca_senha

on w_troca_senha.create
this.st_4=create st_4
this.cb_cancelar=create cb_cancelar
this.cb_ok=create cb_ok
this.sle_confirmar_senha=create sle_confirmar_senha
this.sle_nova_senha=create sle_nova_senha
this.sle_senha_atual=create sle_senha_atual
this.st_3=create st_3
this.st_2=create st_2
this.st_1=create st_1
this.rr_1=create rr_1
this.Control[]={this.st_4,&
this.cb_cancelar,&
this.cb_ok,&
this.sle_confirmar_senha,&
this.sle_nova_senha,&
this.sle_senha_atual,&
this.st_3,&
this.st_2,&
this.st_1,&
this.rr_1}
end on

on w_troca_senha.destroy
destroy(this.st_4)
destroy(this.cb_cancelar)
destroy(this.cb_ok)
destroy(this.sle_confirmar_senha)
destroy(this.sle_nova_senha)
destroy(this.sle_senha_atual)
destroy(this.st_3)
destroy(this.st_2)
destroy(this.st_1)
destroy(this.rr_1)
end on

event open;w_index.SetMicroHelp("LOGADO: "+string(codigo_usuario)+" - "+nome_usuario)
end event

type st_4 from statictext within w_troca_senha
integer x = 96
integer y = 40
integer width = 425
integer height = 52
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Troca de senha"
boolean focusrectangle = false
end type

type cb_cancelar from commandbutton within w_troca_senha
integer x = 974
integer y = 812
integer width = 334
integer height = 96
integer taborder = 50
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
end event

type cb_ok from commandbutton within w_troca_senha
integer x = 654
integer y = 812
integer width = 293
integer height = 96
integer taborder = 40
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Tahoma"
string text = "&OK"
boolean default = true
end type

event clicked;String senha_atual, nova_senha, confirmar_senha

senha_atual 			= sle_senha_atual.text
nova_senha 			= sle_nova_senha.text
confirmar_senha 		= sle_confirmar_senha.text

	
			 
			Blob lblb_data
			String ls_Base64Str

			CoderObject lnv_CoderObject
			lnv_CoderObject = Create CoderObject

			ls_Base64Str = lnv_CoderObject.Base64Encode(Blob(senha_atual, EncodingANSI!))
//			lblb_data = lnv_CoderObject.Base64Decode(senha_atual)

			senha_atual = ls_Base64Str

if (nova_senha = "") then
	
	Messagebox("Atenção","A nova senha está em branco")

else


	if (senha_atual = senha_usuario) then
	
		if (nova_senha = confirmar_senha) then
	
			Blob lblb_data_enc
			String ls_Base64Str_enc

			lblb_data_enc = Blob(nova_senha, EncodingANSI!)

			CoderObject lnv_CoderObject_enc
			lnv_CoderObject_enc = Create CoderObject

			ls_Base64Str_enc = lnv_CoderObject_enc.Base64Encode(lblb_data_enc)

	
			UPDATE usuarios 
			SET senha = :ls_Base64Str_enc
			WHERE cod = :codigo_usuario;
		
		
		
				if SQLCA.SQLCode = -1 then
							MessageBox ('Error', SQLCA.SQLErrText)
				else
		
						senha_usuario = nova_senha
						Messagebox("Troca de senha","Sua senha foi alterada!")
						w_index.SetMicroHelp("LOGADO: "+string(codigo_usuario)+" - "+nome_usuario)
						Close(parent)
					
				end if
		
		else
	
			Messagebox("Atenção","A nova senha e confimar senha estão diferentes")
		
		end if
	
	else

		Messagebox("Atenção","Senha atual não confere!")
	
	end if

end if
end event

type sle_confirmar_senha from singlelineedit within w_troca_senha
integer x = 667
integer y = 444
integer width = 402
integer height = 64
integer taborder = 30
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12639424
boolean password = true
textcase textcase = lower!
borderstyle borderstyle = stylelowered!
end type

event modified;if len( this.text ) < 6 then
messagebox('Atenção', 'A senha deve conter no minímo 6 a 8 caracteres' )
SetFocus( This )
end if
end event

type sle_nova_senha from singlelineedit within w_troca_senha
integer x = 667
integer y = 344
integer width = 402
integer height = 64
integer taborder = 20
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12639424
boolean password = true
textcase textcase = lower!
borderstyle borderstyle = stylelowered!
end type

event losefocus;if len( this.text ) < 6 then
messagebox('Atenção', 'A senha deve conter no minímo 6 a 8 caracteres' )
SetFocus( This )
end if
end event

type sle_senha_atual from singlelineedit within w_troca_senha
integer x = 667
integer y = 244
integer width = 402
integer height = 64
integer taborder = 10
integer textsize = -8
integer weight = 400
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "Arial"
long textcolor = 33554432
long backcolor = 12639424
boolean password = true
textcase textcase = lower!
borderstyle borderstyle = stylelowered!
end type

type st_3 from statictext within w_troca_senha
integer x = 187
integer y = 452
integer width = 462
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Confirmar Senha:"
boolean focusrectangle = false
end type

type st_2 from statictext within w_troca_senha
integer x = 192
integer y = 352
integer width = 402
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Nova Senha:"
boolean focusrectangle = false
end type

type st_1 from statictext within w_troca_senha
integer x = 192
integer y = 252
integer width = 402
integer height = 64
integer textsize = -8
integer weight = 700
fontcharset fontcharset = ansi!
fontpitch fontpitch = variable!
fontfamily fontfamily = swiss!
string facename = "MS Sans Serif"
long textcolor = 33554432
long backcolor = 67108864
string text = "Senha Atual:"
boolean focusrectangle = false
end type

type rr_1 from roundrectangle within w_troca_senha
long linecolor = 8421376
integer linethickness = 4
long fillcolor = 67108864
integer x = 46
integer y = 64
integer width = 1280
integer height = 708
integer cornerheight = 40
integer cornerwidth = 46
end type

