:fighter
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
goto display

:cleric
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
goto display

:paladin
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
goto display

:rogue
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

goto display

:mage
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
goto :display


:display
set StrDisplay=%Strength%
set ConDisplay=%Constitution%
set IntDisplay=%Intelligence%
set HpDisplay=%Health%
set CharmDisplay=%Charm%