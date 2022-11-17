#!/usr/bin/make

Linux_DIR := $(abspath $(patsubst %/,%,$(dir $(abspath $(lastword $(MAKEFILE_LIST))))))
ifneq ($(OS),Windows_NT)
	include $(Linux_DIR)/Linux/*.mk
endif