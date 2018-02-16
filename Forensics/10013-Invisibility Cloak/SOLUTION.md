#### Solution

Emojis!!

checked out Cloakify

needed each emoji on one line
```
sed -e "s/.\{1\}/&\n/g" < ../invisibilitycloak > ../sedify
```

```
python2 decloakify.py ../sedify ciphers/emoji | xxd | less
```

Noticed JFIF header

```
python2 decloakify.py ../sedify ciphers/emoji > ../flag.jpg
```

uRaw1z4Rd

You're a wizard Harry!
