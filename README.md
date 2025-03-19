<img src='./logo.png' style='display: block; width: 100px; height: 100px; border-radious: 10%; margin: 0 0 10px 0 '>

# Homebrew - Shortcut

Homebrew formula for [Shortcut](https://github.com/babilonczyk/shortcut)

---

TLTR: Shortcut - record, save & execute your most used scripts in the terminal.

## Install with homebrew:

```console
brew tap babilonczyk/shortcut

brew install --build-from-source --verbose --debug shortcut
```

## Bumping version of the formula

1. Make sure [shortcut](https://github.com/babilonczyk/shortcut) got released
2. Download latest **Source code (tar.gz)** file
3. Get sha256 for it. Example:

```
shasum -a 256 shortcut-1.0.0.tar.gz
```

4. Update **Formula/shortcut.rb** url and sha256
