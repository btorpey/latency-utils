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
set xlab "deltaT (mm:ss)" 
set xdata time
# only display mm:ss 
set format x '%M:%S'
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
# The following plot uses an expression to calculate deltaT for the X axis, as opposed to 
# displaying time values directly.
# Note that time values in gnuplot are handled specially, so when performing calculations on
# the time column (in this case column 1), we need to tell gnuplot that it is a time value
origin=0
plot DATAFILE using ( (origin <= 0 ? origin = timecolumn(1): 0 ), timecolumn(1) - origin):($2 *SCALINGFACTOR) with points 
