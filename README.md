# 538_Random_TicTacToe
Riddler Express from March 6th, 2020

This R script was written to solve the 538 Riddler Express published on March 6th, 2020. The riddle:

A local cafe has board games on a shelf, designed to keep kids (and some adults) entertained while they wait on their food. One of the games is a tic-tac-toe board, which comes with nine pieces that you and your opponent can place: five Xs and four Os.

When I took my two-year-old with me, he wasn’t particularly interested in the game itself, but rather in the placement of the pieces.

If he randomly places all nine pieces in the nine slots on the tic-tac-toe board (with one piece in each slot), what’s the probability that X wins? That is, what’s the probability that there will be at least one occurrence of three Xs in a row at the same time there are no occurrences of three Os in a row?


This script uses the permuations function within the library gtools to create all the permuations consisting of 5 X's and 4 O's into a matrix and checks for winners with a game board deisgned as such, where the numbers correspond to the column number of each row of the matrix:

design of the board. Numbers correspond to column number
  
       |       |       
   1   |   2   |   3    
 ______|_______|_______
       |       |
   4   |   5   |   6
 ______|_______|_______
       |       |       
   7   |   8   |   9
       |       |
