--[[ 

    A small library for creating dialog boxes
    Copyright (C) 2021  Alexey  [steamid64: 76561198235732946]

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU Affero General Public License as published
    by the Free Software Foundation, either version 3 of the License, or
    any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU Affero General Public License for more details.

    You should have received a copy of the GNU Affero General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>.


	Специально для Антона. Ибо нехуй пиздить скрипты и текстуры.

--]] 

surface.CreateFont("HeaderFont", {
	extended = true,
	font = "Montserrat Bold",
	size = 28
})


local PANEL = {}

PANEL = {
	Init = function( self )
		
		self:SetSize(512,256)
		self:Center()
		self:SetTitle("")
		self:ShowCloseButton(false)

		local closebut = vgui.Create("DButton", self)
		closebut:SetPos(self:GetWide()-32, 8)
		closebut:SetSize(16,16)
		closebut:SetText("X")
		closebut.DoClick = function()				
			self:Remove()
		end

		function closebut:Paint(w,h)
			draw.RoundedBox(8, 0, 0, w, h, Color(32,32,32))
		end

	end,
	Paint = function( self, w, h )
		draw.RoundedBox(8, 0, 0, w, h, Color(23,25,31))
		draw.RoundedBoxEx(8, 0, 0, w, 32, Color(34,36,43), true, true, false, false)
		draw.SimpleText(self:GetTitle() or "Title", "HeaderFont", 16, 16, color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_CENTER)
	end,
	SetHeader = function(self, title)
		PANEL.Title = title or "Title"
	end,
	GetTitle = function(self)
		return PANEL.Title or "Title"
	end
}

--[[ 

vgui.Register("ACore:Frame", PANEL, "DFrame")

local aframe = vgui.Create("ACore:Frame")
aframe:MakePopup()
aframe:SetHeader("Spawnmenu trains")

--]] 