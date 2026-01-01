# Tech Fundamentals - 2 hour Workshop

**Audience:** Beginners with little to no programming experience
**Theme:** _"How computers actually work - and how you control them"_

## 1. Workshop Goals

By the end of this workshop, every student should be able to:

* Explain (in simple terms) what a computer does and how software fits in
* Comfortably use:
  * A web browser
  * A file system (folders, files, extensions)
  * A text editor (vs word processor)
* Understand what code is, even if they don't write much yet
* Successfully run a few simple commands in a terminal or web-based shell
* Leave feeling confident, curious, and not intimidated

This workshop is about confidence and mental models, not speed or depth.

## 2. Success Definition (Student-Facing)

A student is successful if they can say:

> "I know what code is, where it lives, how computers run it, and I'm not afraid to try."

## 3. Environment & Tooling Strategy

### Primary Path (Preferred)

* Local laptop
  * Windows: File Explorer + Notepad / VS Code (if installed)
  * Chromebook:
    * Chrome browser
    * Linux enabled or
  * Browser-only fallback

### Fallback Path (Guaranteed)

* Browser-based editor:
  * GitHub Codespaces

## 4. 2-Hour Agenda (Minute-by-Minute)

### 0:00–0:10 - Welcome & Comfort Icebreaker

> Low-pressure, introvert-friendly

* Prompt (verbal or written):
  * > "What's one thing you've used a computer for this week?"
* Emphasize:
  * No wrong answers
  * No one is behind
  * Curiosity beats correctness

### 0:10–0:30 - What Is a Computer, Really?

> Conceptual, visual, interactive

Topics:

* Hardware vs Software
* CPU = thinking
* Memory = short-term notes
* Storage = long-term memory
* Programs = instructions
  * Interesting programs need data. How does data get from storage to memory to CPU?

Activity:

* Paper exercise:
  * > "Circle which of these are hardware vs software"
* Analogy-based discussion (recipes, LEGO instructions, game rules)

### 0:30–0:50 - Files, Folders, and Extensions

> Hands-on

Teach:

* What a file is
* What a folder is
* Why `.txt`, `.html`, `.js`, `.py` matter
* Why computers care about extensions

Activity:

* Create a folder:

  ```bash
  Tech-Workshop-1/
  ```

* Inside it:
  * `notes.txt`
  * `about-me.txt`
* Rename files and observe behavior

Key takeaway:

> "Files don't do anything until a program reads them."

### 0:50–1:10 - Text Editors vs Word Processors

> Critical distinction

Explain:

* Why Word should not be used for coding
* What plain text is
* Why "rich" formatting breaks code

Activity:

* Open a file in:
  * Word (or Docs)
  * Plain text editor
  * `od -c`
* Compare invisible formatting

### 1:10–1:20 - Break

* Encourage movement
* Optional puzzle or riddle on paper

### 1:20–1:40 - What Is Code?

> Mental model first

Teach:

* Code = instructions
* Computers are literal
* Programs run "top-to-bottom"
* Errors are normal

Demonstration:

* Human "computer" game:
  * Students give overly vague instructions
  * Instructor follows them _exactly_
  * Debrief on misunderstandings

### 1:40–1:55 - First Terminal Experience

> Zero intimidation

Teach:

* What a terminal/command line is
* Why it exists
  > It's just another, more direct way to talk to the computer

Commands to teach:

```bash
pwd
ls
echo "Hello, computer!"
```

### 1:55–2:00 - Wrap-Up & Teaser

* What they now know
* How this leads into JavaScript
* Celebrate effort, not mastery

## 5. Printed Student Handouts

### Handout 1: Vocabulary (Fill-in-the-Blank)

* Hardware
* Software
* File
* Folder
* Code
* Program
* Terminal

### Handout 2: File System Map

* Draw your folder tree
* Label file types
* Handout 3: Reflection
* "One thing I learned…"
* "One thing I'm curious about…"

## 6. Instructor Guardrails

* Never type for a student
* Normalize mistakes out loud
* Repeat: _"This is new - it's supposed to feel weird"_
* If a student is stuck ask: _"What do you think the computer thinks?"_

## 7. Bridge to Workshop #2 (JavaScript Basics)

End with:

> "The next workshop will give you the chance to tell the computer what to do using JavaScript"

Show a single-line preview, no explanation yet:

```javascript
console.log("I wrote code!");
```

## 8. Overarching Goals

* Reduce fear before complexity
* Build shared vocabulary
* Work across Windows & Chromebooks
* Scale to mixed experience levels
* Set a clean runway for JavaScript
