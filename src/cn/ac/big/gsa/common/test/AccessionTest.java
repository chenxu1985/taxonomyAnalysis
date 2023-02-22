package cn.ac.big.gsa.common.test;

import static org.junit.Assert.assertEquals;

import javax.annotation.Resource;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.test.annotation.DirtiesContext;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import cn.ac.big.gsa.common.dao.AccessionMapper;
import cn.ac.big.gsa.common.init.AccessionInit;

@RunWith(SpringJUnit4ClassRunner.class)
@DirtiesContext
@ContextConfiguration(locations = { "classpath:applicationContext-common.xml" })
public class AccessionTest {

	@Resource(name = "accessionMapper")
	private AccessionMapper accessionMapper;
	
	@Resource(name="accessionInit")
	private AccessionInit accessionInit;
	
	@Test
	public void testSelectMaxPrjAcc(){
		String acc = this.accessionMapper.selectMaxPrjAcc();
		assertEquals("PRJCA000002",acc);
	}
	
	@Test
	public void testInitAccession(){
		accessionInit.init();
	}
}
