///random_range_bias(min,max,bias_value,bias_amount,[int]) bias_amount:(0~1)
//credits: https://stackoverflow.com/questions/29325069/how-to-generate-random-numbers-biased-towards-one-value-in-a-range
var rnd,mix,val,max_v,min_v,bias_v,bias_a;

min_v=argument[0]
max_v=argument[1]
bias_v=argument[2]
bias_a=argument[3]

rnd=random_range(0,1)*(max_v-min_v)+min_v
mix=random_range(0,1)*bias_a
val=rnd*(1-mix)+bias_v*mix

if (argument_count>4) val=round(val)
return val
