@echo off

set DB_POSTGRESPASSWORD=pass
set DB_HOSTPORT=5432
set DB_TESTHOSTPORT=5432
set WEBSERVICES_HOSTPORT=5000

IF %1.==. GOTO Up
IF %1==up GOTO Up
IF %1==down GOTO Down
IF %1==strt GOTO Strt
IF %1==stp GOTO Stp
IF %1==reboot GOTO Reboot

IF %1==rc GOTO Rc
IF %1==rcdown GOTO Down

IF %1==testrc GOTO TestRc
IF %1==testrcdown GOTO TestRcDown

IF %1==test GOTO Test
IF %1==testdown GOTO TestDown

GOTO End

:Strt
START /B docker-compose start
GOTO End

:Stp
START /B docker-compose stop
GOTO End

:Up
START /B docker-compose up -d
GOTO End

:Down
START /B docker-compose down --remove-orphans
GOTO End

:Reboot
START /B docker-compose down
START /B docker-compose up -d
GOTO End

:Rc
START /B docker-compose -f docker-compose-rc.yml down --remove-orphans
START /B docker-compose -f docker-compose-rc.yml up -d
GOTO End

:RcDown
START /B docker-compose -f docker-compose-rc.yml down --remove-orphans
GOTO End

:TestRc
START /B docker-compose -f docker-compose-rc-test.yml down --remove-orphans
START /B docker-compose -f docker-compose-rc-test.yml up -d
GOTO End

:TestRcDown
START /B docker-compose -f docker-compose-rc-test.yml down --remove-orphans
GOTO End

:Test
START /B docker-compose -f docker-compose-test.yml down --remove-orphans
START /B docker-compose -f docker-compose-test.yml up -d
GOTO End

:TestDown
START /B docker-compose -f docker-compose-test.yml down --remove-orphans
GOTO End

:End