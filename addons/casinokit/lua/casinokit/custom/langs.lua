
-----------------------------------------------------
local langs = {}

local fflags = SERVER and bit.bor(FCVAR_ARCHIVE, FCVAR_REPLICATED, FCVAR_NOTIFY) or FCVAR_REPLICATED

local lang_phraseCache, lang_interpCache = {}, {}

local cvar_lang = CreateConVar("casinokit_language", "en", fflags)
cvars.AddChangeCallback("casinokit_language", function(_, _, _)
	lang_phraseCache = {}
	lang_interpCache = {}
end)

function CasinoKit.getLanguagePhrase(key, default)
	local cached = lang_phraseCache[key]
	if cached then return cached end

	local langObj = langs[cvar_lang:GetString()] or langs.en or {}

	local phraseLang = langObj[key] or langs.en[key]
	if phraseLang then
		lang_phraseCache[key] = phraseLang
		return phraseLang
	end

	return default
end

function CasinoKit.L(str, ...)
	local langString = lang_interpCache[str]

	if not langString then
		langString = string.gsub(str, "#([%a%d_]+)", function(key)
			return CasinoKit.getLanguagePhrase(key) or ("[unknown langkey: " .. key .. "]")
		end)
		lang_interpCache[str] = langString
	end

	return string.format(langString, ...)
end

function CasinoKit.getLanguageObject(lang)
	langs[lang] = langs[lang] or {}
	return langs[lang]
end
