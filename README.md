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



 The -s flag is combined with one of three case selections:

 "A":  By default, there are only a few characters allowed in the password generation pool.  Use the -s "A" setting, to add many more of them.

 "N": Passing "N" with the -s flag will limit the set of possible characters to uppercase letters, lowercase letters, and the numerals 0-9.

 "H":  Passing "H" with the -s flag will cause the password to use the character set of N, but will also add a hyphen after every 4th character.


