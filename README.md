surveydonkey
============

One does not simply walk into Mordor

## Description
  The survey application has 2 roles - admin and user.

  * The survey admin should be able to:
    * See a list of existing surveys
    * Create/edit/delete a survey
    * Add/delete/edit questions to a survey
    * For each survey, see a list of responses from users.

  * A user should be able to:
    * See the list of existing surveys
    * Take a survey (i.e. answer all the questions and submit the response)
    * See appropriate validation messages. eg: if he enters a non-numeric value for a numeric question or forgets to answer one of the questions.
    * See an acknowledgement after completing a survey

  * Apart from these two roles, non logged-in users should be able to:
    * See the list of surveys
    * Sign up to be a user (username & email are required, and email should be verified)
    * Login

## Types of Questions
  * Essay question - answer with a text area
  * Numeric question - answer with a number
  * Date question - answer via a datepicker
  * Multiple choice question - answer via checkboxes Multiple choice question - answer via radio buttons Multiple choice question - answer via a select box

While adding a question, the admin should be able to choose its type. The user should be shown appropriate input options according to the question type.

## Question rules
  The admin should be able to mark a question as required or optional, and the answers validated with that option when the user takes a survey.

  The admin should be able to mark a question as being dependent on some other multiple-choice question, one of its options, and a comparator 'is' or 'is not'.

  If a date question D depends on a radio button question R, one of its options O, and the comparator 'is', then D should be visible and validated to the user if and only if R is answered with O.

  If a date question D depends on a radio button question R, one of its options O, and the comparator 'is not', then D should be visible and validated to the user if and only if R is answered with any option except O.

  Infinite levels of nesting dependent questions should be possible. Question C could depend on B, which could depend on A.
  Make sure you do not allow circular dependencies to be created. Question C could depend on B, which could depend on A, which should not be allowed to depend on B or C.
