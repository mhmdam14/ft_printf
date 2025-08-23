# ft_printf

A custom implementation of the `printf` function in C, created as part of the 42 school curriculum. This project demonstrates advanced C programming concepts including variadic functions, memory management, and system calls.

## 📋 Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Supported Format Specifiers](#supported-format-specifiers)
- [Installation](#installation)
- [Usage](#usage)
- [Examples](#examples)
- [Project Structure](#project-structure)
- [Functions](#functions)
- [Testing](#testing)
- [Contributing](#contributing)

## 🎯 Overview

`ft_printf` is a custom implementation of the standard C library function `printf`. It supports various format specifiers and handles edge cases like null pointers and special values. The function returns the number of characters printed, just like the original `printf`.

## ✨ Features

- **Variadic Functions**: Uses `va_list`, `va_start`, `va_arg`, and `va_end` for handling variable arguments
- **Multiple Format Specifiers**: Supports `%c`, `%s`, `%d`, `%i`, `%u`, `%x`, `%X`, `%p`, and `%%`
- **Error Handling**: Gracefully handles null pointers and edge cases
- **Memory Efficient**: Uses system calls directly for output
- **Standard Compliant**: Returns the correct number of characters printed

## 🔧 Supported Format Specifiers

| Specifier | Type | Description | Example |
|-----------|------|-------------|---------|
| `%c` | char | Single character | `ft_printf("%c", 'A')` |
| `%s` | char* | String | `ft_printf("%s", "Hello")` |
| `%d` | int | Signed decimal integer | `ft_printf("%d", 42)` |
| `%i` | int | Signed decimal integer | `ft_printf("%i", -42)` |
| `%u` | unsigned int | Unsigned decimal integer | `ft_printf("%u", 123)` |
| `%x` | unsigned int | Hexadecimal (lowercase) | `ft_printf("%x", 255)` |
| `%X` | unsigned int | Hexadecimal (uppercase) | `ft_printf("%X", 255)` |
| `%p` | void* | Pointer address | `ft_printf("%p", &var)` |
| `%%` | - | Percent sign | `ft_printf("%%")` |

## 🚀 Installation

1. Clone the repository:
```bash
git clone https://github.com/yourusername/ft_printf.git
cd ft_printf
```

2. Compile the library:
```bash
make
```

This will create `libftprintf.a`, a static library containing the `ft_printf` function.

## 💻 Usage

### Basic Usage

```c
#include "ft_printf.h"

int main(void)
{
    ft_printf("Hello, %s!\n", "World");
    ft_printf("Number: %d\n", 42);
    ft_printf("Character: %c\n", 'A');
    
    return (0);
}
```

### Compiling with the Library

```bash
# Compile your program with the library
gcc -o my_program my_program.c libftprintf.a

# Or use the library in other projects
gcc -o my_program my_program.c -L. -lftprintf
```

## 📝 Examples

### String and Character Output
```c
ft_printf("String: %s\n", "Hello, World!");  // Output: String: Hello, World!
ft_printf("Character: %c\n", 'A');           // Output: Character: A
ft_printf("Null string: %s\n", NULL);        // Output: Null string: (null)
```

### Integer Output
```c
ft_printf("Positive: %d\n", 42);             // Output: Positive: 42
ft_printf("Negative: %d\n", -42);            // Output: Negative: -42
ft_printf("Zero: %d\n", 0);                  // Output: Zero: 0
ft_printf("Max int: %d\n", 2147483647);      // Output: Max int: 2147483647
```

### Unsigned and Hexadecimal
```c
ft_printf("Unsigned: %u\n", 123);            // Output: Unsigned: 123
ft_printf("Hex (lower): %x\n", 255);         // Output: Hex (lower): ff
ft_printf("Hex (upper): %X\n", 255);         // Output: Hex (upper): FF
```

### Pointer Addresses
```c
int var = 42;
ft_printf("Address: %p\n", &var);            // Output: Address: 0x7fff5fbff8ac
ft_printf("Null ptr: %p\n", NULL);           // Output: Null ptr: (nil)
```

### Multiple Format Specifiers
```c
ft_printf("Multiple: %s, %d, %c, %x\n", "test", 42, 'A', 255);
// Output: Multiple: test, 42, A, ff
```

### Percent Sign
```c
ft_printf("Discount: 20%%\n");                // Output: Discount: 20%
```

## 📁 Project Structure

```
ft_printf/
├── ft_printf.c      # Main printf implementation
├── ft_printf.h      # Header file with function declarations
├── helper.c         # Helper functions for specific format specifiers
├── Makefile         # Build configuration
├── test_printf.c    # Test program (optional)
└── README.md        # This file
```

## 🔧 Functions

### Main Function
- **`ft_printf(const char *format, ...)`**: Main printf function that processes format strings and arguments

### Helper Functions
- **`ft_putchar(char c)`**: Prints a single character and returns 1
- **`ft_putstr(char *str)`**: Prints a string and returns the number of characters printed
- **`ft_putnbr(int n)`**: Prints a signed integer and returns the number of characters printed
- **`ft_putnbr_unsigned(unsigned int n)`**: Prints an unsigned integer and returns the number of characters printed
- **`ft_printhex(unsigned int nb, int uppercase)`**: Prints a number in hexadecimal format
- **`ft_printhex_long(unsigned long nb)`**: Prints a long number in hexadecimal format
- **`ft_printaddress(void *address)`**: Prints a pointer address in hexadecimal format
- **`ft_printf_helper(const char **format, va_list args)`**: Helper function that processes format specifiers

## 🧪 Testing

The project includes a test program (`test_printf.c`) that demonstrates all supported format specifiers:

```bash
# Compile and run the test
make
gcc -o test test_printf.c libftprintf.a
./test
```

### Expected Test Output
```
=== ft_printf Test Results ===

1. String: String: Hello, World!
2. Character: Character: A
3. Integer (d): Integer (d): 42
4. Integer (i): Integer (i): 42
5. Unsigned integer: Unsigned integer: 123
6. Hexadecimal (lowercase): Hexadecimal (lowercase): 2a
7. Hexadecimal (uppercase): Hexadecimal (uppercase): 2A
8. Pointer address: Pointer address: 0x7fff5fbff8ac
9. Percent sign: Percent sign: %
10. Multiple formats: Multiple formats: Hello, World!, 42, A, 2a
11. Null string: Null string: (null)
12. Null pointer: Null pointer: (nil)
13. Negative number: Negative number: -42
14. Large number: Large number: 2147483647
15. Zero: Zero: 0
```

## 🔍 Key Implementation Details

### Variadic Functions
The implementation uses C's variadic function mechanism:
- `va_list`: Type for iterating through variable arguments
- `va_start`: Initializes the argument list
- `va_arg`: Retrieves the next argument
- `va_end`: Cleans up the argument list

### System Calls
The function uses the `write` system call directly for output, making it efficient and avoiding buffering issues.

### Error Handling
- Null strings are handled by printing `"(null)"`
- Null pointers are handled by printing `"(nil)"`
- The function handles the special case of `INT_MIN` (-2147483648)

### Recursive Implementation
Some functions (like `ft_putnbr` and `ft_printhex`) use recursion to handle number conversion, making the code clean and readable.

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch (`git checkout -b feature/amazing-feature`)
3. Commit your changes (`git commit -m 'Add some amazing feature'`)
4. Push to the branch (`git push origin feature/amazing-feature`)
5. Open a Pull Request

## 👨‍💻 Author

**mal-moha** - [GitHub Profile](https://github.com/mhmdam14)

Created as part of the 42 school curriculum to demonstrate mastery of:
- C programming fundamentals
- Variadic functions
- System calls
- Memory management
- Code organization and documentation
