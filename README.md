# Emacs apps

Collection of `emacs-lisp` scripts designed to be ran as standalone app.

## Requirements
It is strongly recommended to use my [emacs.d](https://github.com/Sliim/emacs.d) setup with these scripts. You will also need [Cask](https://github.com/cask/cask) to install following dependencies:
- `helm`
- `alert`
- `jabber`
- `direx`
- `magit`
- `slack`
- `elfeed`
- `twittering-mode`

Install them with: `cask install`.

## Usage
#### dired.el
Start emacs file manager with dired:
```
emacs -Q -l dired.el
```

#### elfeed.el
Configure feeds by defining `elfeed-feeds` in `~/.elfeed.el`:
```
(setq elfeed-feeds
      '("feeds.."
        "..."
        ))
```

Then, start rss reader:
```
emacs -Q -l elfeed.el
```

#### jabber.el
Define jabber accounts in `~/.jabber.el`:
```
(setq jabber-account-list
  '(("foobar@gmail.com/emacs"
     (:account . foobar@gmail.com/emacs)
     (:connection-type . ssl)
     (:password . nil)
     (:port . 5223)
     (:network-server . "talk.google.com"))))
```

Then, start jabber client:
```
emacs -Q -l jabber.el
```

#### magit.el
Start Magit:
```
emacs -Q -l magit.el
```

#### slack.el
Register Slack teams in `~/.slack.el.gpg`:
```
(slack-register-team
 :name "myteam"
 :default t
 :client-id "XXXX.XXXX"
 :client-secret "XXXXXXXXXXXXXXXXX"
 :token "XXX-XXXXXXXX-XXXXXXXXX-XXXXXXXXXXX-XXXXXXXXXXXXXXXXXXXX"
 :subscribed-channels '(emacs))

(slack-register-team
...
```

Then, start slack client:
```
emacs -Q -l slack.el
```

## License
See [COPYING](./COPYING) file.
