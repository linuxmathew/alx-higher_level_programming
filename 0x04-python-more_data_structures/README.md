13. Weighted average!
    #advanced
    Score: 0.0% (Checks completed: 0.0%)

Write a function that returns the weighted average of all integers tuple (<score>, <weight>)

    Prototype: def weight_average(my_list=[]):
    Returns 0 if the list is empty
    You are not allowed to import any module

guillaume@ubuntu:~/0x04$ cat 100-main.py
#!/usr/bin/python3
weight_average = **import**('100-weight_average').weight_average

my_list = [(1, 2), (2, 1), (3, 10), (4, 2)]

# = ((1 _ 2) + (2 _ 1) + (3 _ 10) + (4 _ 2)) / (2 + 1 + 10 + 2)

result = weight_average(my_list)
print("Average: {:0.2f}".format(result))

guillaume@ubuntu:~/0x04$ ./100-main.py
Average: 2.80
guillaume@ubuntu:~/0x04$

14. Squared by using map
    #advanced
    Score: 0.0% (Checks completed: 0.0%)

Write a function that computes the square value of all integers of a matrix using map

    Prototype: def square_matrix_map(matrix=[]):
    matrix is a 2 dimensional array
    Returns a new matrix:
        Same size as matrix
        Each value should be the square of the value of the input
    Initial matrix should not be modified
    You are not allowed to import any module
    You have to use map
    You are not allowed to use for or while
    Your file should be max 3 lines

guillaume@ubuntu:~/0x04$ cat 101-main.py
#!/usr/bin/python3
square_matrix_map = \
 **import**('101-square_matrix_map').square_matrix_map

matrix = [
[1, 2, 3],
[4, 5, 6],
[7, 8, 9]
]

new_matrix = square_matrix_map(matrix)
print(new_matrix)
print(matrix)

guillaume@ubuntu:~/0x04$ ./101-main.py
[[1, 4, 9], [16, 25, 36], [49, 64, 81]]
[[1, 2, 3], [4, 5, 6], [7, 8, 9]]
guillaume@ubuntu:~/0x04$

15. Delete by value
    #advanced
    Score: 0.0% (Checks completed: 0.0%)

Write a function that deletes keys with a specific value in a dictionary.

    Prototype: def complex_delete(a_dictionary, value):
    If the value doesn’t exist, the dictionary won’t change
    All keys having the searched value have to be deleted
    You are not allowed to import any module

guillaume@ubuntu:~/0x04$ cat 102-main.py
#!/usr/bin/python3
complex_delete = **import**('102-complex_delete').complex_delete
print_sorted_dictionary = \
 **import**('6-print_sorted_dictionary').print_sorted_dictionary

a_dictionary = {'lang': "C", 'track': "Low", 'pref': "C", 'ids': [1, 2, 3]}
new_dict = complex_delete(a_dictionary, 'C')
print_sorted_dictionary(a_dictionary)
print("--")
print_sorted_dictionary(new_dict)

print("--")
print("--")
new_dict = complex_delete(a_dictionary, 'c_is_fun')
print_sorted_dictionary(a_dictionary)
print("--")
print_sorted_dictionary(new_dict)

guillaume@ubuntu:~/0x04$ ./102-main.py
ids: [1, 2, 3]
track: Low
--
ids: [1, 2, 3]
track: Low
--
--
ids: [1, 2, 3]
track: Low
--
ids: [1, 2, 3]
track: Low
guillaume@ubuntu:~/0x04$

16. CPython #1: PyBytesObject
    #advanced
    Score: 0.0% (Checks completed: 0.0%)

Create two C functions that print some basic info about Python lists and Python bytes objects.

Python lists:

    Prototype: void print_python_list(PyObject *p);
    Format: see example

Python bytes:

    Prototype: void print_python_bytes(PyObject *p);
    Format: see example
    Line “first X bytes”: print a maximum of 10 bytes
    If p is not a valid PyBytesObject, print an error message (see example)
    Read /usr/include/python3.4/bytesobject.h

About:

    Python version: 3.4
    Your shared library will be compiled with this command line: gcc -Wall -Werror -Wextra -pedantic -std=c99 -shared -Wl,-soname,libPython.so -o libPython.so -fPIC -I/usr/include/python3.4 103-python.c
    You are not allowed to use the following macros/functions:
        Py_SIZE
        Py_TYPE
        PyList_GetItem
        PyBytes_AS_STRING
        PyBytes_GET_SIZE

julien@ubuntu:~/CPython$ python3 --version
Python 3.4.3
julien@ubuntu:~/CPython$ gcc -Wall -Werror -Wextra -pedantic -std=c99 -shared -Wl,-soname,libPython.so -o libPython.so -fPIC -I/usr/include/python3.4 103-python.c
julien@ubuntu:~/CPython$ cat 103-tests.py
import ctypes

lib = ctypes.CDLL('./libPython.so')
lib.print_python_list.argtypes = [ctypes.py_object]
lib.print_python_bytes.argtypes = [ctypes.py_object]
s = b"Hello"
lib.print_python_bytes(s);
b = b'\xff\xf8\x00\x00\x00\x00\x00\x00';
lib.print_python_bytes(b);
b = b'What does the \'b\' character do in front of a string literal?';
lib.print_python_bytes(b);
l = [b'Hello', b'World']
lib.print_python_list(l)
del l[1]
lib.print_python_list(l)
l = l + [4, 5, 6.0, (9, 8), [9, 8, 1024], b"Holberton", "Betty"]
lib.print_python_list(l)
l = []
lib.print_python_list(l)
l.append(0)
lib.print_python_list(l)
l.append(1)
l.append(2)
l.append(3)
l.append(4)
lib.print_python_list(l)
l.pop()
lib.print_python_list(l)
l = ["Holberton"]
lib.print_python_list(l)
lib.print_python_bytes(l);
julien@ubuntu:~/CPython$ python3 103-tests.py
[.] bytes object info
size: 5
trying string: Hello
first 6 bytes: 48 65 6c 6c 6f 00
[.] bytes object info
size: 8
trying string: �
first 9 bytes: ff f8 00 00 00 00 00 00 00
[.] bytes object info
size: 60
trying string: What does the 'b' character do in front of a string literal?
first 10 bytes: 57 68 61 74 20 64 6f 65 73 20
[*] Python list info
[*] Size of the Python List = 2
[*] Allocated = 2
Element 0: bytes
[.] bytes object info
size: 5
trying string: Hello
first 6 bytes: 48 65 6c 6c 6f 00
Element 1: bytes
[.] bytes object info
size: 5
trying string: World
first 6 bytes: 57 6f 72 6c 64 00
[*] Python list info
[*] Size of the Python List = 1
[*] Allocated = 2
Element 0: bytes
[.] bytes object info
size: 5
trying string: Hello
first 6 bytes: 48 65 6c 6c 6f 00
[*] Python list info
[*] Size of the Python List = 8
[*] Allocated = 8
Element 0: bytes
[.] bytes object info
size: 5
trying string: Hello
first 6 bytes: 48 65 6c 6c 6f 00
Element 1: int
Element 2: int
Element 3: float
Element 4: tuple
Element 5: list
Element 6: bytes
[.] bytes object info
size: 9
trying string: Holberton
first 10 bytes: 48 6f 6c 62 65 72 74 6f 6e 00
Element 7: str
[*] Python list info
[*] Size of the Python List = 0
[*] Allocated = 0
[*] Python list info
[*] Size of the Python List = 1
[*] Allocated = 4
Element 0: int
[*] Python list info
[*] Size of the Python List = 5
[*] Allocated = 8
Element 0: int
Element 1: int
Element 2: int
Element 3: int
Element 4: int
[*] Python list info
[*] Size of the Python List = 4
[*] Allocated = 8
Element 0: int
Element 1: int
Element 2: int
Element 3: int
[*] Python list info
[*] Size of the Python List = 1
[*] Allocated = 1
Element 0: str
[.] bytes object info
[ERROR] Invalid Bytes Object
julien@ubuntu:~/CPython$
