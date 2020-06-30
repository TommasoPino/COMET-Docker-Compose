#!/usr/bin/env bash
set -e
echo "COMPOSING"

export DB_POSTGRESPASSWORD=pass
export DB_HOSTPORT=5432
export DB_TESTHOSTPORT=5432
export WEBSERVICES_HOSTPORT=5000

start() {
	docker-compose start
}

stop() {
	docker-compose stop
}

up() {
	docker-compose down --remove-orphans
	docker-compose up -d
}

down() {
	docker-compose down --remove-orphans
}

reboot() {
	docker-compose down
	docker-compose up -d
}

rc() {
	docker-compose -f docker-compose-rc.yml down --remove-orphans
	docker-compose -f docker-compose-rc.yml up -d
}

rcdown() {
	docker-compose -f docker-compose-rc.yml down --remove-orphans
}

testrc() {
	docker-compose -f docker-compose-rc-test.yml down --remove-orphans
	docker-compose -f docker-compose-rc-test.yml up -d
}

testrcdown() {
	docker-compose -f docker-compose-rc-test.yml down --remove-orphans
}

test() {
	docker-compose -f docker-compose-test.yml down --remove-orphans
	docker-compose -f docker-compose-test.yml up -d
}

testdown() {
	docker-compose -f docker-compose-test.yml down --remove-orphans
}

case $1 in
	up)
		up
		;;
	down)
		down
		;;
	strt)
		start
		;;
	stp)
		stop
		;;
	reboot)
		reboot
		;;
	rc)
		rc
		;;
	rcdown)
		rcdown
		;;
	testrc)
		testrc
		;;
	testrcdown)
		testrcdown
		;;
	test)
		test
		;;
	testdown)
		testdown
		;;
	*)
		up
		;;
esac