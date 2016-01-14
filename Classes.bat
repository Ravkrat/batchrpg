echo in Classes 
pause

:fighter
echo in fighter
pause
set fighterHealth=100
set fighterStrength=10
set fighterConstitution=9
set fighterIntelligence=3
set fighterCharisma=1

set Strength=%fighterStrength%
set Charisma=%fighterCharisma%
set Constitution=%fighterConstitution%
set Intelligence=%fighterIntelligence%
set Health=%fighterHealth%
echo out of fighter
pause
goto display

:cleric
echo in cleric
pause
set clericHealth=100
set clericStrength=1
set clericConstitution=6
set clericIntelligence=7
set clericCharisma=4

set Strength=%clericStrength%
set Charisma=%clericCharisma%
set Constitution=%clericConstitution%
set Intelligence=%clericIntelligence%
set Health=%clericHealth%
echo out of cleric
pause
goto display

:paladin
echo in paladin
pause
set paladinHealth=100
set paladinStrength=4
set paladinConstitution=9
set paladinIntelligence=5
set paladinCharisma=8

set Strength=%paladinStrength%
set Charisma=%paladinCharisma%
set Constitution=%paladinConstitution%
set Intelligence=%paladinIntelligence%
set Health=%paladinHealth%
echo out of paladin
pause
goto display

:rogue
echo in rogue
pause

set rogueHealth=100
set rogueStrength=7
set rogueConstitution=4
set rogueIntelligence=3
set rogueCharisma=4

set Strength=%rogueStrength%
set Charisma=%rogueCharisma%
set Constitution=%rogueConstitution%
set Intelligence=%rogueIntelligence%
set Health=%rogueHealth%

echo out of rogue
pause
goto display

:mage
echo in mage
pause

set mageHealth=100
set mageStrength=2
set mageConstitution=6
set mageIntelligence=10
set mageCharisma=1

set Strength=%mageStrength%
set Charisma=%mageCharisma%
set Constitution=%mageConstitution%
set Intelligence=%mageIntelligence%
set Health=%mageHealth%



echo out of mage
pause
goto :display


:display
set StrDisplay=%Strength%
set ConDisplay=%Constitution%
set IntDisplay=%Intelligence%
set HpDisplay=%Health%
set CharmDisplay=%Charm%