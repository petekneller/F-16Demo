dofile(LockOn_Options.script_path.."HUD/Indicator/definitions.lua")

local BASE_COLOR  = {255,0  ,0,255}
local BASE_COLOR2 = {0  ,255,0,255} --128,165,0,120
local GRID_   			= MakeMaterial(LockOn_Options.script_path.."/Textures/HUD_grid.tga",BASE_COLOR2) -- image of the fixed net
local BASE_COLOR_MAT    = MakeMaterial(nil,BASE_COLOR)

local shape_rotation = 0

shape_rotation = math.tan(shape_rotation/57.3) * 1000 -- to mils -- NOTE: this does nothing currently, returns 0


local full_radius =  108 -- is this the radius of "HUD/net view field"? Units (pixels or angular units)?
local grid_shift  = -35 -- explain shift?
local grid_radius =  full_radius + grid_shift

local grid_origin	         = CreateElement "ceSimple"
grid_origin.name 		     = create_guid_string() -- no such function in this script. Not in definitions.lua either. Could be in elements_defs.lua
grid_origin.collimated 		 = true
AddElement(grid_origin)
print("GRID ORIGIN")

local grid	    = CreateElement "ceTexPoly" --this could be the text area on HUD
grid.name 		= create_guid_string() -- this must be external function call.
grid.vertices   = {{-grid_radius, grid_radius},
				   { grid_radius, grid_radius},
				   { grid_radius,-grid_radius},
				   {-grid_radius,-grid_radius}}
grid.indices	= {0,1,2,2,3,0}
grid.tex_coords = {{0,0},{1,0},{1,1},{0,1}}
grid.material   = GRID_	   
grid.init_pos   = {0,grid_shift + shape_rotation} 
grid.collimated = true
grid.parent_element = grid_origin.name
AddElement(grid)
print("Adding Grid")

local FONT_         = MakeFont({used_DXUnicodeFontData = "FUI/Fonts/font_cockpit_rus_2"},BASE_COLOR,50,"test_font") --this is font object declaration. Mig-21 does not have fonts, therefore disabled.


AddText({-75,30},{"%4.0f","%s"},{"ALT"})
AddText({75,30},{"%4.0f","%s"},{"SPEED"})
AddText({0,85},{"%4.0f","%s"},{"HDG"})
AddText({0,-25},{"%6.0f","%s"},{"FUEL"})
AddText({-70.3,-12.5},{"M%1.2f","%s"},{"MACH"})
AddText({0,50},{"DC:%1.0f","%s"},{"DC"})
AddText({0,60},{"AC:%1.0f","%s"},{"AC"})	

AddText({20,85},{"%s"},{"FLAP"})
AddText({30,85},{"%s"},{"CANOPY"})
AddText({40,85},{"%s"},{"GEAR"})
AddText({5,31},{"%s"},{"BRAKE"})
AddText({2,50},{"%s"},{"BINGO"})
print("COMMON PAGE UPDATED")




					   				  

				  
				  
function texture_box (UL_X,UL_Y,W,H) --this is texture box function. Receives some coordinates and dimensions, returns 4 pairs of values. Nothing is calling this function inside script.
local texture_size_x = 128
local texture_size_y = 128
local ux = UL_X / texture_size_x
local uy = UL_Y / texture_size_y
local w  = W / texture_size_x
local h  = W / texture_size_y

return {{ux	    ,uy},
		{ux + w ,uy},
		{ux + w ,uy + h},
		{ux	 	,uy + h}}
end

function create_textured_box(UL_X,UL_Y,DR_X,DR_Y) -- function that creates textured square. This function is called 2 times in below code.

local size_per_pixel = 1/8
local texture_size_x = 128
local texture_size_y = 128
local W = DR_X - UL_X
local H = DR_Y - UL_Y

local half_x = 0.5 * W * size_per_pixel
local half_y = 0.5 * H * size_per_pixel
local ux 	 = UL_X / texture_size_x
local uy 	 = UL_Y / texture_size_y
local w  	 = W / texture_size_x
local h 	 = H / texture_size_y

local object = CreateElement "ceTexPoly"
object.vertices =  {{-half_x, half_y},
				    { half_x, half_y},
				    { half_x,-half_y},
				    {-half_x,-half_y}}
object.indices	  = {0,1,2,2,3,0}
object.tex_coords = {{ux     ,uy},
					 {ux + w ,uy},
					 {ux + w ,uy + h},
				     {ux 	 ,uy + h}}	 
				 
return object




end
