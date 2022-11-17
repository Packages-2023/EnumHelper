#!/usr/bin/make
Settings_DIR := $(abspath $(patsubst %/,%,$(dir $(abspath $(lastword $(MAKEFILE_LIST))))))

include $(Settings_DIR)/All/no-print-directory.mk
include $(Settings_DIR)/All/args.mk
include $(Settings_DIR)/All/print.mk
include $(Settings_DIR)/All/versions.mk

ifeq ($(OS),Windows_NT)
# Windows
	include $(Settings_DIR)/Windows/*.mk
else
# Linux
	include $(Settings_DIR)/Linux/*.mk
endif
help-Settings: #Help: Запуск всех Help
	@$(MAKE) help.Settings

