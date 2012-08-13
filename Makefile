help:
	@echo make install - install dotfiles


LOCAL_AFTER_VIM = ~/.local-after.vim
${LOCAL_AFTER_VIM}:
	ln -sfn `pwd`/local-after.vim $@

ZSH_LOCAL = ~/.zsh/local
${ZSH_LOCAL}:
	ln -sfn `pwd`/zsh-local $@

SYSTEM_GITCONFIG = /etc/gitconfig
${SYSTEM_GITCONFIG}:
	sudo ln -sfn `pwd`/system-gitconfig $@

install: ${LOCAL_AFTER_VIM} ${ZSH_LOCAL} ${SYSTEM_GITCONFIG}