# Google Forms Formatting

To ensure that the input methods are compatible with the program, the forms and their sheets must adhere to some guidlines which are listed here.

## Students Side GForm

The important rules for this are:

1. The ID, Name and Queue Selection Questions must be one after the other without fail (Can be preceded and succeded by any format of questions)
2. ID Question must be a required question
3. The Queue Selection
    1. Must be based on the checkbox system and 
    2. Every option must begin with a unique number

A sample form is shown below:

<iframe src="https://docs.google.com/forms/d/e/1FAIpQLScqyjF8qKveCDhlO2LhJgxaq0l9LqOJr9rRSMOZsrWcEFBNdA/viewform?embedded=true" width="700" height="520" frameborder="0" marginheight="0" marginwidth="0">Loading...</iframe>

## Servers (TAs) Side GForm

The important rules for this are:

1. The first question must be about the ID of the server (Succeeding questions do not matter)
2. The question must a Radio-Button kind MCQ with each option beginning with a unique id

A sample form is shown below:

<iframe src="https://docs.google.com/forms/d/e/1FAIpQLScBlhWa-tyi8y4s0t4ctn_gVxq36-HIho6sdHnZrMulIxNsRQ/viewform?embedded=true" width="640" height="673" frameborder="0" marginheight="0" marginwidth="0">Loading...</iframe>

## Integrating with Google Sheets

The responses of both the forms must be directed to a single spreadsheet in different sheets (within the same spreadsheet). The ID of this spreadsheet and the names of the sheets need to be mentioned in the configuration file for the program to read.
