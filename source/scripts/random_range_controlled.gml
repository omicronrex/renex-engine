///random_range_controlled(min,max,[num_bins])
//utility retooled from Princeoflight avoidance engine
//mitigates clusters of bullets and variation in RNG density (if used for direction)

//setting the 'num_bins' argument too high will make the pattern lose its randomness

// [!!!] DO NOT USE INSIDE WITH STATEMENTS [!!!]
//modify the instance you're creating by setting it to a variable instead

var x1,x2,nmin,nmax,max_rng_bins;

nmin=argument[0]
nmax=argument[1]

if (!variable_local_exists("rng_bin")) rng_bin=0
if (argument_count>2) max_rng_bins=argument[2]
else max_rng_bins=4

x1=lerp(nmin,nmax,rng_bin/max_rng_bins)
x2=lerp(nmin,nmax,(rng_bin+1)/max_rng_bins)

rng_bin+=1
if (rng_bin==max_rng_bins) rng_bin=0

return random_range(x1,x2)
