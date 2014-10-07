package org.educabrasil.test;

import junit.framework.TestCase;

import org.educabrasil.parsers.OrcamentoParser;
import org.junit.Test;


public class OrcamentoParserTest extends TestCase{

	@Test
	public void testaOrcamentoDeFortalezaDe2012() {
		
		OrcamentoParser orcamentoParser = new OrcamentoParser();
		orcamentoParser.parser(2012, "057");
		Double orcamento = orcamentoParser.pegarOrcamento();
		
		Double orcamentoFortaleza = Double.parseDouble("5056974000.00");
		assertEquals(orcamentoFortaleza, orcamento);
	}

}

