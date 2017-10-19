#Create a function called "para.m" that takes parameter input and put them into a matrix
#called "para.mat"

para.m = function(Ra, Gs, Msl, Gsl, Msa, Gsa, Ma){

v.mat = c(0,Gs,0,0,0,(1-Msl),Gsl,0,0,0,(1-Msa-Gsa),Gsa,Ra,0,0,(1-Ma))
para.mat = matrix(data = v.mat, nrow = 4, ncol=4, byrow=TRUE)
return(para.mat)

}
##DONE!
###########################################
#Create a function called "para.ar" that takes each row of 4x7 matrix and use para.m 
#to create array of 4x4 matrices

para.ar = function(x){
	
	n.sp = nrow(x)
	sp.para = array(data=NA, dim=c(4,4,n.sp))
	
	for (i in 1:n.sp){
		tmp = x[i,]
		sp.para[,,i] = para.m(tmp[1],tmp[2],tmp[3],tmp[4],tmp[5],tmp[6],tmp[7])
	}
	return(sp.para)
}

##DONE!
#############################################

#Create a function that takes a vector and a matrix and multiply those two
	pop.t.cal = function(sp1,para.mat){
	pop.t = sp1 %*% para.mat
	return (pop.t)
	}

##DONE!
#################################################

#Create a function that takes the coummunity matrix, moratilty&transition matrix(4x7) 
#and time (t) and calculate population structure at each year

com.struct = function(t0.com,mor.tran,t){

	tmp.sp.para = para.ar(mor.tran) #array of parameters matrix of each species
	
	n.sp = nrow(t0.com)
	
	struct.arr = array(data=NA, dim=c(n.sp,4,t+1)) #array of community structure at each time step
	
	struct.arr[,,1] = t0.com # first one is at year 0
	
	for (i in 2:(t+1)) {
	
		t0 = struct.arr[,,(i-1)]
	
		t1 = matrix(data=NA, nrow=n.sp, ncol=4)
	
		for (j in 1:n.sp) {
		
			a = t0
			b = tmp.sp.para[,,j]
		
			t1[j,] = pop.t.cal(a[j,],b)
		}
	
	struct.arr[,,i] = t1
		
	}
	return(struct.arr)
}
##DONE!
###############################################################
