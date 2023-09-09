#!/usr/bin/make
#Varsion Linux/GIT 4.2 14.10.2022 🌍
#https://github.com/OmniaNightmare/markdown/blob/master/main.md
branch := $(shell git branch | grep \* | cut -d ' ' -f2)
Tag="1.0.0"
MAJOR      = $(shell echo $(Tag) | sed "s/^\([0-9]*\).*/\1/")
MINOR      = $(shell echo $(Tag) | sed "s/[0-9]*\.\([0-9]*\).*/\1/")
PATCH      = $(shell echo $(Tag) | sed "s/[0-9]*\.[0-9]*\.\([0-9]*\).*/\1/")
NEXT_TAG =  $(MAJOR).$(MINOR).$(shell echo $(PATCH) | awk -F - '{ print ($$1+1) }')
#-----------------------------------------------------------------------------
define GIT/REPOSITORY/NAME
	git config --get remote.origin.url | sed -e 's/.*\/\([^.]*\)\(\.git\)\{0,1\}/\1/'
endef

define GIT/TAG/Default
	 git describe --tags --exact-match 2>/dev/null || echo "${NEXT_TAG}"
endef

define GIT/COMMITS
	git shortlog | wc -l 2> /dev/null || echo "0"
endef

define GIT/COMMIT/REV
	 git log -n1 --format='%h' 2> /dev/null || echo "GIT_COMMIT_REV"
endef

define GIT/COMMIT/SHA
	 git log -n1 --format='%H' 2> /dev/null || echo "GIT_COMMIT_SHA"
endef

define GIT/ECHO
	echo -e "GIT: \033[32m$(shell echo `$(GIT/REPOSITORY/NAME)`)\033[0m:\033[36m$(shell echo `$(GIT/TAG/Default)`)\033[0m:\033[33m$(shell echo `$(GIT/COMMITS)`)\033[0m"
endef

define GIT/СOMMIT
	echo "♻️ $(shell echo `$(GIT/REPOSITORY/NAME)`)🔖$(shell echo `$(GIT/TAG/Default)`)-$(shell echo `$(GIT/COMMITS)`)"
endef
################################################################################
# 👉                          🌍 git                                       👈 #
################################################################################
help-Git: #Help: Help Git
	@$(MAKE) help.Git
git: #Git: GIT Push
	@$(MAKE) git-status-commits
	@status=$$(git status --porcelain); \
	if [ ! -z "$${status}" ]; \
	then \
		echo "`$(GIT/ECHO)` 🌍 Eсть изменение фиксируем "; \
		echo "`$(GIT/ECHO)` 📄 Add "   && git add .; \
		echo "`$(GIT/ECHO)` 📄 Commit" && git commit -m "`$(GIT/СOMMIT)`"; \
		echo "`$(GIT/ECHO)` 📄 Push ${branch}" && git push origin ${branch}; \
	    echo "`$(GIT/ECHO)` ✅ Exit"; \
	fi
#-----------------------------------------------------------------------------
git-read-commit: #Git: ReadCommit and Push
	@$(MAKE) git-status-commits
	@status=$$(git status --porcelain); \
	if [ ! -z "$${status}" ]; \
	then \
		echo "`$(GIT/ECHO)` 🌍 Eсть изменение фиксируем "; \
		echo "`$(GIT/ECHO)` 📄 Add "   && git add .; \
		read -p "* Set your Commit description message :  " commit_message; \
		if [ ! -z "$${commit_message}" ]; then \
			echo "`$(GIT/ECHO)` 📄 Commit" && git commit -m "♻️ $${commit_message}"; \
		else \
			echo "`$(GIT/ECHO)` 📄 Commit" && git commit -m "`$(GIT/СOMMIT)`"; \
		fi; \
		echo "`$(GIT/ECHO)` 📄 Push ${branch}" && git push origin ${branch}; \
	    echo "`$(GIT/ECHO)` ✅ Exit"; \
	fi
#-----------------------------------------------------------------------------
git-first: #Git: GIT first
	@echo "📄 Add "   && git add .
	@echo "📄 Commit" && git commit -m "first"
	@echo "📄 Push master" && git push origin master
	@echo "✅ Exit"
	@$(MAKE) git-new-push-tag
#-----------------------------------------------------------------------------
git-status-commits: #Git: GIT Status COMMITS
	@echo -e "📒 $(shell echo `$(GIT/REPOSITORY/NAME)`) 🔖 Tag: \033[36m$(shell echo `$(GIT/TAG/Default)`)\033[32m [$(shell echo `$(GIT/COMMITS)`)]\033[33m  $(shell echo `$(GIT/COMMIT/REV)`) \033[0m"
#-----------------------------------------------------------------------------
git-config: #Git: Проверка статуса 
#@git config remote.upstream.puttykeyfile C:\WORD\tmp\instal\putty\git\git.ppk
	@echo "📒 Список всех настроек локальных:" && git config --list --show-origin
################################################################################
# 👉                          🔖 TAG                                     👈 #
################################################################################
git-tag: #Git: GIT list Tag 
	@echo "📒 GIT tag list " && git tag -l
#-----------------------------------------------------------------------------
git-auto-push-tag: #Git: Auto push Tag
	@if [ ! -z "${NEXT_TAG}" ]; then \
		GitDIR="$(abspath $(patsubst %/,%,$(dir $(abspath $(lastword $(MAKEFILE_LIST))))))/Git.mk" ; \
		sed -i -e "s/Tag=\([\'\"]\)[0-9]*\.[0-9]*\.[0-9]*/Tag=\1${NEXT_TAG}/" $${GitDIR}; \
		echo "📒 GIT commit Tag $(NEXT_TAG)" && git tag -a $(NEXT_TAG) -m "Tag: $(NEXT_TAG)" && git push origin --tags; \
		echo "📒 GIT DELETE Tag $(Tag)"      && git tag --delete $(Tag)  && git push --delete origin $(Tag); \
	fi
	@$(MAKE) git
#-----------------------------------------------------------------------------
git-new-push-tag: #Git: New push Tag
	@if [ ! -z "${Tag}" ]; then \
		echo "📒 GIT commit Tag $(Tag)" && git tag -a $(Tag) -m "Tag: $(Tag)" && git push origin --tags; \
	fi
	@$(MAKE) git
#-----------------------------------------------------------------------------
DELETE_TAG = 1.0.0
git-tag-delete:
	@git tag --delete $(DELETE_TAG)
	@git push --delete origin $(DELETE_TAG)
	@git tag -l

################################################################################
# 👉                          🧪 Test                                     👈 #
################################################################################
Git-Debag:
	@echo "GIT DIR         = $(shell git rev-parse --git-dir)"
	@echo "REPOSITORY NAME = `${GIT/REPOSITORY/NAME}`"
	@echo "TAG Default     = `${GIT/TAG/Default}`"
	@echo "GIT COMMITS     = `${GIT/COMMITS}`"
	@echo "GIT COMMIT REV  = `${GIT/COMMIT/REV}`"
	@echo "GIT COMMIT SHA  = `${GIT/COMMIT/SHA}`"
	@echo "GIT ECHO        = `${GIT/ECHO}`"
	@echo "GIT СOMMIT Auto = `${GIT/СOMMIT}`"

Git-log:
	@git log --pretty=oneline
################################################################################
# 👉                          🔑 Key                                       👈 #
################################################################################
ssh-agent:
	ssh-agent -s
	ssh-add  ~/.ssh/id_rsa
id_rsa: ssh-agent
	chmod 400 ~/.ssh/id_rsa
	ssh -T git@github.com