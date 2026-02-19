---
layout: default
title: Timing Guide
workshop: Python Coding Introduction
section: Instructor Notes
---

# Python Coding Introduction Timing Guide (2 Hours)

**Audience**: 12–14 year-olds, beginners or returning from previous workshops. \
**Goal**: variables, print(), input(), f-strings, if/else, creative coding confidence. \
Keep energy positive and normalize errors.

## 0:00–0:10 - Welcome & Code Confidence Icebreaker

- **Objective**: lower anxiety about coding; set interactive tone.
- **Prompt**: "If your computer could talk back to you, what's the first thing you'd want it to say?"
- **Materials**: slides, completed example adventure ready to demo.
- **Tip**: show the finished example first - "This is where you're headed today."
- **Watch for**: students new to the series; pair with returning students if possible.

## 0:10–0:25 - Environment Setup & Git Fork/Clone

- **Objective**: get starter code, verify Python works.
- **Before workshop**: have repo URL prominently displayed.
- **Flow**: demonstrate each step on projector:
  1. Fork repository on GitHub (or sync existing fork)
  2. Clone to local (suggest `Documents/workshops/`)
  3. Open folder in VS Code
  4. Open integrated terminal (View → Terminal)
  5. Run `python --version` (should see 3.10+)
  6. Run `python hello.py` (should see welcome)
- **Watch for**:
  - `python` vs `python3` confusion (Mac/Linux often needs `python3`)
  - GitHub authentication issues (SSH vs HTTPS)
  - Clone location confusion
  - VS Code not opening integrated terminal
  - Python not installed or not in PATH
- **Fallback**: GitHub Codespaces if local setup fails.
- **Tip**: type slowly, narrate every action.

## 0:25–0:45 - Python & Your First Variables

- **Objective**: understand what Python is, create first variables.
- **Demo**: live code alongside students.
- **Flow**:
  1. Explain Python is popular, used in AI, science, web, games
  2. Show Python reads like English (compare to JavaScript briefly)
  3. Introduce variables - no keywords needed, just `name = value`
  4. Introduce snake_case naming convention
  5. Show strings (with quotes), integers (whole numbers), floats (decimals), booleans (True/False)
  6. Create variables together in `adventure.py`
- **Interactive**: ask students to suggest variable names and values.
- **Watch for**:
  - Using spaces in variable names (show snake_case)
  - Forgetting quotes around strings
  - Using lowercase true/false instead of True/False
  - Variable name typos (case sensitive!)
- **Tip**: emphasize how clean Python looks compared to other languages.

## 0:45–1:05 - print(), input(), and f-strings

- **Objective**: display output, get user input, format strings.
- **Key concept**: print() talks TO the user, input() listens FROM the user.
- **Demo**:
  1. Show basic print()
  2. Show printing variables
  3. Introduce f-strings (f before quotes, variables in {})
  4. Introduce input() - show prompt and waiting
  5. Demonstrate that input() returns a string
  6. Show int() conversion for numbers
- **Activity**: have students build an interactive greeting.
- **Common mistakes**:
  - Forgetting the `f` prefix on f-strings
  - Missing `{}` around variables in f-strings
  - Forgetting quotes around the prompt in input()
- **Tip**: intentionally forget the `f` prefix to show the difference.
- **Watch for**:
  - Students confused about when to use print() vs input()
  - Missing parentheses on print() or input()
  - Not saving before running

## 1:05–1:15 - Break

- **Encourage**: stand up, stretch, eyes off screen.
- **Optional**: coding riddle on screen for early returners.
- **Tip**: this break is before the big project; use time to help struggling students catch up.

## 1:15–1:25 - Project Introduction

- **Objective**: understand the mission, learn if/else, plan approach.
- **Critical**: teach if/else clearly before hands-on time.
- **Show**:
  1. Run completed example (`python solution/adventure-example.py`)
  2. Explain if/else syntax: condition, colon, indentation
  3. Show `==` for comparison (not `=`)
  4. Show starter template (mostly empty with TODOs)
  5. Explain the steps (variables → name → opening → choice → ending)
- **Normalize**: "Your adventure will be different and that's perfect."
- **Watch for**:
  - Students confused by indentation rules
  - Missing colon after if/else
  - Using `=` instead of `==`
- **Tip**: draw the if/else branching on a whiteboard if available.

## 1:25–1:45 - Hands-On: Building Text Adventure

- **Objective**: apply all concepts creatively.
- **Your role**: circulate, encourage, debug together.
- **Don't**: type for students - guide them to find errors.
- **Do**: ask "What do you think Python is confused about here?"
- **Pacing strategies**:
  - **Fast finishers**: point to extension challenges (elif, score tracking, more branches)
  - **Slower students**: focus on simple version (name input, one choice, basic ending), commit what they have
- **Watch for**:
  - Silent struggling - check in proactively
  - IndentationError - most common Python beginner error
  - Students comparing work negatively (redirect to own progress)
  - Missing colons after if/else
  - Forgetting to save file before running
- **Common errors**:
  - `IndentationError` - inconsistent spacing
  - `SyntaxError` - missing colon, mismatched quotes
  - `NameError` - typo in variable name
  - Running from wrong directory
- **Tip**: model reading error messages - "Let's look at what Python is telling us."

## 1:45–1:55 - Git Commit, Push & Show-and-Tell

- **Objective**: save work, celebrate successes.
- **Git flow**: walk through together as a group.
  ```bash
  git add .
  git commit -m "Complete text adventure"
  git push
  ```
- **Show-and-Tell**: ask for volunteers only; celebrate creativity.
- **Highlight**: different approaches, creative choices, problem-solving.
- **Watch for**: git errors (wrong directory, nothing to commit, push fails).
- **Fallback**: if git is problematic, students can do it at home; focus on celebration.
- **Tip**: make show-and-tell low-pressure; emphasize no "best" adventure.

## 1:55–2:00 - Wrap-Up & Teaser

- **Objective**: reflect, connect to next workshop.
- **Prompts**:
  - "What surprised you about Python?"
  - "What would you add to your adventure with more time?"
- **Celebrate**: everyone who ran code successfully.
- **Normalize**: "No one's code is perfect, including mine."
- **Bridge**: "Next time, you'll learn loops, lists, and build even bigger Python programs!"
- **Quick demo**: show a simple for loop with a list.
- **Tip**: end on excitement for next workshop.

## General Tips Throughout

- **Type slowly**: narrate what you're doing.
- **Normalize errors**: "I've been coding for years and still make these mistakes."
- **Read error messages together**: show they're helpful, not scary.
- **Celebrate attempts**: "You just debugged your first IndentationError!"
- **Check in frequently**: don't let anyone fall too far behind.
- **Pair struggling students**: with more confident peers.
- **Keep it fun**: coding is creative and empowering.
