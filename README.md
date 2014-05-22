# Latency Utils

This repo contains some useful scripts etc. for measuring and reporting latency.

## ts.sh

Invoke gnuplot with command file for generating a time-series plot from latency data.

### Usage

ts.sh datafile {terminal}

The time series datafile is assumed to consist of two columns: the first column is a timestamp, the second column is the latency value associated with that timestamp.

The terminal parameter can be used to override the default terminal type (typically x11). If you do this, you most likely want to pipe the output to a file, like so:

    ts.sh ping.csv pdf > ping.pdf

To see all the terminal types available in your installation:

    gnuplot -e "set terminal"

This version of the script displays actual timestamp values on the x-axis.

## tsd.sh

Similar to ts.sh, above, but the x-axis is plotted with the deltaT of the values.

## ts.gp

gnuplot command file used by ts.sh. The file contains comments that should allow you to figure out what it is doing and modify it to meet your requirements.

## tsd.gp

Similar to ts.gp, above, but with some tweaks to plot x-axis values as the delta from the first timestamp.

## ping.csv

Sample data file for the scripts above. This is a more-or-less random collection of ping values that was massaged for use with the scripts.

## ping.pdf, ping.png

Output produced by the scripts from the sample ping.csv file.

Please note that the command files have been tested with gnuplot 4.6. In particular, tsd.gp does not work with gnuplot 4.2 -- the calculation in the plot command is not interpreted correctly.

© Copyright 2014 by Bill Torpey. All Rights Reserved.

This work is licensed under a Creative Commons Attribution-NonCommercial-NoDerivatives 4.0 International License.
