
## The Table Header

The first line of the stream contains the string `itbl` and the names of all
columns of the table, using shell-like escape, like this:

```
itbl "Column 1" Column\ 2 Column3
```

There will be three columns in this description. "Column 1" "Column 2" and
"Column". The backslash in 'Column 2' is used to escape espaces, so they don't
get splitted but are partes of the same argument. As seen in 'Column 1', the
quotation marks also can be used to escape spaces inside a column name, very
like in a command line shell.

If more space is needed, so to not break the max line width of 79 chars we can
continue the header after one or more an idented newlines. Like this

```
itbl "This is the name of the first column" "This is the name of the third
    column" "And this indented line let us span our table heading definition
    for as much lines as we need"
```

The above signature creates a table with three columns.

## The Table Body

After the header, each new line with indentation 0 (not indented) will be
treated as table cell.

If the line needs to be broken in various lines, the line continuation will be
syntatically representing by adding indentation to the broken lines, this is,
by adding spaces before the characters in the new broken lines. The amount of
spaces if not actually enforced, but it is enforced that multiple indented
lines have the same amount of spaces than the indented line before. Example:

```
itbl COLUMN1 COLUMN2 COLUMN3  # then we have 3 columns

This is the first column of the table, and we will break this line and indent,
    it, so that we dont break our formatting rule of not trespassing the number
    of 79 characters per line. See how the multiple lines indented have the
    same indentation: this is an enforced rule. If the number of spaces differ
    from one to other, it is a bug and the itml file should not pass the
    preprocessing phase.
This is a cell in the second column. Now we are going to show that we do not
  need to have the same indentation as before, but we SHOULD always use the
  same indentation. This is not enforced for the time being, but we should 
  attain to some standards for formatting our itml files. We are thinking if we
  should use 2 or 4 spaces. Very probably we will stick with 4 spaces, as
  any modern text editor is capable of shifting a tab for 4 spaces and then
  automatically keep the indentation on the following lines, and 4 spaces
  improve readability of the itbl source.
And this is a cell in the third column.
```

## Comments

Comments inside the `itbl` file are added with the character `#`. This can be
made in empty lines or after text.

Comment lines and inline comments are removed from the data at preprocessing
time, so they don't get to the itml processor.

## Formatting rules

One of the caracteristics which we have in mind as we develop the ITML-lang is
readability from the very `itbl` source.

SO, we will try to attain to best practices in writing the source so that we
respect some rules, even these rules not being enforced by the ITML
specification.

Some of these rules we are borrowing from the Python language, which uses
indentation syntatically as well and have being proven to be good through the
time and use.

### Max character width

The ITBL format lines should have the maximum of 79 characters per line.
Additional characters should be broken to the next line and indented.

### 4 spaces indentation without tabs

The ITBL format indentation should not use TAB, and should be indented with
2 or 4 spaces, concisely. After pre-alpha we will see which case is better and
change this documentation with the urging to use 2 or 4 spaces, which be
better.

### Empty line after n-columns cells

The lines representing the cells of one row in the ITML format should have an
empty line after the number of columns. Simple like this:

```
itbl COLUMN1 COLUMN2 COLUMN3  # then we have 3 columns

This text is the first column. 
This text is the second column. 
This text is the third column.

After the newline, this is the first column of the second row.
And this is the second column of the second row.
And this is the last(3rd) column of the second row.
```

As seen above, after the three columns of the first row we add a blank line to
improve readability of the source. The newline has no syntatic meaning, as we
are all consenting adults here, but it should be used to improve readability.

The inline comments in ITML format, this is, the comments made after a line of
text should have too espaces before the `#` character.

This project aims to develop a simple, concise and robust language for making
bi-dimensional data tables

[https://github.com.iacchus/iacchus-table-language](https://github.com.iacchus/iacchus-table-language)

## Our proof-of-concept implementation in python

We are currently in pre alpha.

**preprocessor** - parses input data and check for error in language

**procesor** - formats preprocessed data in turns of creating a sanitized
data base to be used by

**postprocessor** - which transform processed data in other media, like html,
markdown, unicode etc. Each of these formats should have it's own postprocess,
depending on with type of output we desire.

