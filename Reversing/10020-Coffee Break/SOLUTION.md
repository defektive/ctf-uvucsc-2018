#### Solution
Using `xxd` i could see all the bytes were swapped around

```
dd if=broken.png of=unbroken.png conv=swab
```
