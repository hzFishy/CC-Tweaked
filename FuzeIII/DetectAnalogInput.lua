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

--[[
Note importante:
> il faut obligatoirement que les signaux `signal = {15, 11, 13, 6, 9}` "existent" (*donc soit possible)*, si vous souhaitez avoir des signaux + ou - long il faut que vous modifier la liste `signal` en conséquence (pas d'ordre requis)

Pour avoir la force du signal d'un côté voici quoi faire:
1\ Poser un ordinateur
2\ Faire la traîné de redstone avec "l’interrupteur"
3\ Allumer la redstone
4\ dans le terminale de l'ordinateur écrire `lua` et appuyer sur ENTRER
5\ écrire `redstone.getAnalogInput(<côté>)`, remplacer <côté> par le côté concerné par le test `('left', 'right','top','bottom','front','back')` et appuyer sur ENTRER
6\ Regarder l'output
7\ Si des ajustement de 2\ sont fait refaire 5\ et 6\ autant que nécessaire
--]]
