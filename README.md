# flex-and-bison-based-calculator

1. If you want to run this then download flex and bison from GnuWin.
2. After downloading process, install both the software in C:\GnuWin32 path.
3. Set path for flex bison and gcc compiler because flex run with gcc compiler.
4. Now open the cmd where you download this files.
5. Type the comands as given below
   
```bash
  flex lex.l
  bison -dy gram.y
  gcc lex.yy.c y.tab.c -o calc
  calc.exe
  ```

6. It will ask for calculation.
7. Enter your calculation and verify the output...
