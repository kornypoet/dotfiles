### Setup Assistant

Make sure to choose a *defining* shortname: when prompted to choose a username for the many internal accounts Infochimps requires, having the same user across all accounts greatly speeds up productivity. Keep is short, and identifiably you. `joe` might not be enough but `jkelly` could work. Keep it lowercase and alphanumeric.

### Change Hostname

At work, the most recognizable feature of your workstation is your network hostname. Take a minute to create one for your new computer. It should be memorable to you and distinguishable as *your* computer and not another remote machine. Get creative, choose something epic, or ironic, whatever you do, just don't leave is `Joe's MacBook Pro`. Very UN-pro. Open up Terminal.app and type in your new hostname:

```
$ sudo scutil --set HostName <awesome_name_here>
```

### System Preferences

#### Trackpad

I like Tap to click to be activated
Turn off Scroll Direction: natural. I don't like the joystick scroll.

#### Dock

Maximize your screen space
Position on screen: left
Automatically hide and show the dock

#### Desktop

Set some pictures for your desktop

#### Keyboard

I am an emacs user, and the control key is the most important. Let's move it closer.
Modifier Keys: Caps Lock -> ^ Control

Shortcuts: Add two shortcuts to Terminal.app (deep in the application menu)

* Show Next Tab CTRL + TBA
* Show Previous Tab CTRL + SHIFT + TAB

Now Terminal moves between tabs just like Chrome and others.

Change Mission control Move left and right space to meta <- and meta ->

#### Battery

I like to see the percentage here

#### Apps you will need

Google Chrome
Spotify
Hipchat
From App Store : Caffeine
XQuartz (for things that require X11)

#### Mail

Add in mail accounts

### Finder

Remove unnecessary icons in finder

### Terminal

Install Xcode

### Link computer to github

```
ssh-keygen
```

Add to github SSH keys

```
cat ~/.ssh/id_rsa.pub | pbcopy
```
Title
<hostname_of_computer>

Install solarized color scheme
```
git clone git@github.com:tomislav/osx-terminal.app-colors-solarized.git
```

Double click on each, set one as default.
Set font to menlo 18

change default shell

`chsh -s /bin/zsh`

Install Homebrew

`ruby -e "$(curl -fsSL https://raw.github.com/mxcl/homebrew/go/install)"`

Install rbenv & ruby-build

`brew install rbenv ruby-build`

Install tree wget jsonpp htop s3cmd

`brew install tree wget jsonpp htop s3cmd`

Install emacs

`brew install emacs --cocoa --srgb --with-x`

Make it a mac application

`brew linkapps`

No audible or visual bell

under keyboard, check use option as meta key (for emacs)

#### ruby

mavericks comes with ruby 2.0

our ubuntu machines use 1.9.3-p448; install this too

`rbenv install 1.9.3-p448`

Set it to be the global version. You can switch back and forth between the two.

`rbenv global 1.9.3-p448`

Install dotfiles

To full screen an app in mavericks CMD + CTRL + F

git osxeychain helper

`gem install bundler`

install inconsolata font
install steam, skype
csshx doesn't seem to work really well with mavericks
