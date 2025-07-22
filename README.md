# 📂 Configuração dos arquivos dotfiles

Este repositório contém as configurações que normalmente uso nos arquivos `dotfiles` e o gerenciamento delas através do [dotbot](https://github.com/anishathalye/dotbot).

## Instalação

Para instalar em uma nova máquina ou após atualizações:

```
# Clonar o repositório
git clone https://github.com/cassiofariasmachado/dotfiles.git ~/.dotfiles

# Acessar a pasta do repo
cd ~/.dotfiles

./install.sh 
# ou 
./install.ps1
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
