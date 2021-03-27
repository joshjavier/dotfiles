# josh does dotfiles

Your dotfiles are how you personalize your system. These are mine.

## how it's set up

I follow holman's [topical structure](https://github.com/holman/dotfiles#topical) to keep things organized and use [dotbot](https://github.com/anishathalye/dotbot) to apply the config to my computer.

There are many alternatives for the tooling, but ultimately I chose dotbot because it makes it easy to define how symlinks get created. This means you can do things like use a single file for vim and neovim configs.

## installation

```sh
git clone git@github.com:joshjavier/dotfiles.git ~/.dotfiles
cd ~/.dotfiles
./install
```

## note

This repo is meant for personal use, but feel free to take a peek at my config and copy things that might be useful to you. I'm still pretty much a beginner with git and linux customization, so don't expect much :D

If you have questions or suggestions on how to improve things, please open an issue and I'll gladly hear them out. :)

## futher reading

To learn more about the practice of sharing your dotfiles, I suggest grabbing a cup of your favorite drink and reading the following:

- [Dotfiles Are Meant to Be Forked](https://zachholman.com/2010/08/dotfiles-are-meant-to-be-forked/)

- [Managing Your Dotfiles](https://www.anishathalye.com/2014/08/03/managing-your-dotfiles/)

- [Are dotfiles meant to be forked?](https://jmsbrdy.com/blog/are-dotfiles-meant-to-be-forked/)
