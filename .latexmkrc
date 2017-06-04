$pdf_mode = 1;        # 1: pdflatex, 4: lualatex, 5: xelatex
$postscript_mode = $dvi_mode = 0;
@default_files = ('report.tex');
# %preview_continous_mode = 1;
$use_make_for_missing_files = 1;

# $out_dir = "build";


$pdflatex = 'pdflatex --shell-escape %O %S'; # -interaction=nonstopmode
$xelatex = 'xelatex --shell-escape %O %S'; # -interaction=nonstopmode

add_cus_dep( 'glo', 'gls', 0, 'makeglossaries' );
sub makeglossaries {
	system( "makeglossaries \"$_[0]\"" );
}

add_cus_dep( 'acn', 'acr', 0, 'makeacn2acr' );
sub makeacn2acr {
	system( "makeindex -s \"$_[0].ist\" -t \"$_[0].alg\" -o \"$_[0].acr\" \"$_[0].acn\"" );
}

add_cus_dep("nlo", "nls", 0, "nlo2nls");
sub nlo2nls {
	system("makeindex $_[0].nlo -s nomencl.ist -o $_[0].nls -t $_[0].nlg");
}

add_cus_dep( 'ntn', 'not', 0, 'makentn2not' );
sub makentn2not {
	system("makeindex -s \"$_[0].ist\" -t \"$_[0].nlg\" -o \"$_[0].not\" \"$_[0].ntn\"" );
}

# dependencies for custom indexes using the index package
# examples for sample.tex for index package:
add_cus_dep( 'adx', 'and', 0, 'makeadx2and' );
sub makeadx2and {
	system( "makeindex -o \"$_[0].and\" \"$_[0].adx\"" );
}
add_cus_dep( 'ndx', 'nnd', 0, 'makendx2nnd' );
sub makendx2nnd {
	system( "makeindex -o \"$_[0].nnd\" \"$_[0].ndx\"" );
}
add_cus_dep( 'ldx', 'lnd', 0, 'makeldx2lnd' );
sub makeldx2lnd {
	system( "makeindex -o \"$_[0].lnd\" \"$_[0].ldx\"" );
}
