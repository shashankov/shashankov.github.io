---
title: Token System
description: A queue-based allocation system for handling student requests in FCFS order
tags:
  - Python
  - Google Forms
  - Teaching Tools
---

## Description

The token system implements a queue based allocation system for handling customers with requests in a [FCFS](https://en.wikipedia.org/wiki/Scheduling_(computing)#First_come,_first_served) (First Come, First Served) manner. The motivation behind this code was to streamline the Answer Sheet Grading doubt session or, as it is called here in IIT Bombay, the `"Crib Session"`, for the course in which I am a Teaching Assistant.

## Dependencies

### Google Forms

The project, to facilitate ease of access on the clients' (Students) and the servers' (Teaching Assistants), uses [Google Forms](https://docs.google.com/forms/u/0/) to supply the input data stream. To use Google Forms, the user of the code must have access to Google Forms and hence also must have a [Google Account](https://account.google.com/).

### Operating System

The project has been written in [Python3](https://www.python.org/) and compiled into a standalone executable using [PyInstaller 3.4](https://pyinstaller.readthedocs.io/en/stable/) and tested on two systems:

* Ubuntu 18.04.1
* Windows 10

> **Note:** For Linux based systems, the python executable depends on linking of some libraries which may require latest packages available on the said systems. The source code is available for those who would like to use or build the program from source.

Also for Ubuntu systems, updates can be performed as:

```bash
sudo apt update
sudo apt upgrade
```

## Setup

The program along with the `credentials.json` file which is required to connect to the Google Sheets API and a sample configuration file can be found in release hosted on Github:

> [Release Version 1.0](https://github.com/ShashankOV/Token-System/releases/tag/v1.0)

The `tar.gz` version is for Linux while `.zip` for Windows.

> **Note:** The first time you run the program, you'll have to login to your Google ID to provide the program access to read your Google Sheets.

> **Warning:** Note that the archives don't have a sub-folder and hence extracting releases all the contents into the current directory.

### Linux

First extract the downloaded release:

```bash
mkdir token
tar -xzvf <PATH_TO_DOWNLOAD_LOCATION>/token_v1.0.tar.gz -C token
cd token
```

Then the executable must be given execute permissions and can be run as follows:

```bash
chmod +x generic
./generic
```

### Windows

Extract the ZIP archive into a folder and run `generic.exe`

---

## Setting up Google Forms

To ensure that the input methods are compatible with the program, the forms and their sheets must adhere to some guidelines which are listed here.

### Students Side GForm

The important rules for this are:

1. The ID, Name and Queue Selection Questions must be one after the other without fail (Can be preceded and succeeded by any format of questions)
2. ID Question must be a required question
3. The Queue Selection
    1. Must be based on the checkbox system and
    2. Every option must begin with a unique number

A sample form is shown below:

<iframe src="https://docs.google.com/forms/d/e/1FAIpQLScqyjF8qKveCDhlO2LhJgxaq0l9LqOJr9rRSMOZsrWcEFBNdA/viewform?embedded=true" width="700" height="520" frameborder="0" marginheight="0" marginwidth="0">Loading...</iframe>

### Servers (TAs) Side GForm

The important rules for this are:

1. The first question must be about the ID of the server (Succeeding questions do not matter)
2. The question must a Radio-Button kind MCQ with each option beginning with a unique id

A sample form is shown below:

<iframe src="https://docs.google.com/forms/d/e/1FAIpQLScBlhWa-tyi8y4s0t4ctn_gVxq36-HIho6sdHnZrMulIxNsRQ/viewform?embedded=true" width="640" height="673" frameborder="0" marginheight="0" marginwidth="0">Loading...</iframe>

### Integrating with Google Sheets

The responses of both the forms must be directed to a single spreadsheet in different sheets (within the same spreadsheet). The ID of this spreadsheet and the names of the sheets need to be mentioned in the configuration file for the program to read.

---

## Configuration File

Here we present the breakdown of the configuration file and its constituents. It is to be strictly named `configuration.inf`. A sample file can be found [here](/uploads/token/configuration.inf).

> **Note:** Lines beginning with a `#` in the configuration file are treated as comments.
>
> ```python
> # Example: This is a comment
> ```

> **Warning:** The ordering of the lines must be strictly followed as there is no other way that the program identifies the meaning of the data provided other than the spatial location with respect to the other elements.

### Line Format

Each line consisting of data has two parts:
* The part before `: ` which is for readability and is ignored
* The part after `: ` which is the actual data which is read

> **Note:** The space after the `:` is important and if absent will prevent data from being read.

### Spreadsheet Data

The first line mentions the ID of the spreadsheet linked to both the forms. For example, a spreadsheet with the url `https://docs.google.com/spreadsheets/d/10Mrb6Up7q_ZtgJmb814JaHsconiOG_x76K5__u6h9SA` would have the following entry in the configuration file (basically the part after `.../d/`):

```python
#Line 1: Spreadsheet linked to both the Forms
Spreadsheet ID: 10Mrb6Up7q_ZtgJmb814JaHsconiOG_x76K5__u6h9SA
```

The next line mentions the sheet name for the Students response sheet within the spreadsheet:

```python
#Line 2: Sheet Name linked to Student Form
Push Request Sheet: Form responses 1
```

This line mentions the column letter which contains the ID which is a required field of the form. It is assumed that the Name and Queue Question follow in the next two columns:

```python
#Line 3: Roll Number Column ID
Column: B
```

The next line mentions the sheet name for the Servers (TAs) response sheet within the spreadsheet:

```python
#Line 4: Sheet Name linked to TA Form
Pop Request Sheet: Form responses 2
```

### Queues

This line gets information about the number of queues which is same as the number of checkbox options in the form:

```python
#Line 5: Number of Queues (Based on TAs)
Queue Count: 6
```

In the next `Queue Count` lines, the headers displayed on the GUI:

```python
#Line 6 to 6 + Queue Count: Headers [Count equal to Queue Count]
1: Question 1
2: ... and so on
```

---

## Graphical User Interface

The GUI is used to display the allocation to everyone (even the servers) as this is the only output (other than the debug output on the terminal).

![Sample Display](/uploads/token/sample.png)

The GUI supports up to 12 queues in the form of 2 rows with 6 queues in each. The above image shows a sample with 6 such queues.

| Sr. No. | Brief Info  | Long Description                                  |
|---------|-------------|---------------------------------------------------|
| Row 1   | Headers     | Queue names obtained from the configuration file  |
| Row 2   | ID          | Students' Unique Roll Number/ID                   |
| Row 3   | Name        | Students' Name or anything other parameter        |
| Row 4   | Queue Size  | Number of waiting requests                        |
