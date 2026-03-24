#!/usr/bin/perl

$template="template.html";

@pages=qw(Introduction Travel Camp People Otters Scenery Animals Diary Links);


foreach(@pages){
    $pagetitle=$_;
    $page=$pagetitle.".html";
    print "Building ".$page."\n";

    open(TEXT,$pagetitle.".text") or next;
    @text=<TEXT>;
    close(TEXT);

    open(PICS,$pagetitle.".pictures") or next;
    @pics=<PICS>;
    close(PICS);

    print "Got text and pictures\n";

    open(OUTPUT,">".$pagetitle.".html") or die "Cant open output file ".$!."\n";

    open(TEMPLATE,"template.html") or die "Cant open template file ".$!."\n";

    while(<TEMPLATE>){
	if($_ eq "<!--TITLE-->\n"){
	    print OUTPUT $pagetitle."\n";
	}elsif($_ eq "<!--TEXT-->\n"){
	    print "Text\n";
	    print OUTPUT @text;
	}elsif($_ eq "<!--PICTURES-->\n"){
	    print "Pictures\n";
	    print OUTPUT @pics;
	}else{
	    print OUTPUT $_;
	}

    }
    close(OUTPUT);
    close(TEMPLATE);

}
