### Setup to edit locally:

Might need to [set up SSH]("https://help.github.com/articles/connecting-to-github-with-ssh/")

```shell
mkdir ~/.configs
cd ~/.configs
git init
git remote add origin git@github.com:schrectacular/.configs.git
git pull origin master
```

### Set default shell:
```shell
chsh -s /bin/zsh
```

### Optional:
Install [prezto](https://github.com/sorin-ionescu/prezto)
Install oh-my-zsh:
curl -L https://github.com/robbyrussell/oh-my-zsh/raw/master/tools/install.sh | sh
