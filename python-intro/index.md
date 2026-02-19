---
layout: default
title: Python Coding Introduction
workshop: Python Coding Introduction
---

# Python Coding Introduction - 2 Hour Workshop

**Audience:** Beginners with little to no programming experience \
**Theme:** _"Talking to your computer - your first Python conversations"_

* [Slides]({{ site.baseurl }}/python-intro/slides.html)
* Resources:
  * [Glossary]({{ site.baseurl }}/python-intro/resources/glossary)
  * [Next Steps After Python Coding Introduction]({{ site.baseurl }}/python-intro/resources/next-steps)
* Student Handouts:
  * [Vocabulary Handout]({{ site.baseurl }}/python-intro/student-handouts/vocabulary)
  * [Worksheet Handout]({{ site.baseurl }}/python-intro/student-handouts/worksheet)
* Instructor Notes:
  * [Common Questions]({{ site.baseurl }}/python-intro/instructor-notes/common-questions)
  * [Timing Guide]({{ site.baseurl }}/python-intro/instructor-notes/timing-guide)

## 1. Workshop Goals

By the end of this workshop, every student should be able to:

* Explain what Python is and why it's popular
* Create variables to store different types of data
* Use `print()` to display output
* Use `input()` to get information from the user
* Use f-strings to format text with variables
* Write simple `if`/`else` decisions
* Run Python programs from the terminal
* Create an interactive text adventure
* Save and share their code using Git

This workshop is about building programs that have a two-way conversation with the user.

## 2. Success Definition

A student is successful if they can say:

> "I can write Python code that asks questions, remembers answers, and makes decisions. I'm not afraid to experiment and debug."

## 3. Environment & Prerequisites

### Required Software

Before the workshop, students should have:

* **Python 3.10+** installed (see [Setup Guide]({{ site.baseurl }}/SETUP))
* **VS Code** installed and configured
* **Git** installed and configured
* **GitHub account** created
* **Workshop repository forked** - or if you already have a fork from a previous workshop, [sync your fork]({{ site.baseurl }}/SETUP#section-4-cloning-the-workshop-repository) to get the latest materials

See the complete [Setup Guide]({{ site.baseurl }}/SETUP) for step-by-step installation instructions.

### Primary Path

* Local development using VS Code
* Python in integrated terminal
* Git for version control

### Fallback Path (If Needed)

* GitHub Codespaces (browser-based; be mindful of [free quota](https://docs.github.com/en/billing/concepts/product-billing/github-codespaces#free-quota) limits)

## 4. 2-Hour Agenda (Minute-by-Minute)

### 0:00–0:10 - Welcome & Code Confidence Icebreaker

> Low-pressure, creativity-focused

* Prompt (verbal or written):
  * > "If your computer could talk back to you, what's the first thing you'd want it to say?"
* Emphasize:
  * Everyone is learning
  * Mistakes are how we learn coding
  * Your program will be unique and that's perfect

### 0:10–0:25 - Environment Setup & Git Fork/Clone

> Hands-on setup

* Navigate to workshop repository on GitHub
* Fork the repository (or sync existing fork)
* Clone to local machine
* Open in VS Code
* Verify Python: `python --version` (or `python3 --version`)
* Run starter: `python hello.py`

### 0:25–0:45 - Python & Your First Variables

> Foundation concepts

Topics:

* What is Python and why is it so popular?
* Python reads like English
* Variables are labeled boxes for information
* Data types: strings (text), integers (whole numbers), floats (decimals), booleans (True/False)

Activity:

* Create variables about yourself:

```python
name = "Alex"
age = 13
favorite_number = 3.14
is_learning_python = True
```

* Use print() to display values

### 0:45–1:05 - print(), input(), and f-strings

> Making programs interactive

Topics:

* `print()` displays information
* `input()` asks the user a question and waits for an answer
* f-strings let you mix variables and text easily
* `input()` always returns a string
* `int()` converts strings to numbers

Activity:

* Build an interactive greeting:

```python
name = input("What is your name? ")
print(f"Hello, {name}! Welcome to Python!")

age = int(input("How old are you? "))
print(f"Wow, {age} is a great age to learn coding!")
```

### 1:05–1:15 - Break

* Encourage movement
* Optional: coding riddle on screen

### 1:15–1:25 - Introduction to the Text Adventure Project

> Preview and planning

* Show completed example (run `adventure-example.py`)
* Explain the mission: interactive storytelling with input and decisions
* Walk through starter template
* Introduce `if`/`else` for branching paths
* Clarify: we build incrementally, simple to complex

### 1:25–1:45 - Hands-On: Building the Text Adventure

> Creative coding time

Progression:

1. Set up story variables
2. Ask the player for their character name
3. Display the story opening with f-strings
4. Add a choice using `if`/`else`
5. Build the story ending based on the choice
6. Test by running `python adventure.py`

Extension for fast finishers:

* Add multiple choices (elif)
* Track a score variable
* Add more story branches
* Use a while loop for repeated choices
* Ask for more user inputs throughout the story

### 1:45–1:55 - Git Commit, Push & Show and Tell

> Save and celebrate

* Add and commit: `git add . && git commit -m "Complete text adventure"`
* Push to GitHub: `git push`
* Volunteer show-and-tell (2-3 students)
* Celebrate creativity and problem-solving

### 1:55–2:00 - Wrap-Up & Teaser

> Reflect and connect forward

* Reflection: "What surprised you about Python?"
* Preview: "Next workshop, we'll go deeper with loops, lists, and building bigger programs!"
* Quick demo of a loop or list concept

## 5. Printed Student Handouts

### Handout 1: Vocabulary (Fill-in-the-Blank)

* Python, variable, string, integer
* float, boolean, print(), input()
* f-string, if, else, condition

### Handout 2: Mission Worksheet

* Warm-up check-in
* Python basics concepts
* Variable lab exercises
* Data types detective
* print() and input() practice
* Adventure planning zone
* Terminal commands reference
* Reflection prompts

## 6. Instructor Guardrails

* Type slowly - narrate what you're doing
* Normalize syntax errors: "I make these mistakes daily"
* Ask "What do you think Python is confused about?" when students are stuck
* Don't type for students - guide them to find their own answers
* Celebrate attempts, not just correct answers
* Read error messages together - they're helpful!

## 7. Bridge to Workshop #6 (Advanced Python Coding)

End with:

> "Today you made Python ask questions and make decisions. Next workshop, you'll make Python repeat actions, remember lists of things, and build even bigger programs!"

Quick demo:

```python
colors = ["red", "blue", "green"]
for color in colors:
    print(f"I like {color}!")
```

## 8. Overarching Goals

* Variables and input as the foundation of interactive programs
* print() and f-strings as your communication tools
* if/else as the start of computer decision-making
* Creativity over perfection
* Comfort with terminal and Python
* Building blocks for advanced programming
* Confidence to experiment and learn from errors
