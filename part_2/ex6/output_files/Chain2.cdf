/* Quartus Prime Version 16.0.0 Build 211 04/27/2016 SJ Standard Edition */
JedecChain;
	FileRevision(JESD32A);
	DefaultMfr(6E);

	P ActionCode(Ign)
		Device PartName(5CSEMA5F31) MfrSpec(OpMask(0) FullPath("C:/New folder/ex6/output_files/ex6.sof"));
	P ActionCode(Cfg)
		Device PartName(5CSEMA5F31) Path("C:/New folder/ex6/output_files/") File("ex6.sof") MfrSpec(OpMask(1));

ChainEnd;

AlteraBegin;
	ChainType(JTAG);
AlteraEnd;
