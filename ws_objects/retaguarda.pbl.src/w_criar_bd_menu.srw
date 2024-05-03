$PBExportHeader$w_criar_bd_menu.srw
forward
global type w_criar_bd_menu from window
end type
end forward

global type w_criar_bd_menu from window
integer width = 4754
integer height = 1980
boolean titlebar = true
boolean controlmenu = true
boolean minbox = true
boolean maxbox = true
boolean resizable = true
long backcolor = 67108864
string icon = "AppIcon!"
boolean center = true
end type
global w_criar_bd_menu w_criar_bd_menu

on w_criar_bd_menu.create
end on

on w_criar_bd_menu.destroy
end on

event open;// Criar Menu DataBase

// variaveis
long li_totalitem[],li_a,li_b,li_c;
string ls_name, ls_name_nivel2, ls_name_nivel3, ls_name_text;

messagebox("Menus","Criando banco de dados de menus")

//dimensão de item em nivel 1
li_totalitem[1] = upperbound (w_index.menuid.item);
	for li_a = 1 to li_totalitem[1]
		ls_name = w_index.menuid.item[li_a].classname() ;
			
		integer resultado

		//Sybase SQL
		/*
		SELECT count() 
		Into :resultado
		FROM sysobjects 
		Where name = :ls_name;
		*/

		//PostgreSQL
		SELECT count(tablename) into :resultado FROM pg_tables WHERE tablename = :ls_name;


		If (resultado > 0 or ls_name = "m_editar" or ls_name = "m_sistema") Then
			//messagebox("O menu: ",ls_name +" já está no bd")
		else
			messagebox("O menu de nível1: ",ls_name +" vai ser adicionado ao bd")

			// Criando a tabela em nivel 1
			string SQL_NIVEL1
 			SQL_NIVEL1 = "CREATE TABLE "+ls_name &
   				    				+ "( "&
								+ "cod integer NOT NULL, " &
								+ "PRIMARY KEY( cod ),"	&
								+ "FOREIGN KEY (cod) REFERENCES usuarios (cod) " &
								+ ")"
	 		EXECUTE IMMEDIATE :SQL_NIVEL1 ;	
			 
	 	End If
	
		//obtemos a dimensão de item em nivel 2
		li_totalitem[2] = upperbound (w_index.menuid.item[li_a].item);
	

			For 	li_b = 1 to li_totalitem[2]
				ls_name_nivel2 = w_index.menuid.item[li_a].item[li_b].classname();

				//Sybase
				/*
				integer resultado_nivel2	
				select count()
				Into :resultado_nivel2
				from syscolumn join systable on systable.table_id = syscolumn.table_id where table_name = :ls_name and column_name = :ls_name_nivel2;
				*/		
				
				//PostgreSQL
				integer resultado_nivel2

				SELECT count(column_name) 
					 into :resultado_nivel2
				FROM information_schema.columns 
				WHERE table_name=  :ls_name and column_name= :ls_name_nivel2;

				If (resultado_nivel2 > 0 or ls_name = "m_editar" or ls_name = "m_sistema") Then
					//messagebox("O menu: ",ls_name_nivel2 +" já está no bd")
				else
					
					string   SQL_NIVEL2
					
					// adicionando nivel2 como colunas da tabela de nivel1
					if (ls_name_nivel2 = "m_trocarusuario" or ls_name_nivel2 = "m_alterarsenha" or ls_name_nivel2 = "m_sair" or ls_name_nivel2 = "m_sobre") then
							SQL_NIVEL2 = "ALTER TABLE "+ls_name &
							+ " ADD COLUMN "+ls_name_nivel2 +" SMALLINT default 1 NOT NULL"
						 	EXECUTE IMMEDIATE :SQL_NIVEL2  USING SQLCA ;	
							 messagebox("O menu de nível2: ",ls_name +"-> "+ ls_name_nivel2 +" vai se adicionado ao bd")
					
					// não adiciona separador de menu -----
					elseif  not (ls_name_nivel2 = "m_0" or ls_name_nivel2 =  "m_1") then
							SQL_NIVEL2 = "ALTER TABLE "+ls_name &
							+ " ADD COLUMN "+ls_name_nivel2 +" SMALLINT default 0 NOT NULL"
							 EXECUTE IMMEDIATE :SQL_NIVEL2  USING SQLCA ;			
							 messagebox("O menu de nível2: ",ls_name +"-> "+ ls_name_nivel2 +" vai se adicionado ao bd")
					end if
					
				End If




	    //obtemos a dimensão de item em nivel 3
		li_totalitem[3] = upperbound (w_index.menuid.item[li_a].item[li_b].item);


			For 	li_c = 1 to li_totalitem[3]
				ls_name_nivel3 = w_index.menuid.item[li_a].item[li_b].item[li_c].classname() ;

				//Sybase
				/*
				integer resultado_nivel3	
				select count()
				Into :resultado_nivel3
				from syscolumn join systable on systable.table_id = syscolumn.table_id where table_name = :ls_name and column_name = :ls_name_nivel3;
				*/
				
				//PostgreSQL
				integer resultado_nivel3	
				SELECT count(column_name)
					into :resultado_nivel3
				FROM information_schema.columns 
				WHERE table_name=  :ls_name and column_name= :ls_name_nivel3;



				If (resultado_nivel3 > 0) Then
					//messagebox("O menu: ",ls_name_nivel3 +" já está no bd")
				else
					messagebox("O menu: ",ls_name +"-> "+ ls_name_nivel2  +"-> "+ ls_name_nivel3 +" vai se adicionado ao bd")
					string      SQL_NIVEL3
					// adicionando nivel3 como colunas da tabela
					SQL_NIVEL3 = "ALTER TABLE "+ls_name &
						+ " ADD COLUMN "+ls_name_nivel3 +" SMALLINT default 0 NOT NULL"
						 EXECUTE IMMEDIATE :SQL_NIVEL3  USING SQLCA ;	
				end if					
			
			

			//vai agregando o nivel dos submenu
			next; //for li_c


			//vai agregando o nivel dos submenu
			next; //for li_b
			
			//ls_name =ls_name +CHAR(10)+CHAR(13);
			

	next; //for li_a
	
COMMIT;

close(this)


end event

