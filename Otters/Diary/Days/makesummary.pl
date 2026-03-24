#!/usr/bin/perl
#
#

@files=glob("DiaryDay*.txt");

foreach(@files){
    open(IN,$_) or die "Error opening $_ is $!";
    $filein=$_;
    $fileout=$filein;
    $fileout=~s/txt/html/;
    print STDERR  "Processing $_\n";

    $nday=$_;
    $nday=~s/DiaryDay//;
    $nday=~s/\.txt//;

    print STDERR "Day ".$nday."\n";

    $day=<IN>;
    $day=~s/--//;
    $short=<IN>;
    $short=~s/==//g;
    $title="Sea Otter Diary - ".$day;

    close(IN);

    
    $line=<<EOF;
<tr><td align=right><a href="$fileout">$day</a></td><td>$short</td></tr>
EOF
    print $line."\n";


}



