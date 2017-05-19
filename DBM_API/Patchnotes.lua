DBM_PN = {
	["en"] = {
		[310] = {
			"updated for patch 2.4.0, but most mods are untested! So there might be bugs",
			"updated old boss mods to work with the new combat log system",
			"added Sunwell boss mods",
			"you can now disable the flash effects in Battlegrounds",
			"Black Temple/Illidan: added warning and timer for \"Caged\" in phase 4",
			":StartStatusBarTimer() now accepts spellIds as texture",
		},
		[303] = {
			"v3.03",
			"you can now use % t in /dbm timer and /dbm broadcast timer",
			"the toc field X-DBM-LoadZone now supports multiple zones",
			"the sync code now supports non-raid boss mods",
			"increased default bar limit to 15",
			"some minor bug fixes",
			"removed the mod DBM_Other",
			"added DBM_Azeroth and DBM_Outlands",
			"Illidan: added timer for Shadow Prison",
			"Illidan: added timer and warning for phase 4 enrage",
			"Battlegrounds: fixed some cross-server sync issues",
			"Battlegrounds: changed sync code, DBM 3.02c will not sync with older versions in BGs",
			"Battlegrounds: added auto-release spirit option (disabled by default)",
			"Battlegrounds: re-enabled the blue flash effect",
			"Illidari Council: added time for divine wrath",
			"Bloodboil: added optional Arcing Smash announce",
			"updated deDE localization",
			" ",
			" ",
		},
		[302] = {
			"v3.02",
			"fixed some 2.3 issues",
			"Zul'Aman/Zul'jin: Added more warnings",
			"Zul'Aman/Malacrass: Updated/changed warnings/timer",
			"Zul'Aman/localizations: Updated zhTW/deDE localizations",
			"Battlegrounds: Fixed score frame error messages and AV timers",
			"Al'ar: Timers in phase 1 should work again",
			" ",
			" ",
		},
		[301] = {
			"v3.01",
			"Quick update for WoW 2.3",
			"Added Zul'Aman mods"
		},
	},
}

StaticPopupDialogs["COPY_DBM_URL"] = {
	text = DBM_COPY_PASTE_NOW,
	button1 = DBM_CLOSE,
	hasEditBox = 1,	
	button2 = "",
	
	OnShow = function()
		getglobal(this:GetName().."EditBox"):SetText("http://www.deadlybossmods.com");
		getglobal(this:GetName().."EditBox"):SetFocus();
		getglobal(this:GetName().."EditBox"):HighlightText();
		getglobal(this:GetName().."Button2"):Hide();
		getglobal(this:GetName().."Button1"):ClearAllPoints();
		getglobal(this:GetName().."Button1"):SetPoint("TOP", getglobal(this:GetName().."EditBox"), "BOTTOM", 0, -8);		
	end,
	OnHide = function()
		if ( ChatFrameEditBox:IsVisible() ) then
			ChatFrameEditBox:SetFocus();
		end
		getglobal(this:GetName().."EditBox"):SetText("");
		getglobal(this:GetName().."Button2"):Show();
	end,
	EditBoxOnEnterPressed = function()
		this:GetParent():Hide();
	end,
	EditBoxOnEscapePressed = function()
		this:GetParent():Hide();
	end,
	timeout = 0,
	exclusive = 1,
	whileDead = 1,
	hideOnEscape = 1
};

StaticPopupDialogs["OLD_VERSION_DETECTED"] = {
	text = DBM_ERROR_LVBM_STILL_LOADED,
	button1 = DBM_DISABLE_AND_RELOAD,
	
	OnAccept = function()
		DisableAddOn("LVBM_API");
		ReloadUI();
	end,
	
	timeout = 0,
	exclusive = 1,
	whileDead = 1,
};