help:
	@echo make install - install dotfiles
	@echo make clean   - remove installed files
	@echo
	@echo When running for the first time its recommended to run clean first to remove prior existing files


LOCAL_AFTER_VIM = ~/.local-after.vim
${LOCAL_AFTER_VIM}:
	ln -sfn `pwd`/local-after.vim $@

ZSH_LOCAL = ~/.zsh/local
${ZSH_LOCAL}:
	ln -sfn `pwd`/zsh-local $@

SYSTEM_GITCONFIG = /etc/gitconfig
${SYSTEM_GITCONFIG}:
	sudo ln -sfn `pwd`/system-gitconfig $@

USER_GITCONFIG = ~/.gitconfig
${USER_GITCONFIG}:
	@if grep CHANGE user-gitconfig; then echo EDIT user-gitconfig; false; else ln -svfn `pwd`/user-gitconfig $@; fi

TARGETS := ${LOCAL_AFTER_VIM} ${ZSH_LOCAL} ${SYSTEM_GITCONFIG} ${USER_GITCONFIG}

install: ${TARGETS}

clean:
	sudo rm -f ${SYSTEM_GITCONFIG}
	rm -fv ${TARGETS}
