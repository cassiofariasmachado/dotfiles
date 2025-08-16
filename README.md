# 📂 Configuração dos arquivos dotfiles

Este repositório contém as configurações que normalmente uso nos arquivos `dotfiles` e o gerenciamento delas através do [dotbot](https://github.com/anishathalye/dotbot).

## Instalação

Para instalar em uma nova máquina ou após atualizações:

```bash
# Clonar o repositório
git clone https://github.com/cassiofariasmachado/dotfiles.git ~/.dotfiles

# Acessar a pasta do repo
cd ~/.dotfiles

# Executar script de instalação
./install.sh 
# ou 
./install.ps1

# Crie o arquivo work.gitconfig
touch config/git/work.gitconfig

# Atualize o arquivo com as configurações necessárias para o trabalho,  por exemplo:
# [user]
#   name = Cassio Farias Machado
#   email = email@corp.com
```

Para atualizar uma instalação existente:

```bash
# Acessar a pasta do repo
cd ~/.dotfiles

# Executar pull dos 
git pull

# Executar script de instalação
./install.sh
# ou
./install.ps1
```

## Referências

- [dotfiles](https://github.com/giggio/dotfiles) do [Giovanni Bassi](https://github.com/giggio)
- [Managing dotfiles and ZSH with dotbot and antigen](https://josnun.github.io/posts/managing-dotfiles-and-zsh-with-dotbot-and-antigen)
- [LazyVim: Installation](https://www.lazyvim.org/installation)
