CREATE DATABASE CatSeqDB;
USE CatSeqDB;

/* DDL statements below for entity sets: Organism, Taxonomy, Genome,
(Chromosomal, Mitochondrial commented out until more assemblies have relevent data)
*/
CREATE TABLE Taxonomy (
	TaxonID	CHAR(4)	NOT NULL,
	TaxonGenus CHAR(20) NOT NULL,
	TaxonFamily CHAR(20) DEFAULT 'Felidae',
	TaxonOrder CHAR(20) DEFAULT 'Carnivora',
	TaxonClass CHAR(20) DEFAULT 'Mammalia',
	PRIMARY KEY (TaxonID),
	UNIQUE KEY (TaxonGenus)
);

CREATE TABLE Organism (
	OrgID CHAR(4) NOT NULL,
	Taxonomy CHAR(4) NOT NULL,
	CommonName CHAR(50) NOT NULL,
	ScientificName CHAR(100) NOT NULL,
	FOREIGN KEY  (Taxonomy) REFERENCES Taxonomy (TaxonID),
	PRIMARY KEY (OrgID)
);

CREATE TABLE Genome (
	AssemblyID CHAR(4) NOT NULL,
	FNAFile	 CHAR(100) NOT NULL,
	GenBankAccession CHAR(20) NOT NULL,
	SpeciesID CHAR(4) NOT NULL,
	AssemblyLevel CHAR(20) NOT NULL,
	GenSize DOUBLE,
	ChromCount INTEGER,
	FOREIGN KEY (SpeciesID) REFERENCES Organism (OrgID),
	PRIMARY KEY (AssemblyID),
	UNIQUE KEY (GenBankAccession),
	UNIQUE KEY (FNAFile)
);

/*
CREATE TABLE Chromosomal (
	ChromoID	CHAR(4)		NOT NULL,
	GenomeID	CHAR(4)		NOT NULL,
	Name		CHAR(20)	NOT NULL,
	CrSize		INTEGER,
	GC Content 	INTEGER,
	Protein 	INTEGER,
	RNA		INTEGER,
	Gene		INTEGER,
	FOREIGN KEY	(GenomeID) REFERENCES Genome (AssemblyID),
	PRIMARY KEY	(ChromoID)
);
CREATE TABLE Mitochondrial (
	MtID		CHAR(4)		NOT NULL,
	GenomeID	CHAR(4)		NOT NULL,
	MtSize		INTEGER,
	GC Content 	INTEGER,
	Protein 	INTEGER,
	RNA		INTEGER,
	Gene		INTEGER,
	FOREIGN KEY	(GenomeID) REFERENCES	Genome (AssemblyID),
	PRIMARY KEY	(MtID)
);
*/

/*DML for tables Taxonomy, Organism, and Genome
*/
INSERT INTO Taxonomy (TaxonID, TaxonGenus) VALUES
	('T01', 'Felis'),
	('T02', 'Lynx'),
	('T03', 'Panthera'),
	('T04', 'Acinonyx'),
	('T05', 'Puma'),
	('T06', 'Prionailurus');
		
INSERT INTO Organism VALUES
	('O01', 'T01', 'Domestic cat', 'Felis catus'),
	('O02', 'T01', 'Black-footed cat', 'Felis nigripes'),
	('O03', 'T02', 'Canadian lynx', 'Lynx canadensis'),
	('O04', 'T02', 'Spanish lynx', 'Lynx pardinus'),
	('O05', 'T03', 'Lion', 'Panthera leo'),
	('O06', 'T03', 'Jaguar', 'Panthera onca'),
	('O07', 'T03', 'Amur tiger', 'Panthera tigris altaica'),
	('O08', 'T03', 'Leopard', 'Panthera pardus'),
	('O09', 'T04', 'Cheetah', 'Acinonyx jubatus'),
	('O10', 'T05', 'Puma', 'Puma concolor'),
	('O11', 'T06', 'Amur leopard cat', 'Prionailurus bengalensis euptilurus');

INSERT INTO Genome VALUES
	('A01', 'GCA_008795835.1_PanLeo1.0_genomic.fna', 'GCA_008795835.1', 'O05', 'Chromosome', 2406807619, 19),
	('A02', 'GCA_007474595.1_mLynCan4_v1.p_genomic.fna', 'GCA_007474595.1', 'O03', 'Chromosome', 2408883772, 19),
	('A10', 'GCA_000181335.4_Felis_catus_9.0_genomic.fna', 'GCA_000181335.4', 'O01', 'Chromosome', 2521863845, 19),
	('A14', 'GCA_000003115.1_catChrV17e_genomic.fna', 'GCA_000003115.1', 'O01', 'Chromosome', 3160286939, 19);
INSERT INTO Genome(AssemblyID, FNAFile, GenBankAccession, SpeciesID, AssemblyLevel, GenSize) VALUES
	('A03', 'GCA_005406085.1_Prionailurus_bengalensis_euptilurus_v01_genomic.fna', 'GCA_005406085.1', 'O11', 'Scaffold', 2435348619),
	('A04', 'GCA_900661375.1_LYPA1.0_genomic.fna', 'GCA_900661375.1', 'O04', 'Scaffold', 2413208909),
	('A05', 'GCA_004123975.1_Pco_k61_genomic.fna', 'GCA_004123975.1', 'O10', 'Scaffold', 2591702724),
	('A06', 'GCA_004023925.1_FelNig_v1_BIUU_genomic.fna', 'GCA_004023925.1', 'O02', 'Scaffold', 2428424918),
	('A07', 'GCA_004023805.1_PanOnc_v1_BIUU_genomic.fna', 'GCA_004023805.1', 'O06', 'Scaffold', 2504534411),
	('A08', 'GCA_003709585.1_Aci_jub_2_genomic.fna', 'GCA_003709585.1', 'O09', 'Scaffold', 2384834280),
	('A09', 'GCA_003327715.1_PumCon1.0_genomic.fna', 'GCA_003327715.1', 'O10', 'Scaffold', 2432966684),
	('A11', 'GCA_001857705.1_PanPar1.0_genomic.fna', 'GCA_001857705.1', 'O08', 'Scaffold', 2578019207),
	('A12', 'GCA_001443585.1_aciJub1_genomic.fna', 'GCA_001443585.1', 'O09', 'Scaffold', 2372536860),
	('A13', 'GCA_000464555.1_PanTig1.0_genomic.fna', 'GCA_000464555.1', 'O07', 'Scaffold', 2391082183);
