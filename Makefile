#!/usr/bin/make
#Varsion EnumHelper 1.0.0 17.11.2022
################################################################################
# 👉                    ⚙️Makefile Settings                                👈 #
################################################################################
include ./Make/Settings/System.mk
include ./Make/Linux.mk
################################################################################
# 👉                         🧪 Test                                      👈 #
################################################################################
help-test: #Help: Show help Test
	@$(MAKE) help.Test
test-all: #Test: All
	@$(MAKE) phpunit
phpunit: #Test: phpunit
	@./vendor/bin/phpunit --colors=always