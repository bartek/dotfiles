all: sync

sync:
	mkdir -p ~/.zsh
	mkdir -p ~/.config/kitty

	[ -f ~/.zshrc ] || ln -s $(PWD)/zsh/zshrc ~/.zshrc
	[ -f ~/.zsh/functions ] || ln -s $(PWD)/zsh/functions ~/.zsh/functions
	[ -f ~/.zsh/aliases ] || ln -s $(PWD)/zsh/aliases ~/.zsh/aliases
	[ -f ~/.gitconfig ] || ln -s $(PWD)/gitconfig ~/.gitconfig
	[ -f ~/.tigrc ] || ln -s $(PWD)/tigrc ~/.tigrc
	[ -f ~/.config/kitty/kitty.conf ] || ln -s $(PWD)/kitty/kitty.conf ~/.config/kitty/kitty.conf

clean:
	rm -f ~/.gitconfig
	rm -f ~/.zsh/functions
	rm -f ~/.zsh/aliases
	rm -f ~/.tigrc
	rm -f ~/.config/kitty

.PHONY: all clean sync
