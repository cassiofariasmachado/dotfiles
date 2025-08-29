# 📂 Dotfiles Configuration

This repository contains the configurations I usually use in my `dotfiles` (aka. config files that start with a dot) and their management through [dotbot](https://github.com/anishathalye/dotbot).

## Installation

To install:

1. Clone the repository:
    ```bash
    git clone https://github.com/cassiofariasmachado/dotfiles.git
    ```

2. Go to the repo folder:

    ```bash
    cd dotfiles
    ```

3. (Optional) Add work configuration: 

    3.1. Create the `work.gitconfig` file:
    ```
    touch config/git/work.gitconfig
    ```

    3.2. Update the file with the required work configuration, for example:

    ```txt
    [user]
      name = Cassio Farias Machado
      email = email@corp.com
    ```

4. Run the installation script:

    ```bash
    ./install.sh 
    # or 
    ./install.ps1
    ```

## Update

To update:

1. Go to the repo folder
2. Pull the latest changes
3. Run the installation script:

    ```bash
    ./install.sh
    # or
    ./install.ps1
    ```

## References

- [dotfiles](https://github.com/giggio/dotfiles) by [Giovanni Bassi](https://github.com/giggio)  
- [Managing dotfiles and ZSH with dotbot and antigen](https://josnun.github.io/posts/managing-dotfiles-and-zsh-with-dotbot-and-antigen)  
- [LazyVim: Installation](https://www.lazyvim.org/installation)
