#!/usr/bin/make
#Varsion Linux/Composer 1.1 18.10.2022 🐘
################################################################################
# 👉                         🐘 Composer                                  👈 #
################################################################################
help-Composer-update: #Help: Команды Composer
	@$(MAKE) help.Composer
composer-update-dev: #Composer: 🐘 Composer-update-dev Packages-mezzio-doctrine
	@composer update
composer-update: #Composer: 🐘 Composer-update-auth
	@composer update --no-dev
composer-show-platform:  #Composer: 🐘 Composer platform
	@composer show --platform
composer-outdated: #Composer: 🐘 Composer up list
	@composer outdated --all
composer-validate: #Composer: 🐘 Composer validate
	@composer validate --no-interaction