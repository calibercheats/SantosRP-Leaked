
-----------------------------------------------------
local LANG = CasinoKit.getLanguageObject("en")

-- Generic
LANG.because = "because" -- this can be used after eg. cannotenterseat. Use colon (':') if your language does not have matching
LANG.lackofmoney = "insufficient funds"
LANG.cantafford = "Cannot afford"
LANG.pot = "pot"
LANG.turn = "turn"

-- Chips
LANG.chips = "chips"
LANG.currencytochips = "Converted $%d to %d chips."
LANG.chipstocurrency = "Converted %d chips to $%d."
LANG.chipexchangeinsn = "You can get chips from a dealer or chip exchange NPC."

LANG.chipdealer_exchangetab = "Chip Exchange"
LANG.chipdealer_rules = "Rules"
LANG.chipdealer_tablesettings = "Table Settings"

LANG.chipdealer_chipamount = "You currently have %d chips."
LANG.chipdealer_exchangeverb = "Exchange"
LANG.chipdealer_tip0 = "Tip: the more you exchange the less you lose in fees!"
LANG.chipdealer_ = "Exchange"

-- Seats/table
LANG.seatreserved = "This seat is reserved for someone else."
LANG.notyourseat = "This is not your seat."
LANG.tryanotherseat = "Try another seat around the table."
LANG.cannotenterseat = "Cannot enter seat"
LANG.unknownreason = "unknown reason"
LANG.removedfromtbl = "You have been removed from table"

-- Game
LANG.couldnotjoingame = "Could not join game"
LANG.duetotimeout = "due to timing out"
LANG.timedout = "timed out"
LANG.notyourturn = "not your turn"
LANG.winswith = "wins with"
LANG.waiting = "waiting"

LANG.game_chipcount = "total: %d"

-- Poker/card games
LANG.ante = "ante"
LANG.bet = "bet" -- general form noun
LANG.betverb = "bet" -- "X #betverb Y"
LANG.fold = "fold"
LANG.foldverb = "folded"
