package com.tnbpda.servlet;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.TreeMap;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;

import com.tnbpda.dao.DAOFactory;
import com.tnbpda.dao.DealerDAO;
import com.tnbpda.dao.RODAO;
import com.tnbpda.util.DealerExcelWrite;
import com.tnbpda.util.TNBPDAConstants;
import com.tnbpda.util.TNBPDAUtil;
import com.tnbpda.vo.CMS;
import com.tnbpda.vo.Dealer;
import com.tnbpda.vo.EDFS;
import com.tnbpda.vo.Generator;
import com.tnbpda.vo.MPD;
import com.tnbpda.vo.POS;
import com.tnbpda.vo.Pump;
import com.tnbpda.vo.RO;
import com.tnbpda.vo.Solar;
import com.tnbpda.vo.Tank;
import com.tnbpda.vo.User;

/**
 * Servlet implementation class DealerController
 */
@WebServlet("/dealer")
public class DealerController extends HttpServlet implements TNBPDAConstants {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public DealerController() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		doPost(request, response);

	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		int option = 0;
		String strOption = request.getParameter("option");
		String strMod = request.getParameter("mod");
		if (strMod == null) {
			strMod = "dealer";
		}
		if (strOption != null) {
			option = Integer.parseInt(strOption);
		}
		String targetPage = null;
		HttpSession session = request.getSession();
		DAOFactory daoF = DAOFactory.getDAOFactory(4);
		DealerDAO dealerDAO = daoF.getDealerDAO();
		RODAO roDAO = daoF.getRODAO();
		Dealer nallaya = new Dealer();
		RO ro = new RO();

		switch (option) {
		case 0: // dealer's home page
			targetPage = "/jsp/dealer/welcome.jsp";
			break;
		case 1: // add New Dealer
			targetPage = "/jsp/dealer/dealer.jsp";
			break;
		case 2: // Update Dealer details
			updateDealer(nallaya, request);
			dealerDAO.updateDealer(nallaya);
			nallaya = dealerDAO.readDealer(nallaya);
			session.setAttribute(AUTH_USER, nallaya);
			request.setAttribute(UPDATE_DEALER, nallaya);
			if (nallaya.isStatus())
				request.setAttribute(STATUS, "Y");
			else
				request.setAttribute(STATUS, "N");
			// targetPage = "/jsp/dealer/status.jsp";
			ro.setCcNo(request.getParameter("ccNo"));
			ro = roDAO.readRO(ro);
			request.setAttribute(RO, ro);
			targetPage = "/jsp/dealer/ro.jsp";
			break;
		case 3: // show Dealer page or upload picture.
			String strPic = request.getParameter("up");
			if (strPic != null && strPic.equals("P")) {
				targetPage = "/jsp/dealer/update_picture.jsp";
			} else {
				targetPage = "/jsp/dealer/update_dealer.jsp";
			}
			break;
		case 4: // retrieve Dealer List
			List<Dealer> list = dealerDAO.retrieveDealers(nallaya);
			// set the
			updateDealer(session, list);
			request.setAttribute(DEALERS_LIST, list);
			targetPage = "/jsp/dealer/list.jsp";
			break;
		case 5: // update RO details
			ro.setCcNo(request.getParameter("ccNo"));
			EDFS edfs = new EDFS();
			edfs.setAvailed(request.getParameter("EDFS").equalsIgnoreCase("Yes"));
			String s ="-NA-";
			if(edfs.isAvailed()){
				s = request.getParameter("EDFSBank");
				if(s.equalsIgnoreCase("Other"))
					s = request.getParameter("EDFSBankOther");
			}
			edfs.setBank("Here--->"+s);
			System.out.println(edfs.getBank());
			ro.setEdfs(edfs);
			updateRO(ro, request);

			roDAO.updateRO(ro);
			prepareExcel(  response,  session,   dealerDAO,  roDAO,   nallaya,   ro,false);
			
			ro = roDAO.readRO(ro);
			session.setAttribute(RO, ro);
			request.setAttribute(STATUS, "Y");
			targetPage = "/jsp/dealer/status.jsp";
			break;
		case 6: // read RO Details
			ro.setCcNo(request.getParameter("ccNo"));
			ro = roDAO.readRO(ro);
			System.out.println("Going Here");
			request.setAttribute(RO, ro);
			targetPage = "/jsp/dealer/ro.jsp";
			break;

		case 8: // view RO Details
			ro.setCcNo(request.getParameter("ccNo"));
			ro = roDAO.readRO(ro);
			System.out.println("Going Here");
			request.setAttribute(RO, ro);
			targetPage = "/jsp/dealer/ro_view.jsp";
			break;
		case 9: // delete Dealer
			nallaya.setCcNo(Integer.parseInt(request.getParameter("ccNo")));
			request.setAttribute(DEALERS_LIST, dealerDAO.deleteDealer(nallaya));
			targetPage = "/jsp/dealer/list.jsp";
			break;

		}
		if (option != 10) {
			request.setAttribute("module", strMod);
			request.getRequestDispatcher(targetPage).forward(request, response);
		} else {
			// download excel format.
			System.out.println("processing... download excel case.");
			prepareExcel(  response,  session,   dealerDAO,  roDAO,   nallaya,   ro,true);
		}
		System.out.println("ALL dOWN ");
	}
	private void prepareExcel(HttpServletResponse response,HttpSession session, DealerDAO dealerDAO,RODAO roDAO, Dealer nallaya, RO ro,boolean isDownload) {
		List<Dealer> dealerlist = dealerDAO.retrieveDealers(nallaya);
		List<RO> roList = roDAO.retrieveAllRos(ro);
		// set the
		updateDealer(session, dealerlist);
		generateExcel(response, dealerlist, roList, isDownload);
	}
	/**
	 * 
	 * @param response
	 * @param listDealer
	 * @param roList
	 */
	private void generateExcel(HttpServletResponse response,
			List<Dealer> listDealer, List<RO> roList, boolean isDownload) {
		try {

			// XSSFWorkbook workbook =
			// DealerExcelWrite.bothSheet(listDealer,roList);
			HSSFWorkbook workbook = DealerExcelWrite.bothSheet(listDealer,
					roList);
			if(isDownload){
			downloadExcel(response, workbook);
			} else{
				writeToExcel(response, workbook);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	/**
	 * 
	 * @param response
	 * @param workbook
	 */
	private void downloadExcel(HttpServletResponse response,
			HSSFWorkbook workbook) {
		try {
			response.setContentType("application/vnd.ms-excel");
			response.setHeader("Content-Disposition",
					"attachment; filename=DealerInfo_" + TNBPDAUtil.now()
							+ ".xls");
			workbook.write(response.getOutputStream());
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	/**
	 * 
	 * @param response
	 * @param workbook
	 */
	private void writeToExcel(HttpServletResponse response,
			HSSFWorkbook workbook) {
		String fName = "C:\\tnbpda\\_obj\\Excel\\Dealers.xls";
		try {
			FileOutputStream fos = new FileOutputStream(new File(fName));	
			
			workbook.write(fos);
			
		} catch (Exception e) {
			 
		}
	}

	/**
	 * 
	 * @param nallaya
	 * @param request
	 */
	private static void updateDealer(Dealer nallaya, HttpServletRequest request) {
		nallaya.setCcNo(Integer.parseInt(request.getParameter("ccNo")));
		nallaya.setUserName(String.valueOf(nallaya.getCcNo()));
		nallaya.setFirstName(request.getParameter("fName"));
		nallaya.setLastName(request.getParameter("lName"));
		nallaya.setDateOfBirth(request.getParameter("dob"));
		nallaya.setMobileNo(request.getParameter("mob"));
		nallaya.setLandLine(request.getParameter("land"));
		nallaya.setEmailID(request.getParameter("email"));
		nallaya.setOfficialEmailId(request.getParameter("emailOff"));

		nallaya.setAddress1(request.getParameter("addr1"));
		nallaya.setAddress2(request.getParameter("addr2"));
		nallaya.setCity(request.getParameter("post"));
		nallaya.setPost(request.getParameter("post"));
		nallaya.setZipCode(Integer.parseInt(request.getParameter("zip")));
		nallaya.setDistrict(request.getParameter("dr"));

		nallaya.setSupplyLocation(request.getParameter("sl"));
		nallaya.setTerriority(request.getParameter("tr"));
		nallaya.setClubMember(request.getParameter("clubMember"));
	}

	/**
 * 
 * 
 * */
	private static void updateRO(RO ro, HttpServletRequest request) {
		try {
			Map<String, Tank> mapTank = ro.getTankList();
			Map<String, MPD> mpdMap = ro.getMpdList();
			Map<String, Pump> pumpMap = ro.getPumpList();
			EDFS edfs = new EDFS();
			if(ro.getEdfs()!=null)
				edfs = ro.getEdfs();
			getTankDetails(mapTank, request);

			// ** */
			getNozzleDetails(mpdMap, request);

			getPumpDetails(pumpMap, request);
			getEDFSDetails(edfs, request);
			ro.setCommisionDate(request.getParameter("dob"));
			ro.setRot(request.getParameter("rot"));

			ro.setGeneralComments(request.getParameter("gc"));
			ro.setDealShipStatus(request.getParameter("sds"));
			ro.setRoType(request.getParameter("roType"));
			ro.setLorry12kl(Integer.parseInt(request.getParameter("12kl")));
			ro.setLorry20kl(Integer.parseInt(request.getParameter("20kl")));
			ro.setLorry24kl(Integer.parseInt(request.getParameter("24kl")));

			ro.setExplosiveLic(request.getParameter("explosiveNo"));
			otherFeatures(ro, request);
			ro.setUpdated(true);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	private static void getEDFSDetails(EDFS edfs, HttpServletRequest request) {
		// TODO Auto-generated method stub
		edfs.setAvailed(request.getParameter("EDFS").equalsIgnoreCase("Yes"));
		String s ="-NA-";
		if(edfs.isAvailed()){
			s = request.getParameter("EDFSBank");
			if(s.equalsIgnoreCase("Other"))
				s = request.getParameter("EDFSBankOther");
		}
		edfs.setBank(s);
		System.out.println(edfs.getBank());
	}

	/**
	 * 
	 * @param pumpMap
	 * @param request
	 */
	private static void getPumpDetails(Map<String, Pump> pumpMap,
			HttpServletRequest request) {
		Pump pump = pumpMap.get(MIDCO);
		pump.setYear(Integer.parseInt(request.getParameter("midcoYr")));
		pump.setUnit(Integer.parseInt(request.getParameter("midcoQty")));

		pump = pumpMap.get(LT);
		pump.setYear(Integer.parseInt(request.getParameter("ltYr")));
		pump.setUnit(Integer.parseInt(request.getParameter("ltQty")));

		pump = pumpMap.get(GILBERGO);
		pump.setYear(Integer.parseInt(request.getParameter("gilbergoYr")));
		pump.setUnit(Integer.parseInt(request.getParameter("gilbergoQty")));

		pump = pumpMap.get(WAYNE);
		pump.setYear(Integer.parseInt(request.getParameter("wayneYr")));
		pump.setUnit(Integer.parseInt(request.getParameter("wayneQty")));

		pump = pumpMap.get(TOKHEIM);
		pump.setYear(Integer.parseInt(request.getParameter("tokheimYr")));
		pump.setUnit(Integer.parseInt(request.getParameter("tokheimQty")));

	}

	/**
	 * 
	 * @param ro
	 * @param request
	 */
	private static void otherFeatures(RO ro, HttpServletRequest request) {
		String isCanopy = request.getParameter("can");
		if (isCanopy != null && isCanopy.equals("Y")) {
			ro.setCanopy(true);
			ro.setCanopyLights(request.getParameter("Canopylights"));
		}
		ro.setStreetLights(request.getParameter("Streetlights"));
		String pav = request.getParameter("pav");
		if (pav != null && pav.equals("Y")) {
			ro.setPayOver(true);
		}
		String atm = request.getParameter("atm");
		if (atm != null && atm.equals("Y")) {
			ro.setATM(true);
		}
		String inout = request.getParameter("inout");
		if (inout != null && inout.equals("Y")) {
			ro.setInOut(true);
		}
		String automated = request.getParameter("automated");
		if (automated != null && automated.equals("Y")) {
			ro.setAutomated(true);
		}
		String cms = request.getParameter("cms");
		if (cms != null && cms.equals("Y")) {
			CMS fleet = ro.getFleet();
			fleet.setAvaialble(true);
			fleet.setMacType(request.getParameter("cmsType"));
			// ro.setCms(true);
		}
		String pos = request.getParameter("pos");
		if (pos != null && pos.equals("Y")) {
			POS posMac = ro.getPos();
			posMac.setAvailable(true);
			posMac.setBanks(request.getParameter("posBanks"));
			posMac.setQuantity(Integer.parseInt(request
					.getParameter("posQuantity")));
		}

		String generator = request.getParameter("generator");
		if (generator != null && generator.equals("Y")) {

			Generator mahandra = ro.getGenerator();
			mahandra.setAvailable(true);
			mahandra.setCapacity(Integer.parseInt(request
					.getParameter("gcapacity")));
			mahandra.setMake(request.getParameter("generatorMake"));

		}

		String solar = request.getParameter("solar");
		if (solar != null && solar.equals("Y")) {

			Solar solarObj = ro.getSolar();
			solarObj.setAvailable(true);
			solarObj.setCapacity(Integer.parseInt(request
					.getParameter("scapacity")));
			solarObj.setMake(request.getParameter("solarMake"));

		}

	}

	private static void getTankDetails(Map<String, Tank> mapTank,
			HttpServletRequest request) {
		Tank tank = new Tank();
		tank.setNoOfTanks(Integer.parseInt(request.getParameter("mst")));
		tank.setCapacity(Integer.parseInt(request.getParameter("mss")));
		mapTank.replace(MS, tank);

		tank = new Tank();
		tank.setNoOfTanks(Integer.parseInt(request.getParameter("speedt")));
		tank.setCapacity(Integer.parseInt(request.getParameter("speeds")));
		mapTank.replace(SPEED, tank);

		tank = new Tank();
		tank.setNoOfTanks(Integer.parseInt(request.getParameter("speed97t")));
		tank.setCapacity(Integer.parseInt(request.getParameter("speed97s")));
		mapTank.replace(SPEED97, tank);

		tank = new Tank();
		tank.setNoOfTanks(Integer.parseInt(request.getParameter("hsdt")));
		tank.setCapacity(Integer.parseInt(request.getParameter("hsds")));
		mapTank.replace(HSD, tank);

		tank = new Tank();
		tank.setNoOfTanks(Integer.parseInt(request.getParameter("hispeedt")));
		tank.setCapacity(Integer.parseInt(request.getParameter("hispeeds")));
		mapTank.replace(HISPEED, tank);

	}

	private static void getNozzleDetails(Map<String, MPD> mpdMap,
			HttpServletRequest request) {
		MPD mpd = new MPD();
		mpd.setNoOfNozzle(Integer.parseInt(request.getParameter("msz")));
		mpd.setAverageSales(Integer.parseInt(request.getParameter("mszs")));
		mpdMap.replace(MS, mpd);

		mpd = new MPD();
		mpd.setNoOfNozzle(Integer.parseInt(request.getParameter("speedz")));
		mpd.setAverageSales(Integer.parseInt(request.getParameter("speedzs")));
		mpdMap.replace(SPEED, mpd);

		mpd = new MPD();
		mpd.setNoOfNozzle(Integer.parseInt(request.getParameter("speed97z")));
		mpd.setAverageSales(Integer.parseInt(request.getParameter("speed97zs")));
		mpdMap.replace(SPEED97, mpd);

		mpd = new MPD();
		mpd.setNoOfNozzle(Integer.parseInt(request.getParameter("hsdz")));
		mpd.setAverageSales(Integer.parseInt(request.getParameter("hsdzs")));
		mpdMap.replace(HSD, mpd);

		mpd = new MPD();
		mpd.setNoOfNozzle(Integer.parseInt(request.getParameter("hspeedz")));
		mpd.setAverageSales(Integer.parseInt(request.getParameter("hspeedzs")));
		mpdMap.replace(HISPEED, mpd);

	}

	/**
	 * 
	 * @param session
	 * @param list
	 */
	private static void updateDealer(HttpSession session, List<Dealer> list) {

		TreeMap<String, String> district = (TreeMap<String, String>) session
				.getAttribute(TNBPDAConstants.DISTRICT);

		HashMap<String, String> supply = (HashMap<String, String>) session
				.getAttribute(TNBPDAConstants.SUPPLY);
		Iterator<Map.Entry<String, String>> its = supply.entrySet().iterator();
		HashMap<String, String> terriority = (HashMap<String, String>) session
				.getAttribute(TNBPDAConstants.TERRIORITY);
		Iterator<Map.Entry<String, String>> itt = terriority.entrySet()
				.iterator();
		for (Dealer panneer : list) {
			Iterator<Map.Entry<String, String>> itd = district.entrySet()
					.iterator();
			String dis = panneer.getDistrict();
			String sl = panneer.getSupplyLocation();
			String tr = panneer.getTerriority();
			// district.get(key)
			while (itd.hasNext()) {
				Map.Entry<String, String> me = itd.next();
				if (me.getValue().equals(panneer.getDistrict())) {
					panneer.setDistrict(me.getKey());
					break;
				}
			}
			panneer.setSupplyLocation(supply.get(sl));
			panneer.setTerriority(terriority.get(tr));
		}
	}
}
