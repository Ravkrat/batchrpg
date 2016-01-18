

















::Initial Set for variables used in locations.bat
:locationsInitVarSet
	::starting point(no matter,character/alignment-choice)
set eastPath=0
	::starting cities
set WolfPine=1
set DragonTail=2
set EastHaven=3
set SilverKeep=4
set AshBorne=5
set Carigan=6
	::Cities
set Capital=20

::areas outside the cities
	::use random to allow for a -chance- at different encounters

	::path leading out of and to the other cities
	::forest/cave entrance would be found here
set rngCobblePathI=
set rngCobblePathII=
set minCobblePath=0
set maxCobblePath=20

	::allows for different forest entrance details/quests
set rngForestEntranceI=
set rngForestEntranceII=
set minForestEntrance=0
set maxForestEntrance=20

	::decideds enemies in forest/forest-type
set rngForestI=
set rngForestII=
set minForest=0
set maxForest=20

	::encounters when moving inside a forest
set rngForestPathI=
set rngForestPathII=
set minForestPath=0
set maxForestPath=20

	::allows for different cave entrance details/quests
set rngCaveEntranceI=
set rngCaveEntranceII=
set minCaveEntrance=0
set maxCaveEntrance=20

	::decides enemies in cave/cave-type
set rngCaveI=
set rngCaveII=
set minCave=0
set maxCave=20

	::encounters when moving inside a cave
set rngCaveTunnelI=
set rngCaveTunnelII=
set minCaveTunnel=0
set maxCaveTunnel=20

	::for starting city arithmetic/logic
set rngCityStartI=
set rngCityStartII=
set minCharCityStart=0
set maxCharCityStart=69
set minAlignmentCityStart=70
set maxAlignmentCityStart=100
