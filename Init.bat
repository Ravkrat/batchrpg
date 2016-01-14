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
	IF /I "%classInput%"=="f" set ClassChoice=Fighter 
	IF /I "%classInput%"=="c" set ClassChoice=Cleric 
	IF /I "%classInput%"=="p" set ClassChoice=Paladin 
	IF /I "%classInput%"=="r" set ClassChoice=Rogue 
	IF /I "%classInput%"=="m" set ClassChoice=Mage 
	cls
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
	echo                   Allignment Selection
	echo _______________________________________________________________
	echo +                  Which are you?                             +
	echo +[l]awfull good - [n]eutral good - [c]haotic good             +
	echo ---------------------------------------------------------------
	set /p allignment=
	goto loopCheckAllignment
	:contAllignment
	goto endallignment
:classSelectionDisplay
	::allows for class selection, and selection re-do
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
	goto loopCheckClass
	:contClass
	goto endClassChoice

:statAllocationDisplay
	cls
	IF %statDisplay% EQU 9 (goto :loopCheckStart) else(goto :contStart)
	IF %statDisplay% EQU 2 (goto :loopCheckStat) else(goto :contStat)
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
	echo Kappa Kappa
	pause
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
	goto loopCheckName
	
	goto allignmentSelectionDisplay
::------------------------------------------------------------------------
::------------------------------------------------------------------------
::VALIDATION BLOCKS
::------------------------------------------------------------------------
::------------------------------------------------------------------------
:inputValidation
echo not used at the moment
::keeps the initial-loop from repeating
:loopCheckName
IF %checkName% EQU 1 set checkName=2 goto :contName
pause
IF %checkName% GRT 1 goto finalInitDisplay
pause

:loopCheckAllignment
IF %checkAllignment% EQU 2 (goto :finalInitDisplay)
IF %checkAllignment% EQU 1 (set checkloop=2)(goto :contAllignment)

:loopCheckClass
IF %checkClass% EQU 2 (goto :finalInitDisplay)
IF %checkClass% EQU 1 (set checkloop=2)(goto :contClass)

:loopCheckStat
IF %checkStat% EQU 2 (goto :finalInitDisplay)
IF %checkStat% EQU 1 (set checkloop=2)(goto :contStat)
::-------------------------------------------------------------------------
::-------------------------------------------------------------------------
::VARIABLE BLOCKS
::-------------------------------------------------------------------------
::-------------------------------------------------------------------------
:initVarSet
	::variable [stat]Display is used for player feedback
	::after variable [stat]Display is used in label statInit it will overwright 
	::variable [stat],eventually variable [stat]/s will be written to PlayerInfo.txt
	set Strength=1
	set Health=10
	set HealthCount=10
	set Constitution=1
	set Intelligence=1
	set Charm=5
	set CharmCount=5
	set Charisma=1
	set StrDisplay=%Strength%
	set ConDisplay=%Constitution%
	set IntDisplay=%Intelligence%
	set CharDisplay=%Charisma%
	set HpDisplay=%Health%
	set CharmDisplay=%Charm%
	set checkName=1
	set checkAllignment=1
	set checkClass=1
	set checkStat=1

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

	


CALL PlayerInfo.bat 

::echo %ClassChoice% > ClassChoice.txt
::echo %Name% > PlayerInfo.txt
::echo %nature% >> PlayerInfo.txt