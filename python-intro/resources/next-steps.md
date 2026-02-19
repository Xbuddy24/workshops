---
layout: default
title: Next Steps
workshop: Python Coding Introduction
section: Resources
---

# Next Steps After Python Coding Introduction

## Practice at Home

- **Expand your adventure**: Add more choices, more branches, and more story
- **Experiment with data types**: Mix strings, numbers, and booleans in creative ways
- **Use math operators**: Add scores, count items, calculate things
- **Try the Python REPL**: Type `python` (no filename) to experiment with Python interactively
- **Add more input() calls**: Make your programs ask multiple questions

## Get Ready for Advanced Python Coding (Workshop #6)

- **Visit the new workshop page** when it's available
- **Practice if/elif/else**: The more comfortable you are with decisions, the better
- **Think about repetition**: What actions in your adventure repeat? Loops will automate that!
- **Think about collections**: What if you could store a list of items? That's coming next!
- **Review your variables**: You'll be using them with loops and lists!

## Explore More (If Curious)

- [Python.org Beginner's Guide](https://wiki.python.org/moin/BeginnersGuide): Official getting started resources
- [FreeCodeCamp Python](https://www.freecodecamp.org/learn/scientific-computing-with-python/): Free interactive tutorials
- [Automate the Boring Stuff with Python](https://automatetheboringstuff.com/): Free online book, great for practical projects
- [Real Python Tutorials](https://realpython.com/): Well-written guides for all levels

## Keep It Safe and Fun

- **Save your work regularly**: Use `git add .` and `git commit -m "description"`
- **Experiment freely**: You can't break your computer with Python!
- **Read error messages**: They're your friends - they tell you exactly what's wrong
- **Celebrate small wins**: Every working line of code is an achievement

## Challenges to Try

### Challenge 1: Quiz Game
Create a quiz that asks questions and tracks the player's score:
```python
score = 0
answer = input("What planet is closest to the sun? ")
if answer.lower() == "mercury":
    print("Correct!")
    score = score + 1
else:
    print("Not quite - it's Mercury!")
print(f"Your score: {score}")
```

### Challenge 2: Character Creator
Build a detailed character profile by asking lots of questions:
```python
name = input("Character name: ")
role = input("Warrior, mage, or thief? ")
print(f"\n=== Character Sheet ===")
print(f"Name: {name}")
print(f"Class: {role}")
```

### Challenge 3: Number Guessing Game
Use if/elif/else to check if a guess is too high, too low, or correct:
```python
secret = 7
guess = int(input("Guess a number 1-10: "))
if guess == secret:
    print("You got it!")
elif guess < secret:
    print("Too low!")
else:
    print("Too high!")
```

### Challenge 4: Longer Adventure
Create a text adventure with at least 3 decision points and multiple endings.

### Challenge 5: Mad Libs
Ask the user for different types of words, then tell a funny story:
```python
noun = input("Give me a noun: ")
adjective = input("Give me an adjective: ")
verb = input("Give me a verb: ")
print(f"The {adjective} {noun} decided to {verb} all day!")
```

## Questions or Stuck?

- Review the workshop materials
- Check the [Common Questions]({{ site.baseurl }}/python-intro/instructor-notes/common-questions) guide
- Ask in the workshop Discord/Slack (if available)
- Remember: every programmer was once exactly where you are now!

## Looking Ahead

**Next Workshop: Advanced Python Coding (4/2/2026)**
- Loops: repeat actions automatically
- Lists: store collections of data
- Functions: organize code into reusable pieces
- Build bigger, more complex programs
