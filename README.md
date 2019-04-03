# [HoaiNP](https://github.com/hoaibang07)’s dotfiles

These are the base dotfiles that I start with when I set up a
new environment. For more specific local needs I use the `.local`
files described in the [`Local Settings`](#local-settings) section.

## Table of Contents

* [🔧 Setup](#setup)
* [💄 Customize](#customize)
  * [🔀 Forks](#forks)
  * [🌐 Local Settings](#local-settings)
    * [🐚 `~/.bash.local`](#bashlocal)
    * [🔁 `~/.gitconfig.local`](#gitconfiglocal)
    * [⌨️  `~/.vimrc.local`](#vimrclocal)
* [↕️  Update](#update)
* [📄 License](#license)

## Setup

To set up the `dotfiles` just run the appropriate snippet in the
terminal:

(:warning: **DO NOT** run the `setup` snippet if you do not fully
understand [what it does][setup]. Seriously, **DON'T**!)

| OS | Snippet |
|:---|:---|
| `Ubuntu` | `bash -c "$(wget -qO - https://raw.github.com/hoaibang07/dotfiles/master/src/os/setup.sh)"` |

That's it! :sparkles:

The setup process will:

* Download the dotfiles on your computer (by default it will
  suggest `~/projects/dotfiles`)
* Create some additional [directories][directories]
* [Symlink][symlink] the
  [`git`](src/git),
  [`shell`](src/shell), and
  [`vim`](src/vim) files
* Install applications / command-line tools for
  [`Ubuntu`](src/os/install/ubuntu)
* Set custom
  [`Ubuntu`](src/os/preferences/ubuntu) preferences
* Install [`vim` plugins](src/vim/vim/plugins)


## Customize

### Local Settings

The `dotfiles` can be easily extended to suit additional local
requirements by using the following files:

#### `~/.bash.local`

The `~/.bash.local` file it will be automatically sourced after
all the other [`bash` related files][shell], thus, allowing
its content to add to or overwrite the existing aliases, settings,
PATH, etc.

Here is a very simple example of a `~/.bash.local` file:

```bash
#!/bin/bash

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Set local aliases.

alias starwars="telnet towel.blinkenlights.nl"

# - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - - -

# Set PATH additions.

PATH="$PATH:$HOME/projects/dotfiles/src/bin"

export PATH

```

#### `~/.gitconfig.local`

The `~/.gitconfig.local` file it will be automatically included
after the configurations from `~/.gitconfig`, thus, allowing its
content to overwrite or add to the existing `git` configurations.

__Note:__ Use `~/.gitconfig.local` to store sensitive information
such as the `git` user credentials, e.g.:

```bash
[commit]

    # Sign commits using GPG.
    # https://help.github.com/articles/signing-commits-using-gpg/

    gpgsign = true


[user]

    name = HoaiNP
    email = hoaibang07@example.com
    signingkey = XXXXXXXX
```

#### `~/.vimrc.local`

The `~/.vimrc.local` file it will be automatically sourced after
`~/.vimrc`, thus, allowing its content to add or overwrite the
settings from `~/.vimrc`.

### Forks

If you decide to fork this project, do not forget to substitute
my username with your own in the [`setup` snippets](#setup) and
[in the `setup` script][setup line]

## Update

To update the dotfiles you can either run the [`setup` script][setup]
or, if you want to just update one particular part, run the appropriate
[`os` script](src/os).


## License

The code is available under the [MIT license][license].

<!-- Link labels: -->

[directories]: src/os/create_directories.sh
[dotfiles mathias]: https://github.com/mathiasbynens/dotfiles
[github mathias ]: https://github.com/mathiasbynens
[dotfiles Cătălin]: https://github.com/alrra/dotfiles
[github Cătălin ]: https://github.com/alrra
[license]: LICENSE.txt
[setup]: src/os/setup.sh
[shell]: src/shell
[symlink]: src/os/create_symbolic_links.sh
