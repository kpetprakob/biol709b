##Create a function that takes parameter input and put them into a matrix
para.m = function(Ra, Gs, Msl, Gsl, Msa, Gsa, Ma){


v.mat = c(0,Gs,0,0,0,(1-Msl),Gsl,0,0,0,(1-Msa-Gsa),Gsa,Ra,0,0,(1-Ma))
para.mat = matrix(data = v.mat, nrow = 4, ncol=4, byrow=TRUE)
return(para.mat)
}

##Create an array

#####
n.sp = length(t0.com)
n.mat = c(1:n.sp)

for(i in 1:n.sp){
############

#Create array to store each time step into one matrix

################################
##Example how to create array from severa matrices
a=matrix(rnorm(16),nrow=4)

b=matrix(rnorm(16),nrow=4)

d=matrix(rnorm(16),nrow=4)

glass=array(c(a,b,d),dim=c(4,4,3))
#####################################

#Matrix multiplication
# Use this %*%
#Generate function that take input community matrix, parameter matrix, number of years