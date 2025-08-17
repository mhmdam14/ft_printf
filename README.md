# ft_printf

ft_printf is a 42 project where I reimplemented the C `printf` function.  
It allows formatted output for strings, numbers, hexadecimal, pointers, and more.  
This project helped me strengthen my skills in variadic functions, parsing, and efficient output handling.

---

## 🛠️ Features

- Handles standard format specifiers: `%c`, `%s`, `%p`, `%d`, `%i`, `%u`, `%x`, `%X`, `%%`  
- Supports printing integers, unsigned integers, hexadecimal, pointers, and characters  
- Robust parsing of format strings  
- Custom implementation using variadic functions  

---

## ⚡ Usage

Clone the repository and run `make` to compile the library:

```bash
git clone https://github.com/mhmdam14/ft_printf.git
cd ft_printf
make
gcc your_code.c -L. -lftprintf -o your_program
./your_program