#!/usr/bin/perl -w
while ($line = <>){
	push @order, $line;
	@array = split / /, $line;
	foreach $n (@array){
		if ( $n =~ /(\-?\d*\.?\d+)/){
			# print $1;
			push @lis , $1
		}
	}
	if ($#lis == -1 ){
		next;
	}

	my $num = (sort {$b <=> $a} @lis)[0];
	# print $num;
	if ( $num =~ /(\-?\d*\.0$)/ ) {
		$num =~ s/.0//;
	}
	$dic{$line} = $num;
	push @compare , $num;
	# @di = keys %dic;
	# foreach $v (@di){
	# 	print "$dic{$v} ==> $v";
	# }
	@lis = ();
}

my $mx = (sort {$b <=> $a} @compare)[0];
@di = keys %dic;
foreach $w (@di){
	if ( $dic{$w} eq $mx ){
		push @result,$w;
	}
}

foreach $s (@order){
	if ( grep /$s/ ,@result ) {
		print $s;
	}
}

