# woddr

Woddr - a simple dice roller for New World of Darkness. It supports auto re-roll functionality after "10 again", so you don't need to think about it. Besides regular rolls of your dice pool, woddr allows to make a chance roll and an initiative roll too.

Application contains four views:
- Dice pool  - allows to make regular rolls (combat and checks). Select number of d10 dices then press "Roll" button to see a result. It shows a number of success rolls (rolls which greater or equal to 8) and a number of "10 agains" (rolls which equal to 10). When 10 is rolled on a dice then woddr rolls it again. You can press "See details" to see a concrete result of every roll.
- Chance roll - allows to make a special types of rolls when success can be achieved only by getting of 10 on a dice. This view works similar to Dice pool, but you roll only one d10 dice and the view shows result of rolls directly under "Roll" button if you have less then five results. If you get 1 as result the view show you "Dramatic failure" message (special rule for a chance roll).
- Initiative - allows to make initiative rolls. Set your initiative mod then press "Roll" button to see results - result of roll and total result (roll + mod).
- Settings - allows to contact with developer and read about the application

**Support of application:** [Feedback](mailto:mamishov.tofik@gmail.com?subject=woodr-Feedback), [Report a bug](mailto:mamishov.tofik@gmail.com?subject=woodr-Bug)
