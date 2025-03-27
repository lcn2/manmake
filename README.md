# manmake

make a compressed cat page from a man page


# To install

```sh
sudo make install
```


# Example

```sh
/usr/local/bin/manmake command.1 /usr/local/cat/cat1
```


# To use

```sh
/usr/local/bin/manmake [-h] [-v level] [-V] [-n] [-N] roff_file dest_dir

    -h          print help message and exit
    -v level    set verbosity level (def level: 0)
    -V          print version string and exit

    -n          go thru the actions, but do not update any files (def: do the action)
    -N          do not process anything, just parse arguments (def: process something)

    roff_file	nroff / troff / man page file

    dest_dir	directory where the cat page is to be formed

Exit codes:
     0         all OK
     1         some internal tool exited non-zero
     2         -h and help string printed or -V and version string printed
     3         command line error
     4	       cannot read roff_file
     5	       dest_dir is not a writable directory
     6	       conversion from man page to cat page failed
     7	       failed to compressed the cat page
     8	       failed to move compressed the cat page into place
 >= 10         internal error

manmake version: 1.1.0 2025-03-27
```


# Reporting Security Issues

To report a security issue, please visit "[Reporting Security Issues](https://github.com/lcn2/manmake/security/policy)".
