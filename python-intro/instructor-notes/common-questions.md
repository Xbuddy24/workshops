---
layout: default
title: Common Questions
workshop: Python Coding Introduction
section: Instructor Notes
---

# Python Coding Introduction Common Questions

Keep answers simple first. Add detail only if a student asks for more. \
Encourage curiosity and normalize not knowing everything.

## **"What's the difference between Python and JavaScript?"**

They're both great programming languages! JavaScript is mainly for web browsers and websites. Python is great for science, data, AI, and general-purpose programming. Many programmers learn both!

*If they want more*: JavaScript runs in browsers natively; Python needs to be installed separately. Python is often considered easier to read. Both can be used for web development, but in different ways.

## **"Why is it called Python?"**

Not because of the snake! The creator, Guido van Rossum, named it after the comedy show "Monty Python's Flying Circus." Python programmers love fun and humor!

*If they want more*: Guido created Python in 1991. He wanted a language that was fun to use and easy to read.

## **"Why don't we need let or const like in JavaScript?"**

Python is simpler here - you just pick a name and assign a value with `=`. Python figures out the type automatically. No keywords needed!

*If they want more*: Python uses "dynamic typing" - it determines the variable type from the value you assign. JavaScript's `let` and `const` control whether a variable can be reassigned; Python doesn't have this distinction built into the syntax.

## **"What's the difference between = and ==?"**

`=` assigns a value: `name = "Alex"` puts "Alex" into the variable name. `==` checks if two things are equal: `name == "Alex"` asks "is name equal to Alex?" and gives you True or False.

*If they want more*: `=` is the "assignment operator" and `==` is the "comparison operator." Using `=` in an if statement is a common mistake - Python will usually catch it with an error.

## **"Why does indentation matter in Python?"**

Python uses indentation (spaces at the start of a line) to know which code belongs together. It's like outlining a paper - the indented lines "belong to" the line above them.

*If they want more*: Most languages use curly braces `{}` to group code. Python uses indentation instead, which forces clean, readable code. Use 4 spaces (or one Tab press in VS Code).

## **"Why do I get 'IndentationError'?"**

Your spaces aren't consistent. Make sure all code inside an if/else block has the same number of spaces. VS Code helps by auto-indenting when you press Enter after a colon.

*If they want more*: Mixing tabs and spaces can cause this too. VS Code can be configured to always use spaces (it usually does by default). Check the bottom status bar - it should say "Spaces: 4."

## **"Why does input() always give me a string?"**

`input()` reads what the user types as text, even if they type a number. The character "1" and "3" together make the text "13", not the number 13. Use `int()` to convert: `age = int(input("Age? "))`.

*If they want more*: This is a safety feature - Python doesn't want to guess what type you want. `int()` converts to whole numbers, `float()` to decimals. If the user types letters and you use `int()`, you'll get a ValueError.

## **"What does 'f' mean in f-strings?"**

The `f` stands for "formatted." It tells Python: "look inside this string for `{}` and replace them with variable values." Without the `f`, Python prints the curly braces literally.

*If they want more*: f-strings were added in Python 3.6. Before that, people used `.format()` or `%` for string formatting. f-strings are the modern, preferred way.

## **"What's the difference between print() and input()?"**

`print()` sends information OUT to the screen. `input()` brings information IN from the user. Think of print as the computer talking, and input as the computer listening.

*If they want more*: `print()` can display any data type. `input()` always returns a string. You can combine them: `name = input("Name? ")` prints "Name? " and then waits for input.

## **"How do I fix 'python: command not found'?"**

Python isn't installed or isn't in your PATH. Try `python3` instead (common on Mac/Linux). If that doesn't work, run the setup guide or verify installation with an instructor.

*If they want more*: On Windows, you might need to check "Add Python to PATH" during installation. On Mac/Linux, Python 3 is often accessed as `python3` rather than `python`.

## **"Why do I get 'SyntaxError: invalid syntax'?"**

Usually a missing colon after `if` or `else`, a missing quote, or a typo. Check that:
- `if` and `else` lines end with `:`
- All strings have matching quotes at both ends
- Parentheses are closed: `print("hello")`

Read the error carefully - it tells you the line number!

*If they want more*: The arrow `^` in the error message points to where Python got confused. The actual mistake might be on that line or the line above it.

## **"Can I use elif for more choices?"**

Yes! `elif` (short for "else if") lets you check multiple conditions:
```python
choice = input("Left, right, or straight? ")
if choice == "left":
    print("You found gold!")
elif choice == "right":
    print("You found a dragon!")
else:
    print("You found a village!")
```

*If they want more*: You can have as many `elif` blocks as you want, but only one `if` at the start and optionally one `else` at the end.

## **"Why doesn't my if statement work even though I typed the right word?"**

Capitalization matters! If you check `if choice == "left"` but the user types "Left" or "LEFT", it won't match. You can fix this with `.lower()`:
```python
choice = input("Left or right? ").lower()
```

*If they want more*: `.lower()` converts text to all lowercase. `.upper()` converts to all uppercase. This is a common technique for handling user input.

## **"Can I make the adventure loop back to the beginning?"**

Yes, but we'll cover loops properly next workshop! For now, focus on building a fun story with if/else. If you're curious:
```python
while True:
    choice = input("Play again? ")
    if choice == "no":
        break
```

*If they want more*: `while True` creates an infinite loop. `break` exits the loop. We'll learn all about loops in the Advanced Python workshop!

## **"Why doesn't my code do anything when I run it?"**

Make sure you have `print()` statements. Variables by themselves don't display anything. Also check that you saved the file before running it.

*If they want more*: In the Python REPL (interactive mode), typing a variable name shows its value. In a `.py` file, you must use `print()` to see output.

## **"What are those # lines in the code?"**

Those are comments - notes for humans that Python ignores. They explain what the code does. The `#` symbol tells Python to skip the rest of that line.

*If they want more*: Comments are essential for code readability. You can comment out code temporarily to test things. Good comments explain "why," not "what."

## Teaching Notes for Instructors

**Keep the tone curious and encouraging**. When a student asks "Can I...?" the answer is almost always "Yes! Let's figure out how" even if it's beyond today's scope.

**Read error messages together**. Don't just fix it - show them how to interpret what Python is telling them.

**"I don't know, let's try it!"** is a great response. Experimentation builds confidence.

**Normalize not knowing everything**. "That's a great question - I had to look that up myself recently!"
