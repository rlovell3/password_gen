# Linux Password Generator


# Default usage:
```
    ./password_gen.sh
```
# Optional flags:
Use the -l flag to set the number of characters, or length, of the password.
```
    $  ./password_gen.sh -l 35  (sets length of password.  Default=20)
```
Use the -s flag to modify the character-set used to create the password:
```
    $  ./password_gen.sh -s "A" (for all symbols)
    $  ./password_gen.sh -s "N" (for UPPER/lower/numbers)
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
The default password length is 20 characters.

Default characters include both uppercase and lowercase letters, plus numerals 0-9, plus the subset of symbols inside the following braces: { !@+*=#$%& }.  



The -s flag is combined with one of three case selections:

"A":  By default, there are only a few characters allowed in the password generation pool.  Using the -s "A" setting, one gets nearly all of them.

"N": Passing "N" with the -s flag will limit the set of possible characters to uppercase letters, lowercase letters, and the numbers 0-9.

"H":  Passing "H" with the -s flag will cause the password to use the character set of N, but will also add a hyphen after every 4th character.


