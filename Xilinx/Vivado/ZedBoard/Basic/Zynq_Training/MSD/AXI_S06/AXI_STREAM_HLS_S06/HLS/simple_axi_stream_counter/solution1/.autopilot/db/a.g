#!/bin/sh
lli=${LLVMINTERP-lli}
exec $lli \
    /home/alok/Vivado_Projects/MSadri/AXI_STREAM_HLS_S06/HLS/simple_axi_stream_counter/solution1/.autopilot/db/a.g.bc ${1+"$@"}