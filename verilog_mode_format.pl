#!/usr/bin/perl -w

open HH, "<abcxyz123789.v" or die "can not open abcxyz123789.v";
@array_info = <HH>;
close HH;

@array_file = qw//;
$flag_wire  = 0;
$flag_param = 0;
$flag_inst  = 0;
foreach $line (@array_info) {
  chomp($line);

  if($flag_wire == 1) {
    if($line =~ /^wire\s*(\[.*\])?\s*(\w+\;)\s*(.*)$/) {
      $temp = sprintf
    }
  }
}
