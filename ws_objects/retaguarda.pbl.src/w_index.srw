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
string title = "Retaguarda de Loja - TCC Engenharia de Software Unicesumar"
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

type variables

end variables

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
of_menu_in_close()

/* menu visivel somente para o desenvolvedor */
If codigo_usuario <> 99999 then m_menu.m_sistema.m_criarmenudb.visible = false

/* se não for admin ou desenvolvedor, leia e aplique as permissões setadas*/
if not (codigo_usuario = 99999 or codigo_usuario = 99)  then 
	
// Menu Permissoes - DataStore
datastore lds_menu
lds_menu = create datastore
lds_menu.dataobject = 'd_usuarios_permissoes'

lds_menu.settransobject(sqlca)
lds_menu.retrieve(codigo_usuario)


//Declarações Colunas nomes
Integer li_col_count, i, valor
long li_totalitem[],li_a,li_b,li_c;
string ls_name, ls_name_nivel2, ls_name_nivel3, ls_name_text;

//1. Dimensão de item em nivel 1
li_totalitem[1] = upperbound (w_index.menuid.item);
	for li_a = 1 to li_totalitem[1]
		ls_name = w_index.menuid.item[li_a].classname() ;
			
		//2. Obtemos a dimensão de item em nivel 2
		li_totalitem[2] = upperbound (w_index.menuid.item[li_a].item);
	
			For 	li_b = 1 to li_totalitem[2]
				ls_name_nivel2 = w_index.menuid.item[li_a].item[li_b].classname();
			
				/* Ignora esses menus - m_editar, m_sistema e as barras de espaço  */
				If not (ls_name = "m_editar" or ls_name = "m_sistema" or ls_name_nivel2 = "m_0" or ls_name_nivel2 =  "m_1") Then
					string db_menu_atual 
					db_menu_atual = ls_name+"_"+ls_name_nivel2
				
					valor 	= lds_menu.getitemnumber(1,db_menu_atual)
				
					if valor = 1 then
						w_index.menuid.item[li_a].item[li_b].visible = true
						//w_index.menuid.item[li_a].item[li_b].enabled = true
					else
						w_index.menuid.item[li_a].item[li_b].visible = false
						//w_index.menuid.item[li_a].item[li_b].enabled = false
					end if
			
				end if
			
			
			 //3. Obtemos a dimensão de item em nivel 3
			li_totalitem[3] = upperbound (w_index.menuid.item[li_a].item[li_b].item);

				For 	li_c = 1 to li_totalitem[3]
					ls_name_nivel3 = w_index.menuid.item[li_a].item[li_b].item[li_c].classname() ;

					integer resultado_nivel3	
					SELECT count(column_name)
						into :resultado_nivel3
					FROM information_schema.columns 
					WHERE table_name=  :ls_name and column_name= :ls_name_nivel3;
			
					If (resultado_nivel3 > 0) Then
						db_menu_atual = ls_name+"_"+ls_name_nivel3
						valor 	= lds_menu.getitemnumber(1,db_menu_atual)

						if valor = 1 then
							w_index.menuid.item[li_a].item[li_b].item[li_c].visible = true
							//w_index.menuid.item[li_a].item[li_b].item[li_c].enabled = true
						else
							w_index.menuid.item[li_a].item[li_b].item[li_c].visible = false
							//w_index.menuid.item[li_a].item[li_b].item[li_c].enabled = false
						end if

					end if					
					

				next; // for li_c
				
			
		next // for li_b
		
	
	next // for li_a


end if // fim - if not (codigo_usuario)
end event

type mdi_1 from mdiclient within w_index
long BackColor=268435456
end type

