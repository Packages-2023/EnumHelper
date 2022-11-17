#!/usr/bin/make
#Varsion Settings/Linux/dir 2.0 16.06.2022 ⚙️
#--------------------------------  DIR   ----------------------------------
ROOT_DIR := $(shell dirname $(realpath $(firstword $(MAKEFILE_LIST))))
#--------------------------------------------------------------------------------
root-dir: #Settings: Директория файла Makefile
	@echo "📁 ROOT_DIR= $(ROOT_DIR)"
root-filename: #Settings: Имя файла Makefile
	@echo "📁 ROOT_DIR_NAME= $(ROOT_DIR_NAME)"