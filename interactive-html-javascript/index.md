---
layout: default
title: Interactive HTML + JavaScript
workshop: Interactive HTML + JavaScript
---

# Interactive HTML + JavaScript - 2 Hour Workshop

**Audience:** Beginners with basic HTML familiarity \
**Theme:** _"Making the browser respond to you with forms and JavaScript"_

* [Recording](https://youtu.be/1DFExD01zDY)
* [Slides]({{ site.baseurl }}/interactive-html-javascript/slides.html)
* Resources:
  * [Glossary]({{ site.baseurl }}/interactive-html-javascript/resources/glossary)
  * [Next Steps After Interactive HTML + JavaScript]({{ site.baseurl }}/interactive-html-javascript/resources/next-steps)
* Student Handouts:
  * [Vocabulary Handout]({{ site.baseurl }}/interactive-html-javascript/student-handouts/vocabulary)
  * [Worksheet Handout]({{ site.baseurl }}/interactive-html-javascript/student-handouts/worksheet)
* Instructor Notes:
  * [Common Questions]({{ site.baseurl }}/interactive-html-javascript/instructor-notes/common-questions)
  * [Timing Guide]({{ site.baseurl }}/interactive-html-javascript/instructor-notes/timing-guide)

## 1. Workshop Goals

By the end of this workshop, every student should be able to:

* Explain how HTML, CSS, and JavaScript work together in the browser
* Use form inputs (text, textarea, select) to collect user choices
* Select DOM elements with `querySelector`
* Listen for events like `input` and `change`
* Update text and styles dynamically
* Build an interactive "Message Box" project

This workshop is about visible, instant feedback and playful experimentation.

## 2. Success Definition

A student is successful if they can say:

> "I can connect HTML inputs to JavaScript so the page updates when I type or pick a
> new option."

## 3. Environment & Prerequisites

### Required Software

Before the workshop, students should have:

* **VS Code** installed
* **Git** installed and configured
* **GitHub account** created
* **Workshop repository forked** (or sync a previous fork)

See the complete [Setup Guide]({{ site.baseurl }}/SETUP) for step-by-step
instructions.

### Primary Path

* Local development using VS Code
* Open `starter-code/index.html` in the browser
* Refresh the browser to see changes

### Fallback Path (If Needed)

* GitHub Codespaces (browser-based; be mindful of free quota)

## 4. 2-Hour Agenda (Minute-by-Minute)

### 0:00-0:10 - Welcome & Web Interactions Icebreaker

> Low-pressure, interactive mindset

* Prompt: "What is one website that lets you customize something?"
* Emphasize: experimentation over perfection

### 0:10-0:25 - HTML Structure + Form Controls

> Build the layout together

Topics:

* Labels and inputs (`input`, `textarea`, `select`)
* `id` and `for` connections
* Grouping sections with `div`

### 0:25-0:40 - CSS for a Styled Message Box

> Make the preview area feel like a real widget

* Box spacing, borders, and fonts
* Theme classes for colors
* Default styles vs dynamic styles

### 0:40-0:55 - JavaScript + DOM Basics

> Make the page respond

* `querySelector` to find elements
* `textContent` for updates
* `className` for theme changes
* `input` and `change` events

### 0:55-1:05 - Break

* Encourage movement
* Optional prompt on screen: "What UI feature would you add to the box?"

### 1:05-1:15 - Project Intro: Interactive Message Box

* Show the finished example
* Walk through the starter files
* Explain the controls and preview area

### 1:15-1:45 - Hands-On Build

* Wire inputs to update the preview
* Add theme changes from the dropdown
* Add box sizing from the number input
* Test and refresh often

### 1:45-1:55 - Save Work + Share

* `git add . && git commit -m "Complete message box"`
* Quick show-and-tell

### 1:55-2:00 - Wrap-Up & Teaser

* Reflection: "What felt most powerful today?"
* Preview: "Next workshop, you'll build full programs in Python."

## 5. Printed Student Handouts

### Handout 1: Vocabulary (Fill-in-the-Blank)

* HTML, CSS, JavaScript
* DOM, element, event, input, select

### Handout 2: Mission Worksheet

* Warm-up check-in
* DOM and events practice
* Project planning prompts
* Reflection

## 6. Instructor Guardrails

* Type slowly and narrate your steps
* Normalize mistakes and refreshes
* Ask: "What do you expect the page to do?"
* Encourage students to test changes often
* Celebrate creative choices

## 7. Bridge to Workshop #4 (Python Coding Introduction)

End with:

> "Today we made web pages respond to us. Next time, we'll make full programs in
> Python and learn how to solve problems step by step."

## 8. Overarching Goals

* Make the DOM feel approachable
* Build confidence with event-driven thinking
* Connect HTML structure to JavaScript behavior
* Reinforce that experimentation is part of coding
