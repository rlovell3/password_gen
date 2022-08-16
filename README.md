# Linux Password Generator


## Default usage:

```
    ./password_gen.sh
```
  The default password length will be 20 characters. 
  The default character set used for password generation includes  A-Z, a-z, numerals 0-9, and these symbols:    !@+*=#$%&

## Optional flags:
  Use the -l flag to set the number of characters, or length, of the password.
```
    $  ./password_gen.sh -l35  (Sets length of password to 35 characters.)
```
  Use the -s flag to modify the character-set used to create the password:
```
    $  ./password_gen.sh -s"A" (for *almost* all symbols)
    $  ./password_gen.sh -s"N" (for UPPERCASE:A-Z  lowercase:a-z   numerals: 0-9)
    $  ./password_gen.sh -s"H" (like "N" but with hyphens every 4 characters)
```
Note that you may add whitespace between the flag and the parameter like this:
```
    $  ./password_gen.sh -s "A"
```
## Combine Flags:
  Create password of length 40 plus use all symbols:
```
    $  ./password_gen.sh -l 40 -s "A"
```
  Create password of length 30 plus add hyphens
```
    $  ./password_gen.sh -l 30 -s "H"
```
  Create password of length 25 plus only use letters and numbers:
```
    $  ./password_gen.sh -l 25 -s "N"
```

## Installation:
  Simply copy file password_gen.sh to your machine.  Chmod u+x the script so that it is executable, then use the example commands above. Make sure you are in the same directory when you type the command.


## Summary Notes:
 The -s flag is combined with one of three case selections {A,N,H}:

  -s"A":  By default, there are only a few characters allowed in the password generation pool.  Use the -s"A" setting, to add many more of them.

  -s"N": Limits the set of possible characters to uppercase letters, lowercase letters, and the numerals 0-9.

  -s"H":  Use the character set of N, but add a hyphen after every 4th character.

You may put whitespace between the -s flag and the subsequent case selector. Both ways work.

## Extra notes about the clipboard:
In Linux, when you copy a string, it will stay in the clipboard buffer until you copy something new. So... after you copy/paste one of these strong passwords, make sure you copy something (anything) else.  Even a single letter of something will work.

If you prefer to let your shell do the work for you, install this tool:  xsel
```
  sudo apt install xsel
```
  then:
```
  xsel -bc
```
Unfortunately, even this still will leave a trace of your password in a temp shell variable.  For example, even after clearing your clipboard with this xsel -bc command, if you press the "Shift" + "Insert" keys, it will paste what you just had in the clipboard EVEN THOUGH YOU THOUGHT IT WAS CLEARED OUT. That is because SHIFT+INS is actually pulling a copy from a shell variable rather than the clipboard.

To tidy up this remaining loose end, use another neat Linux tool: xclip
```
  sudo apt install xclip
```
  then:
```
  uptime | xclip
```

The "uptime | xclip" trick will simply copy your uptime into that shell variable, overwriting that trace of your password.

I created the shell alias "clipclr" to handle my clean-up action:
 add this to your .bashrc or .zshrc (or even better, add it to your .oh-my-zsh/custom/example.zsh): 
```
alias clipclr="xsel -cd && uptime | xclip"
```
## The whole enchilada:
1. In terminal, create a password, or several.
2. Select the password of your choice and copy/paste into a text file. 
3. clipclr if you created the alias.
4. gpg --encrypt that file. 
5. srm the residual text file once you have an encrypted version of it.
```
sudo apt install secure-delete
man srm
srm file-to-delete
```
### Changelog
2022-08-06 all files adding signature to commit
