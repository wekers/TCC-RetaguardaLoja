$PBExportHeader$w_index.srw
forward
global type w_index from window
end type
type mdi_1 from mdiclient within w_index
end type
end forward

global type w_index from window
integer width = 4754
integer height = 2056
boolean titlebar = true
string title = "Retaguarda de Loja - TCC Unicesumar"
string menuname = "m_menu"
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
windowtype windowtype = mdihelp!
windowstate windowstate = maximized!
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
mdi_1 mdi_1
end type
global w_index w_index

on w_index.create
if this.MenuName = "m_menu" then this.MenuID = create m_menu
this.mdi_1=create mdi_1
this.Control[]={this.mdi_1}
end on

on w_index.destroy
if IsValid(MenuID) then destroy(MenuID)
destroy(this.mdi_1)
end on

event open;w_index.SetMicroHelp("LOGADO: "+string(codigo_usuario)+" - "+nome_usuario)


end event

type mdi_1 from mdiclient within w_index
long BackColor=268435456
end type

