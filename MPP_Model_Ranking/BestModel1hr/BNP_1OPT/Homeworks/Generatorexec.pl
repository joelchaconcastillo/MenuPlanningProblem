#!/usr/bin/perl
use strict;
use warnings;
use Getopt::Long;
my $file = "ExecutionFileDiversity";
my $fout;
open($fout, '>' ,$file);
my $Instance=0;
my $Sed=0;
my $PATH=  `cd ..; pwd`;
chomp $PATH;
#my @configuration2 = split ' ', $configuration;#~ s/ /_/g; 
##  ./main N = 10 pc = 0.9 pm = 0.3 finalTime = 60 fileName = "input_data/${name}" outputFile = "output_data/${name}" seed = 1 fileOutputIndividual = saved_individuals/out
#  ./main N = 10 pc = 0.9 pm = 0.3 finalTime = 60 fileName = "input_data/${name}" outputFile = "output_data/${name}" seed = 1 fileInputIndividual = saved_individuals/out

#my @lineConf=("20 60"); #1440", "40 1440", "60 1440");
my @lineConf=("20 60", "40 60", "60 60");
foreach my $line(@lineConf){
	my @splitted = split ' ',$line;
	my $days=$splitted[0];
	my $time=$splitted[1];
   for(my $seed=1; $seed<=35; $seed++){
     print $fout "~/$PATH/main ".$PATH."/entradas/Platillos.csv $PATH/entradas/Restricciones.csv $days $time $PATH/salidas/dias_".$days."_minutos_".$time."_seed_".$seed.".csv ".$seed." $PATH/History/populationAndFitness_days_".$days."_min_".$time."_seed_".$seed;
     print $fout "\n";
   }
}
