@echo off
::-------------------------------------------
::-------------------------------------------
::TO-DO LIST
::-------------------------------------------
::-------------------------------------------
::labels working: name,allignment,class
::labels not-working: statAllocationDisplay
::labels not-written: initDisplay,statInfo,inputValidation
::main labels: DISPLAY,LOGIC,INPUT BLOCKS
::support labels: all end[name] and update[short-hand stat] labels 
::auxillary labels:initVarSet,inputValidation 


::variables

::getting things started
goto InitVarSet
:contName
goto nameSet
::after this one, execution starts jumping between aux/main/support labels
goto allignmentSelectionDisplay




::ignore this sigment
::-label playerName
::echo %name% > PlayerInfo.txt
::-label playerClass
::echo %ClassChoice% > PlayerInfo.txt
:-label :playerAllignment
::echo Allignment-%allignment% > PlayerInfo.txt
::-label playerStats
::echo Strength-%Strength% > PlayerInfo.txt
::echo Constitution-%Constitution% > PlayerInfo.txt
::echo Intelligence-%Intelligence% > PlayerInfo.txt
::echo Charisma-%Charisma% > PlayerInfo.txt
::echo Health-%Health% > PlayerInfo.txt
::echo Charm-%Charm% > PlayerInfo.txt
:write


::-------------------------------------------------------------------------
::-------------------------------------------------------------------------
::UPDATE STAT BLOCKS
::-------------------------------------------------------------------------
::-------------------------------------------------------------------------
::update[Stat] labels set the [Short-hand stat]Display and statDisplay numbers then go to label statLogic
:updateStr
	set /a strDisplay=%strDisplay%+1
	set /a statDisplay-=1
	set "statInput="
	goto statDisplayLogic
:updateCon
	set /a ConDisplay+=1
	set /a statDisplay-=1
	set "statInput="
	goto updateHp
:updateInt
	set /a IntDisplay+=1
	set /a statDisplay-=1
	set "statInput="
	goto statDisplayLogic
:updateChar
	set /a statDisplay-=1
	set /a CharDisplay+=1
	set "statInput="
	goto updateCharm
:updateHp
	set /a HpDisplay+=%HealthCount%
	set "statInput="
	goto statDisplayLogic
:updateCharm
	set /a CharmDisplay+=%CharmCount%
	set "statInput="
	goto statDisplayLogic
::-------------------------------------------------------------------------
::-------------------------------------------------------------------------
::LOGIC BLOCKS
::-------------------------------------------------------------------------
::-------------------------------------------------------------------------
:statLogic
	IF /I "%statInput%"=="S" goto updateStr
	IF /I "%statInput%"=="C" goto updateCon
	IF /I "%statInput%"=="I" goto updateInt
	IF /I "%statInput%"=="Ch" goto updateChar
	IF /I "%statInput%"=="x" goto statInfoDisplay

:statDisplayLogic
	IF  %statDisplay% GTR 0 (goto :statAllocationDisplay)
	IF  %statDisplay% EQU 0 (goto :finalInitDisplay)
:endClassChoice	
	echo in endClassChoice
	pause
	IF /I "%classInput%"=="f" set ClassChoice=Fighter && call Classes.bat :fighter
	IF /I "%classInput%"=="c" set ClassChoice=Cleric && call Classes.bat :cleric
	IF /I "%classInput%"=="p" set ClassChoice=Paladin && call Classes.bat :paladin
	IF /I "%classInput%"=="r" set ClassChoice=Rogue && call Classes.bat :rogue
	IF /I "%classInput%"=="m" set ClassChoice=Mage && call Classes.bat :mage
	cls
	echo going out of endClassChoice
	pause
	goto statAllocationDisplay
:endallignment
	IF /I "%nature%"=="l" set allignment=lawfull
	IF /I "%nature%"=="n" set allignment=neutral
	IF /I "%nature%"=="c" set allignment=chaotic
	cls
	goto classSelectionDisplay
::-------------------------------------------------------------------------
::-------------------------------------------------------------------------
::DISPLAY BLOCKS
::-------------------------------------------------------------------------
::-------------------------------------------------------------------------
:allignmentSelectionDisplay
	::allows for allignment selection and selection redo
	::will eventually play a part in deciding which narrative is used
	::plus dialoge choices w/npc's
	:contAllignment
	echo                   Allignment Selection
	echo _______________________________________________________________
	echo +                  Which are you?                             +
	echo +[l]awfull good - [n]eutral good - [c]haotic good             +
	echo ---------------------------------------------------------------
	set /p allignment=
	IF %checkAllignment% EQU %checkUsed% ( 
		goto :finalInitDisplay
	) ELSE (
		goto loopCheckAllignment
	)
:classSelectionDisplay
	::allows for class selection, and selection re-do
	:contClass
	echo                         Class Selection
	echo ________________________________________________________________
	echo +-Which class do you wish to play?-----------------------------+
	echo +-[f]ighter   [c]leric   [p]aladin   [r]ogue [m]age------------+
	echo +-press class[key] plus [i] for class info---------------------+
	echo +-[n]o class---------------------------------------------------+                         
	echo ----------------------------------------------------------------
	::takes in user input then goes to endstatInit to write it to ClassChoice.txt
	set /p classInput= 
	set ClassChoice=%classInput%
	IF %checkClass% EQU %checkUsed% ( 
		goto :finalInitDisplay
	) ELSE (
		goto loopCheckClass
	)
	
	

:statAllocationDisplay
	cls
	:contStat
	set 'statinput='
	echo                Stat-point Allocation
	echo _______________________________________________________
	echo +-you have %statDisplay% stat points un-assigned-----------------+
	echo +-[S]trength [C]onstitution [I]ntelligence [Ch]arisma +
	echo +-Strength:%StrDisplay% Constitution:%ConDisplay% Intelligence:%IntDisplay% Charisma:%CharDisplay% +
	echo +-Hp:%HpDisplay% Charm:%CharmDisplay%----------------------------------------+
	echo +-Stat Info [x]---------------------------------------+
	echo -------------------------------------------------------
	::taken in user input then run ifs to find match
	set /p statInput=
	goto statLogic


:finalInitDisplay
	
	
	goto:EOF
	::eventually add final display screen here 
	::show stats,name,class,allignment
	::and allow changing of any.
::statInfoDisplay

:nameSet
	
	::allows for the player name to be set and resetting player-name
	echo Remember:Your name will remain with you throughout the game.
 	set /p Name=Enter your name: 
	cls
	

	IF %checkName% EQU %checkUsed% (
		goto :finalInitDisplay 
	) ELSE ( 
		goto loopCheckName
	)
::------------------------------------------------------------------------
::------------------------------------------------------------------------
::VALIDATION BLOCKS
::------------------------------------------------------------------------
::------------------------------------------------------------------------
:inputValidation
::inputValidation is not used atm

::keeps the initial-loop from repeating
::loopCheck[Text] for use in the Check[Text] label

:loopCheckName
IF  %checkName% EQU %checkBase% set checkName=2 && goto :allignmentSelectionDisplay

:loopCheckAllignment
IF %checkAllignment% EQU %checkBase% set checkloop=2 && goto :endallignment

:loopCheckClass
IF %checkClass% EQU %checkBase% set checkloop=2 && goto :endClassChoice

:loopCheckStat
IF %checkStat% EQU %checkBase% set checkloop=2 && goto :contStat
::-------------------------------------------------------------------------
::-------------------------------------------------------------------------
::VARIABLE BLOCKS
::-------------------------------------------------------------------------
::-------------------------------------------------------------------------
:initVarSet
	::variable [stat]Display is used for player feedback
	::after variable [stat]Display is used in label statInit it will overwright 
	::variable [stat],eventually variable [stat]/s will be written to PlayerInfo.txt

	set Strength=0
	set Charisma=0
	set Constitution=0
	set Intelligence=0
	set Health=0
	set Charm=0

	set HealthCount=0
	set CharmCount=0

	set StrDisplay=%Strength%
	set ConDisplay=%Constitution%
	set IntDisplay=%Intelligence%
	set HpDisplay=%Health%
	set CharmDisplay=%Charm%

	set CharDisplay=%Charisma%
	
	::checked against checkBase for first loop
	::checked against checkUsed to stop second loop-through(after finalInitDisplay is called)
	set checkName=1
	set checkAllignment=1
	set checkClass=1
	set checkStat=1

	set checkBase=1
	set checkUsed=2

	::used in label statAllocationDisplay
	set statCap=10
	set statDisplay=0
	set statZero=0 
	set statDisplay=%statCap%
	
	::used in classSelectionDisplay
	set ClassChoice=

	::used for loop-checking
	set statLoopCheck=2

	::used in name
	set Name=
	goto nameSet

	


::CALL PlayerInfo.bat 

::echo %ClassChoice% > ClassChoice.txt
::echo %Name% > PlayerInfo.txt
::echo %nature% >> PlayerInfo.txt