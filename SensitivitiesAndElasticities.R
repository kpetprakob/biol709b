#Sensitivity and Elasticity

#use para.ar function to create 
para.array = para.ar(mor.tran)
para.array

#Calculate eigenvalues and eigenvectors and select only the dominant vectors (normally is the first column)
#Right eigen vectors

#create an empty matrix (w) to store dominant right eigen vector of each species

w = matrix(data=NA, nrow=dim(para.array)[3], ncol=dim(para.array)[2])
 
for (i in 1:nrow(w)) {

w.tmp = eigen(para.array[,,i])

w[i,] = w.tmp$vectors[,which.max(w.tmp$values)]

}

#create an empty matrix (v) to store dominant left eigen vector of each species

v = matrix(data=NA, nrow=dim(para.array)[3], ncol=dim(para.array)[2])

for (i in 1:nrow(v)) {

v.tmp = eigen(t(para.array[,,i]))

v[i,] = v.tmp$vectors[,which.max(v.tmp$values)]

}

#########################
#Sensitivity = (left.eigenvector  %*% t(right.eigenvenctor))/(left.eigenvector %*% right.eigenvector)
#create array to store the matrices of sensitivity of each sepcies

sensit = array(data=NA, dim=dim(para.array))

for (i in 1:dim(sensit)[3]) {

sensit[,,i] = (v[i,] %*% t(w[i,]))/as.numeric(v[i,] %*% w[i,])

}

#rank values in each matrix from highest to lowest

rank.sensit = array(data=NA, dim=dim(sensit))

for (i in 1:dim(rank.sensit)[3]){

rank.sensit[,,i] = matrix(data=rank(sensit[,,i]),nrow=4,ncol=4,byrow=TRUE)

}

# All the four matrix indicated that the transition from seedling to sapling 
#(stage 2 to stage 3) is the most important
########################################