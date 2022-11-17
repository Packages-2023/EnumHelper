#!/usr/bin/make
#Varsion Settings/Windows/dir 1.0 28.04.2022
#--------------------------------  DIR   ----------------------------------
ROOT_DIR := $(shell powershell '(Get-Location).path')
ROOT_DIR_NAME := $(shell powershell '(Get-Item -Path "'$(ROOT_DIR)'").BaseName')
#--------------------------------------------------------------------------------
root-dir: #Settings: Директория файла Makefile
	@echo "📁 ROOT_DIR= $(ROOT_DIR)"
root-filename: #Settings: Имя файла Makefile
	@echo "📁 ROOT_DIR_NAME= $(ROOT_DIR_NAME)"