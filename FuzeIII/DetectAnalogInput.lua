--[[
Script réalisé par hzFishy / Fishy#0021 pour FuzeIII
Peux être utilisé et modifié si la demande faite à l'auteur a été accepté

// UTILISATION: écrire dans le terminal CraftOS la ligne suivante (sans guillements): \\
	 "monitor <côté où est placé le moniteur (left,right,top,bottom,front,back)> <nom de ce programme .lua>
--]]

m = peripheral.wrap("top") -- link le pc avec le moniteur au dessus ("top") ! A modifier si moniteur placer ailleurs 
m.clear() -- clear le moniteur

-- listes à ne pas modifier, utilisé afin d'attribuer les signaux aux côtés
sidesen = {'left', 'right','top','bottom','front','back'}
sidesfr = {'à gauche', 'à droite', 'en haut', 'en bas', 'de face', 'derrière'}
signal = {15, 11, 13, 6, 9}

-- lancement du script visuel
print("Analizing...\n") -- décoratif
sleep(1) -- décoratif
for i=1,6 do -- i entre 1 et 6 car 6 faces
	for j=1,5 do -- j entre 1 et 5 car 5 signaux prédéfinis
		if redstone.getAnalogInput(sidesen[i]) == signal[j] then
			print("Côté [",sidesfr[i],"] détécté avec un signal de [",signal[j],"]")
		end
	end
end