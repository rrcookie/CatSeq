/* DDL statements below for entity sets: Organism, Taxonomy, Genome, Chromosomal, Mitochondrial
*/

CREATE TABLE Organism (
	OrgID		CHAR(4)		NOT NULL,
	Taxonomy	CHAR(4)		NOT NULL,
	CommonName	CHAR(20)	NOT NULL,
	ScientificName	CHAR(20)	NOT NULL,
	FOREIGN KEY 	(Taxonomy) REFERENCES 	Taxonomy (TaxonID),
	PRIMARY KEY	(SpeciesID)
);
CREATE TABLE Taxonomy (
	TaxonID			CHAR(4)		NOT NULL,
	TaxonGenus		CHAR(20)	NOT NULL,
	TaxonFamily		CHAR(20)	NOT NULL,
	TaxonOrder		CHAR(20)	NOT NULL,
	TaxonClass		CHAR(20)	NOT NULL,
	PRIMARY KEY	(TaxonID),
	UNIQUE KEY 	(Genus)
);
CREATE TABLE Genome (
	AssemblyID		CHAR(4)		NOT NULL,
	GenBankAccession	CHAR(20)	NOT NULL,
	SpeciesID		CHAR(4)		NOT NULL,
	ChromCount		INTEGER,
	GenSize			INTEGER,
	GC Content		INTEGER,
	Protein			INTEGER,
	RNA			INTEGER,
	Gene			INTEGER,
	FOREIGN KEY	(SpeciesID) REFERENCES	Organism (OrgID),
	PRIMARY KEY	(AssemblyID),
	UNIQUE KEY	(GenBankAccession)
);
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

/*DML 
*/
INSERT INTO Taxonomy (TaxonID, TaxonGenus) VALUES
		('T00', 'Felis'),
		('T01', 'Lynx'),
		('T02', 'Panthera'),
		('T03', 'Acinonyx'),
		('T04', 'Puma'),
		('T05', 'Prionailurus');
UPDATE Taxonomy
SET		TaxonClass = 'Mammalia',
		TaxonOrder = 'Carnivora',
		TaxonFamily = 'Felidae';

		
