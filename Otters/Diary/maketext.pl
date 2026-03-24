#!/usr/bin/perl

open(IN,"diary.txt") or die "Cant open file $!";

undef $/;

$text=<IN>;


@days=split(/-- /,$text);

$daynum=1;

foreach $daytext (@days){
    
#    print $day;

    $daytext=~/([0-9]*) ([A-Za-z]*) --/;
    ($dnum, $mo)=($1, $2);

    print " The $dnum of $mo \n";

    next if ($dnum == "");
    

    htmlout($daytext,$daynum);
    $daynum++;

#print $day;


}


sub htmlout {
    my $daytext = shift;
    my $daynum = shift;

    $outfile=">Txt/DiaryDay".$daynum.".txt";

    open(OUT,$outfile) or die "Cant open output file $!";

    print $daytext;
    print OUT $daytext;

    close(OUT);

}



    
