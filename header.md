
This project aims to develop a simple, concise and robust language for making
bi-dimensional data tables.

# ITML Language Specification

*(this is pre-alpha and is currently in development)*

## Introduction: Why, and how?

We are trying to follow the steps of simple languages like markdown and toml,
which simply do their job well done and nothing else.

It is a simple and legible language, easy to learn, and writing with it goes
in the natural process of writing text in a text editor: no more in drawing
tables having to adjust the table columns when more text is added. In ITML you
simply state the format and state the cols in the first line, and the each
subsequent line or lines, if we use indentation in an entry, or paragraphs if
we use space between indented text of the same cell, will be the contents of a
table cell.
