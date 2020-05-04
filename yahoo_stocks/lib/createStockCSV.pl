# /home/ericm/tmp/money/yahooStocks/secondStockCSV.pl
# //cygdrive/c/EKM/yahooStocks 
# "Description","1-Day Price Chg %","Market Cap","P/E","ROE %","Div. Yield %","Debt to Equity","Price to Book","Net Profit Margin (mrq)","Price To Free Cash Flow (mrq)"

mainSub();

# /home/ericm/tmp/money/yahooStocks/work.pl
# //cygdrive/c/EKM/yahooStocks 
# "Description","1-Day Price Chg %","Market Cap","P/E","ROE %","Div. Yield %","Debt to Equity","Price to Book","Net Profit Margin (mrq)","Price To Free Cash Flow (mrq)"


sub mainSub() {
    $TIME_VAR = `date +%Y-%m-%d_%H.%M.%S`;
    $ITME_VAR = chomp $TIME_VAR;
    $some_dir = "./";

    open( CSVFILELIST, "yahoo.stock.csv.files.txt" );
    $fileCount = 0;
    
    $dateCommand = "date  +%Y-%m-%d_%H:%M:%S";
    $headerString = "Description,1-Day Price Chg \%,Market Cap,P/E,ROE \%,Div. Yield \%,Debt to Equity,Price to Book,Net Profit Margin (mrq),Price To Free Cash Flow (mrq),Sector,Industry";

    while ( <CSVFILELIST> ) {
        $fileCount++;
        print `uname -a`;
        print "\n";
        $downloadFileName = $_;
        print `$dateCommand`;
        print "\n";
        $pingCommand = "ping -c4 " + $downloadFileName;
        # print "$downloadFileName\n";
        $output = `wget $downloadFileName`; # | grep -v \'Debt to Equity\' | cat >> output.csv`;
        print "Result for file $downloadFileName: $output\n";
        print "\n-------------\n";
        sleep( 1 );
    } # while ( <CSVFILELIST> )

    close CSVFILELIST;

    # $command = `cat *csv >> zzz.txt`;
    # $command = `rm -v *csv`;
    # $command = `mv -v zzz.txt output.csv`;
    $outputFile = $some_dir . "anotherOutput.txt";
    open( OUTFILE001, ">$outputFile" ) || die "cannot open $outputFile: $!";
    print OUTFILE001 "$headerString\n";
    close OUTFILE001;
    opendir( DIR, $some_dir ) || die "can't opendir $some_dir: $!";
    # ORIG: @dots = grep { /^\./ && -f "$some_dir/$_" } readdir( DIR );
    @dots = grep { /.*conameu.csv$/ && -f "$some_dir/$_" } readdir( DIR ); # just get the *.csv files
    foreach my $dotItem ( @dots ) {
        print "Here is \$dotItem: $dotItem\n";
        getIndustryAndSector( $dotItem, $outputFile );
    } # foreach my $dotItem ( @dots )
    closedir DIR;
    $command = "mv -v $outputFile $some_dir" . "output.$TIME_VAR.csv";
    print `$command`;
    
} # end sub mainSub()

sub getIndustryAndSector(  ) {
    print "starting sub getIndustryAndSector\n";
    # my ( $argImage, $argIncludePath, $argBannerPath ) = @_;
    my ( $csvFileName, $outFile ) = @_;
    my $linesInFile = 0;
    my $downloadFileLine = "";
    # get number of lines in file
    open ( CSVFILE, $csvFileName ) or die "Can't open '$csvFileName': $!";
    $linesInFile++ while ( <CSVFILE> );
    close CSVFILE;
    print "Line count in file $csvFileName: $linesInFile\n"; 
    
    open( CSVFILE002, $csvFileName ) or die "Can't open '$csvFileName': $!"; 
    open( OUTFILE, ">>$outFile" )  or die "Can't open '$outFile': $!";
    my $lineNum = 0;
    my $industry;
    my $sector;
    while ( <CSVFILE002> ) {
        ++$lineNum;
        $downloadFileLine = $_ ;
        # $downloadFileName = chomp $downloadFileName;
        print "Length of line $lineNum: " . length( $downloadFileLine ) . "\n";
        print "Here is the line $lineNum: $downloadFileLine\n";
        if ( $lineNum == $linesInFile ) {
            print "At last line of csv file, skipping\n";
        } else {
            # "Agrium Inc.",0.740,6.44B,6.096,29.042,0.300,"NA",1.585,-3.423,500.449
            # "American Vanguard Corp.",-0.760,282.09M,15.101,12.764,1.000,"NA",1.802,1.566,-9.531
            # # /(\".*\"),(\d+\.\d+),(\d+\.\d+\w)(.*)/;
            $downloadFileLine =~ /^(\".*\"),(.*),(.*),(.*),(.*),(.*),(.*),(.*),(.*),(.*)/;
            
            $Description = $1;
            $OneDayPriceChg = $2;
            $marketCap = $3; # Market Cap
            $PERatio = $4;
            $ROE = $5;
            $DivYield = $6;
            $DebtToEquity = $7;
            $PriceToBook = $8;
            $NetProfitMarginMRQ = $9;
            $PriceToFreeCashFlowMRQ = $10;
            if ( $lineNum == 1 ) {
                print "Keep going\n";
            } elsif ( $lineNum == 2 ) {
                $sector = $Description;
            } elsif ( $lineNum == 3 ) {
                $industry = $Description;
            } else {
                if ( $marketCap =~ /.*B/ ) {
                    print "Market cap is in billions: $marketCap";
                    $marketCap =~ s/B//;
                    $marketCap = $marketCap * 1000000000;
                    print " - new market cap: " . commify( $marketCap ) . "\n";
                } elsif ( $marketCap =~ /.*M/ ) {
                    print "Market cap is in millions: $marketCap";
                    $marketCap =~ s/M//;
                    $marketCap = $marketCap * 1000000;
                    print " - new market cap: " . commify( $marketCap ) . "\n";
                } else {
                    print "Market cap is NA: $marketCap\n";
                } # if ( $marketCap =~ /.*B/ ) 
                
                #########
                if ( $OneDayPriceChg eq "\"NA\"" ) { $OneDayPriceChg = "null"; }
                if ( $marketCap eq "\"NA\"" ) { $marketCap = "null"; } 
                if ( $PERatio eq "\"NA\"" ) { $PERatio = "null"; }
                if ( $ROE eq "\"NA\"" ) { $ROE = "null"; }
                if ( $DivYield eq "\"NA\"" ) { $DivYield = "null"; }
                if ( $DebtToEquity eq "\"NA\"" ) { $DebtToEquity = "null"; }
                if ( $PriceToBook eq "\"NA\"" ) { $PriceToBook = "null"; }
                if ( $NetProfitMarginMRQ eq "\"NA\"" ) { $NetProfitMarginMRQ = "null"; }
                if ( $PriceToFreeCashFlowMRQ eq "\"NA\"" ) { $PriceToFreeCashFlowMRQ = "null"; }
                #########
                
                print OUTFILE "$Description,$OneDayPriceChg,$marketCap,$PERatio,$ROE,$DivYield,$DebtToEquity,$PriceToBook,";
                print OUTFILE "$NetProfitMarginMRQ,$PriceToFreeCashFlowMRQ,$sector,$industry\n";
                
                print "\n";
            } # if ( $lineNum == 1 ) / else / else
        } # if ( $lineNum == $linesInFile )
    } # while ( <CSVFILE002> ) 
    close CSVFILE002;
    close OPTFILE;
    print "ending sub getIndustryAndSector\n";
} # end sub getIndustryAndSector

sub commify {
    my $text = reverse $_[ 0 ];
    $text =~ s/(\d\d\d)(?=\d)(?!\d*\.)/$1,/g;
    return scalar reverse $text;
} # end commify

# EOF

