# compile in PDF mode
$pdf_mode = 1;

# output all files to a dedicated output directory
$out_dir = "out";

# make sure that eexam.cls is on the LaTeX search path
ensure_path( 'TEXINPUTS', '..' );
