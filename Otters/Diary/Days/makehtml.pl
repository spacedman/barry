#!/usr/bin/perl
#
#

open(TEMPLATE,"template.html") or die "Cant open template $!";
{
    local $/;
    undef $/;
    $template=<TEMPLATE>;
    close(TEMPLATE);
}


while(glob("*.txt")){
    open(IN,$_) or die "Error opening $_ is $!";
    print "Processing $_\n";

    $nday=$_;
    $nday=~s/DiaryDay//;
    $nday=~s/\.txt//;

    print "Day ".$nday."\n";

    $outfile=">DiaryDay".$nday.".html";

    $day=<IN>;
    $day=~s/--//;
    $short=<IN>;
    $short=~s/==//g;
    $title="Sea Otter Diary - ".$day;

    $slash=$/;
    undef $/;
    $text=<IN>;
    $/=$slash;
    


    close(IN);

    $prev="DiaryDay".($nday-1).".html";
    $next="DiaryDay".($nday+1).".html";

    $nav=<<EOF;
<p>
<table>
<tr>
    <td><a href="$prev">Previous Day</a></td>
    <td><a href="$next">Next Day</a></td>
</tr>
<tr>
    <td align=center><a href="index.html">Main Diary Page</a></td>
</tr>
</table>
EOF

#    print $short;

    $copy=$template;
    $copy=~s/##date##/$day/;
    $copy=~s/##short##/$short/;
    $copy=~s/##main##/$text/;
    $copy=~s/##title##/$title/;
    $copy=~s/##nav##/$nav/;

    open(OUT,$outfile) or die "Cant open output file $!";
    print OUT $copy;
    close(OUT);

}



