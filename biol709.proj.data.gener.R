#Generating community matrix for 4 species, 4 life stage (4x4)

t0.com = matrix(data=100, nrow=4, ncol=4)

################################

#Generating matrix of 7 transition rates as columns and species as rows (4x7)

## Generate Reproduction rate of adult (Ra)

	Ra = sample(100:1000, 4, replace=TRUE)
	
## Generate Mortality rates (seedling (sl), sapling(sa), adult(a)

	Msl = rnorm(4, mean=0.7, sd=0.09) #about 70 seedlings out of 100 die in first year
	Msa = rnorm(4, mean=0.04, sd=0.009) #about 4 saplings out of 100 die in first year
	Ma = rnorm(4, mean=0.0005, sd=0.00001) #about 0.05 trees out of 100 die


## Generate Transition rate(G) from s-sl (s = survival rate of seed), sl-sa(sl), 
##sa-a (sa)

	Gs = rnorm(4,mean=0.2, sd=0.1) #20% of seeds survives to seedling stage
	Gsl = rnorm(4, mean=0.004, sd=0.0009) #0.4 seedlings turn into sapling in first year
	Gsa = rnorm(4, mean=0.002, sd=0.0001) #0.2 saplings turn into adult in first year

## bind the columns to gether to create mor.tran matrix

	mor.tran = cbind(Ra,Gs,Msl,Gsl,Msa,Gsa,Ma)

## add species names as row names
	sp.name = c("sp1", "sp2", "sp3", "sp4")
	row.names(mor.tran) = sp.name

#######################################