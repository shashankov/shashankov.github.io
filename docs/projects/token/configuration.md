# Configuration File

Here we present the breakdown of the configuration file and its consituents. It is to be strictly named `configuration.inf`. A sample file can be found [here](configuration.inf).

!!! info
    Lines beginning with a `#` in the configuration file are treated as comments

    ``` python
    # Example: This is a comment
    ```

!!! warning
    The ordering of the lines must be strictly followed as there is no other way that the program indentifies the meaning of the data provided other than the spatial location with respect to the other elements

## Line Format

Each line consisting of data has two parts
* The part before `: ` which is for readability and is ignored
* The part after `: ` which is the actual data which is read

!!! note
    The space after the `:` is important and if absent will prevent data from being read

## Line by Line Explanation

Using an example configuration file, we go through each of the lines ignoring the comments.

### Spreadsheet Data

The first line mentions the ID of the spreadsheet linked to both the forms as mentioned in the [Google Forms](forms.md) page. For example, a spreadsheet with the url [`https://docs.google.com/spreadsheets/d/10Mrb6Up7q_ZtgJmb814JaHsconiOG_x76K5__u6h9SA`](about:blank) would have the following entry in the configuration file [Basically the part after `.../d/`]

``` python
#Line 1: Spreadsheet linked to both the Forms
Spreadsheet ID: 10Mrb6Up7q_ZtgJmb814JaHsconiOG_x76K5__u6h9SA
```

The next line mentions the sheet name for the Students response sheet within the spreadsheet.

``` python
#Line 2: Sheet Name linked to Student Form
Push Request Sheet: Form responses 1
```

This line mentions the column letter which contains the ID which is a required field of the form. It is assumed that the Name and Queue Question follow in the next two columns
``` python
#Line 3: Roll Number Column ID 
Column: B
```

The next line mentions the sheet name for the Servers (TAs) response sheet within the spreadsheet.

``` python
#Line 4: Sheet Name linked to TA Form
Pop Request Sheet: Form responses 2
```

### Queues

This line gets information about the number of queues which is same as the number of checkbox options in the form

``` python
#Line 5: Number of Queues (Based on TAs)
Queue Count: 6
```

In the next ``Queue Count` lines, the headers displayed on the GUI as mentioned in the [Getting Started](index.md) page.

``` python
#Line 6 to 6 + Queue Count: Headers [Count equal to Queue Count]
1: Question 1
2: ... and so on
```
