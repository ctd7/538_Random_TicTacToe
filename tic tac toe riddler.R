library(gtools) # needed for permutations function to find all the permutations. May need to install first

x = c(0,1) # 0 is for O, 1 is for X

df = permutations(n=2,r=9,v=x,repeats.allowed = TRUE) # matrix with all possible permutations of 0 and 1 
                                                      # chosen 9 times with repeats. Would include ones that do not
                                                      # fit 5 X's and 4 O's
dfs = rowSums(df) #sum of rows to find the ones that equal 5 X'
df = df[which(dfs == 5),] # removes permutations that do not fit criteria, 5 X's and 4 O's

b = dim(df)[1] # the number of valid permutations
wnx = 0 # counter for number of wins for X
wno = 0 # counter for number of wins for O
drw = 0 # counter for number of draws
wnxt = rep(0,9) # keep track of winning permutations for X. used as a quick error check after the below for loop
wnot = rep(0,9) # keep track of winning permuations for O
drwt = rep(0,9) # keep track of permutations that draw

for (i in 1:b) {  # for loop to go through all the permutations that have 5 X's and 4 O's to find winners
                   # for loop could be removed in future iterations, but not resoruce intensive
  
  # design of the board. Numbers correspond to column number
  
  #       |       |       
  #   1   |   2   |   3    
  # ______|_______|_______
  #       |       |
  #   4   |   5   |   6
  # ______|_______|_______
  #       |       |       
  #   7   |   8   |   9
  #       |       |
  
  
  df1 = rep(0,8) # 8 possible winners. Vector to help keep track
  bt = 0 # dummy variable as check if permutation is a draw. 0 means it was a draw
  
  df1[1] = sum(df[i,c(1,2,3)])  # summing the values for the 8 possible winning combinations - top row
  df1[2] = sum(df[i,c(1,5,9)])  # a sum of three indicates three X's in a row - left diagonal
  df1[3] = sum(df[i,c(1,4,7)])  # a sum of zero indicates three O's in a row - left column
  df1[4] = sum(df[i,c(2,5,8)])  # middle column
  df1[5] = sum(df[i,c(3,5,7)])  # right diagonal
  df1[6] = sum(df[i,c(3,6,9)])  # right column
  df1[7] = sum(df[i,c(4,5,6)])  # middle row
  df1[8] = sum(df[i,c(7,8,9)])  # bottom row
  
  if (length(which(df1 == 3)) >= 1 && length(which(df1 == 0)) == 0) { # tests any winning combinations for X without
                                                                      # winning combinations for O
    wnx = wnx + 1 # increase counter
    wnxt = rbind(wnxt,df[i,]) # add permutation
    bt = 1 # change dummy variable to indicate that this permutation is not a draw
  }
  
  if (length(which(df1 == 0)) >= 1 && length(which(df1 == 3)) == 0) { # repeats above if statement except for O
    wno = wno + 1
    wnot = rbind(wnot,df[i,])
    bt = 1
  }
  
  if (bt < 1) { # if bt is still 0, then it was a draw
    drw = drw + 1
    drwt = rbind(drwt,df[i,])
    }
}

wnxt = wnxt[-1,] #  removing initiating rows
wnot = wnot[-1,]
drwt = drwt[-1,]

paste(wnx/b) # outputs answer on Console
