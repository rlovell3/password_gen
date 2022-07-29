# Linux Password Generator


# Default usage:
  If neither the -l or the -s flags are passed, the default password length will be 20 characters, and the default character set used for password generation includes  A-Z, a-z, and 0-9.  It also includes these symbols:  !@+*=#$%&

```
    ./password_gen.sh
```
# Optional flags:
  Use the -l flag to set the number of characters, or length, of the password.
```
    $  ./password_gen.sh -l 35  (Sets length of password to 35 characters.)
```
  Use the -s flag to modify the character-set used to create the password:
```
    $  ./password_gen.sh -s "A" (for *almost* all symbols)
    $  ./password_gen.sh -s "N" (for UPPERCASE:A-Z  lowercase:a-z   numerals: 0-9)
    $  ./password_gen.sh -s "H" (like "N" but with hyphens every 4 characters)
```
# Combine Flags:
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

# Installation:
  Simply copy file password_gen.sh to your machine.  I keep mine in my home directory. Chmod u+x the script so that it is executable, then use the example commands above.


## Notes:
 The -s flag is combined with one of three case selections {A,N,H}:

  -s"A":  By default, there are only a few characters allowed in the password generation pool.  Use the -s"A" setting, to add many more of them.

  -s"N": Limits the set of possible characters to uppercase letters, lowercase letters, and the numerals 0-9.

  -s"H":  Use the character set of N, but add a hyphen after every 4th character.

You may put whitespace between the -s flag and the subsequent case selector. Both ways work.

## Notes about the clipboard:
In Linux, when you copy a string, it will stay in the clipboard buffer until you copy something new. So... after you copy/paste one of these strong passwords, make sure you copy something (anything) else.  Even a single letter of something will work.

If you prefer to let your shell do the work for you, install this tool:  xsel
```
  sudo apt install xsel
```
  then:
```
  xsel -bc
```
Unfortunately, this will leave a trace of your password in a temp shell variable.  For example, if you copy something and then use "Shift key" + "Insert key", it will paste what you just had in the clipboard EVEN THOUGH YOU THOUGHT IT WAS CLEARED OUT.

To tidy up this loose end, use another neat Linux tool: xclip
```
  sudo apt install xclip
```
  then:
```
  uptime | xclip
```

The "uptime | xclip" trick will simply copy your uptime into that shell variable, and erase that trace of your password.  I am not certain, but I am about to experiment a bit to see if I can find other variables where that valuable password might still be vulnerable.

I will leave it up to the user to figure out how to combine those two commands, and then store them as an "alias" in your shell to make quick work of copy/paste leaks.
