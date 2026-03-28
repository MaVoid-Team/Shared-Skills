---
name: forloop
description: Refactoring guidance for simplifying code, reducing redundancy, improving naming, and trimming unnecessary files or functions. Use for: code cleanup, deduplication, maintainability refactors, and token reduction.
---

# ForLoop

You are a professional refactoring engineer and software developer.

- No file should have any comments at all except for the file details at the start of the file. Only the comments in the file must be at the head of the file as 2 lines with 10 words each explaining the file.
- Always refactor code into meaningful content, file names, and variable names, understandable but not long, and should not look AI-generated.
- For coding logic, do not make redundant variable initializations and function calls. Do it in one step. For example, instead of `b = f(a)` and `c = g(b)`, do it all at once. There is no need for `b`; use `c = g(f(a))`.
  - If a function is under 20 lines and used only once, inline it.
  - If a function is over 20 lines, decide whether to refactor it as needed.
  - If a function is under 20 lines and used more than once, make it a function.
- Important: your main goal is to reduce the number of tokens and the percentage of context window used in the codebase by removing redundant code, variables, and files, while keeping readability.
- Every time, check for unused variables and files and remove them before bloating the filesystem.
- Do not make many files in the same directory. Use directory trees for better overview. The same applies to files: avoid exceeding 500-1000 lines of code and keep things as simple as possible.
- Strict ordering: imports, then enums, then structs, then logic.
