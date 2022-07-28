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
    $  ./password_gen.sh -l 30 -H
```
The code defaults to a password length of 20 characters.  

Default characters include both uppercase and lowercase letters, plus numerals 0-9, plus the subset of symbols inside the following braces: { !@+*=#$%& }.  



The -s flag currently only takes one parameter: "A".  By default, there are only a few characters allowed in the password generation pool.  Using the -s "A" setting, one gets nearly all of them.

Additional -s parameters will include an option for zero symbols, and perhaps an ability to list whatever symbols one may want to make available to the character pool.

Anyone studying the code will note a raw implementation of /dev/urandom methodology with precise control over the character set one may wish to use. 

