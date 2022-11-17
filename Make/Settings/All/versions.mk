#!/usr/bin/make
#Varsion Settings/All/versions 4.0 26.08.2022 ⚙️
#----------------------  versions   --------------------------
versions: #Settings: Version Packages Makefile
	@echo -e "📁 $(ROOT_DIR)";
	@for f in $(MAKEFILE_LIST); do \
		grep -E '^#Varsion .*$$' $$f| awk ' \
		BEGIN \
			{FS = " "}; \
			{ printf "*    \033[36m%-30s", $$2}; \
			{ printf "🔖 %-10s", $$3}; \
			{ printf "\033[32m%-12s", $$4}; \
			{ printf "%s", $$5}; \
			{ print "\033[0m"}; \
			'; \
	done


