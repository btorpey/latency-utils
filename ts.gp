# start with a clean slate
reset

# Title is centered over plot area
set title "Latency over Time" 

# display horizontal and vertical lines at tick marks
set grid
# turn off the key (excel calls this the legend)
unset key


#######################################
# Change this based on input format so values are interpreted correctly.
# Note that even though there is no format for fractional seconds, they
# are read and interpreted properly, even though they cant be displayed.
set timefmt '%H:%M:%S'
# time-series data is handled specially by gnuplot
set xlab "Time (hh:mm:ss)" 
set xdata time
# display actual time value
set format x '%H:%M:%S'
set xtics rotate

#######################################
# y-axis label
set ylab "Latency (us)" 
# not strictly necessary -- autoscale is the default
set autoscale y
# you may want to un-comment this if your input data has a very wide range of values
#set logscale y
# display values with thousands separator, no decimals
set decimal locale
# Change the following to accomodate input data to get better looking plots
# (hint: gnuplot likes whole numbers better than fractions)
SCALINGFACTOR=1000
# specify the precision of points on y-axis - in this case, we are dealing with whole numbers
set format y "%'6.0f"

#######################################
# this example assumes that the time is first column, and value is second
# Change "using x:y" if necessary
plot DATAFILE using 1:($2 * SCALINGFACTOR) with points
