all: sync

sync:
	mkdir -p ~/.zsh
	[ -f ~/.zshrc ] || ln -s $(PWD)/zsh/zshrc ~/.zshrc
	[ -f ~/.zsh/functions ] || ln -s $(PWD)/zsh/functions ~/.zsh/functions
	[ -f ~/.zsh/aliases ] || ln -s $(PWD)/zsh/aliases ~/.zsh/aliases
	[ -f ~/.gitconfig ] || ln -s $(PWD)/gitconfig ~/.gitconfig
	[ -f ~/.tigrc ] || ln -s $(PWD)/tigrc ~/.tigrc

clean:
	rm -f ~/.gitconfig
	rm -f ~/.zsh/functions
	rm -f ~/.zsh/aliases
	rm -f ~/.tigrc

.PHONY: all clean sync