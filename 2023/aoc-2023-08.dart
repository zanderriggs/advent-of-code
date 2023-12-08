void main() {
  var steps = travelMap(parseInput(input));

  print("Number of steps: $steps");
}

int travelMap(Map map) {
  // Start the recursive traversal from the initial point
  return traverse(map, map.points.first, 0, 0);
}

int traverse(Map map, Point currentPoint, int count, int steps) {
  // Base case: Stop when the current point is "ZZZ"
  if (currentPoint.name == "ZZZ") {
    return steps;
  }
  if (count >= map.directions.length) {
    count = 0;
  }

  // Determine the next direction based on the map's directions
  var direction = map.directions[count];

  // Update the current point based on the chosen direction
  var nextPointName =
      (direction == "L") ? currentPoint.left : currentPoint.right;
  var nextPoint = map.points.firstWhere((point) => point.name == nextPointName);

  // Recursively traverse to the next point
  return traverse(map, nextPoint, count + 1, steps + 1);
}

Map parseInput(String input) {
  var splitInput = input.split("\n");
  var pointList = <Point>[];
  var map = new Map(splitInput.first, pointList);

  var regex = new RegExp(r'[a-zA-Z]{3}');

  for (var i = 2; i < splitInput.length; i++) {
    // Map Name
    var name = splitInput[i].split("=").first.trim();

    // Left Point
    var left = regex
        .firstMatch(splitInput[i].split("=").last.split(",").first)!
        .group(0)
        .toString();
    // print("Left Point: $left");

    // Right Point
    var right = regex
        .firstMatch(splitInput[i].split("=").last.split(",").last)!
        .group(0)
        .toString();
    // print("Right Point: $right");

    map.points.add(new Point(name, left, right));
  }

  return map;
}

class Map {
  String directions;
  List<Point> points;

  Map(this.directions, this.points);
}

class Point {
  String name;
  String left;
  String right;

  Point(this.name, this.left, this.right);
}

var input = '''LLR

AAA = (BBB, BBB)
BBB = (AAA, ZZZ)
ZZZ = (ZZZ, ZZZ)''';

// var input =
//     '''LLRRLRRRLLRLRRLLLLRLRRLRRRLRLRRRLLRRLRRRLLRRLRRLRRLLRRRLRRLRRLRRRLRRLRLRLRRLRRLRRRLLRRLLLRRLRRRLRRRLRRRLRRLRRRLRLLRLRRRLRLRRLLRLRRRLRRRLRLRRRLRRRLRLRLRRLRRLRLRRLLRRRLRRRLRRRLLRRRLRLRLRLRLLRRRLRRRLRRLRRRLLRLRRLRRLRRRLRRRLRRLRLRLRRRLRRLRRLRRRLLRRLRLRLRRRLRLRLRRLRRLLRRLRRRLLRLLRLRLRRRR

// FGF = (HTC, DTX)
// PTP = (MCL, BDN)
// LHL = (LJF, BDX)
// XMM = (KCX, JHL)
// GLD = (RNN, MXG)
// HSR = (JPX, CXF)
// CRF = (BMJ, FHT)
// QSS = (KPH, FVD)
// RHV = (LRD, XDS)
// KTT = (XPS, VCX)
// LQK = (TLF, VJX)
// MMK = (VJV, HQV)
// RKX = (RKG, XJB)
// HDM = (NFK, JNB)
// PFJ = (QDJ, NDH)
// JKB = (MDK, MRJ)
// BSP = (QBQ, JPM)
// FQH = (HJD, VHF)
// QQL = (VDB, KGM)
// TRB = (KTC, RGN)
// VXC = (NDK, MVK)
// BCS = (PSX, PLK)
// FHK = (MLK, RDP)
// TVB = (JXV, SSR)
// GXD = (KSF, BRK)
// MNJ = (MHG, CRF)
// RLC = (TGD, CHV)
// LBQ = (NQK, MHP)
// JLH = (FGB, KNM)
// PCN = (CQF, NDF)
// FVP = (NKS, RCB)
// GHL = (TTB, KLQ)
// MTB = (VDM, FKT)
// LLB = (VXL, TRT)
// RSS = (GDP, TKD)
// SFH = (FCM, GKF)
// KSF = (VQB, JXJ)
// LJH = (PNS, DGC)
// TJC = (KQM, BVL)
// PRL = (TCG, GCQ)
// NBG = (GNR, SRM)
// CST = (FXL, BDF)
// XXH = (KVH, KSM)
// FJP = (PKX, DSF)
// DTS = (FFF, DQM)
// CMG = (VBJ, DBF)
// NHD = (TCJ, DHF)
// KKF = (RVP, FVR)
// LDS = (VPJ, MPN)
// GHC = (DBK, SCS)
// KVK = (NFV, MXJ)
// NTN = (TDC, VNC)
// FCR = (DCR, FQH)
// PLK = (GHT, PBT)
// VJF = (VJN, PVB)
// TKR = (GHS, TTP)
// PQJ = (VGB, SGP)
// TGM = (JQM, PPK)
// LFQ = (QGB, QXB)
// RDP = (HSF, MQV)
// SGP = (HVK, XMV)
// FTB = (RFV, MLT)
// LCX = (RSB, RSB)
// VGD = (XJB, RKG)
// PFD = (RGK, JGB)
// DBK = (RMP, RSH)
// TTC = (NDH, QDJ)
// PVF = (QRG, QCV)
// BGV = (TDS, DRK)
// VHF = (XTB, TGM)
// DBF = (GGT, BRQ)
// TFG = (SVV, FCV)
// MDK = (THF, PLQ)
// NDF = (BSP, STC)
// SMZ = (KHB, TST)
// SLC = (BKM, BCS)
// NSV = (VVM, VQG)
// GCA = (XQT, RCD)
// FVD = (NXJ, MBJ)
// HCH = (MRF, RQJ)
// PLN = (BNK, CLF)
// TTP = (BCP, SLC)
// BRF = (SHR, CTK)
// KCX = (PDR, HHQ)
// GMG = (NFV, MXJ)
// SNN = (XDS, LRD)
// SBB = (JXL, BFK)
// NCV = (KVH, KSM)
// DQQ = (FFF, DQM)
// THT = (MFP, VSD)
// GVH = (KHF, TKB)
// HPC = (MKX, SVS)
// KSS = (QQQ, HSR)
// NCP = (FCV, SVV)
// FGB = (LGN, LKJ)
// TST = (DFV, GND)
// PJR = (VMQ, HPB)
// BHB = (VMQ, HPB)
// LMG = (SHS, XJC)
// GGT = (TQQ, XQK)
// PKR = (QQR, JGG)
// FLR = (LJP, VQT)
// NFK = (HKG, BPJ)
// MGG = (SST, MCT)
// BVD = (SNV, TTH)
// GHX = (GMK, JXG)
// PDR = (HCD, HNG)
// XJN = (NHR, CBN)
// XRG = (LBQ, MTV)
// VFM = (MMS, VXT)
// PPP = (LHR, HJH)
// FJG = (NLS, CCF)
// NDK = (RHD, BVD)
// VSB = (LKB, CCX)
// NJG = (PTK, MCD)
// MLS = (XCQ, FCR)
// QSM = (CBJ, GRG)
// PTC = (NJG, FLT)
// MRJ = (PLQ, THF)
// HJD = (XTB, TGM)
// XCQ = (DCR, FQH)
// HPN = (CQD, CTP)
// BDJ = (JND, JRB)
// PXL = (VXT, MMS)
// NFV = (SFX, BDQ)
// SNQ = (PQJ, TNG)
// LSL = (KFN, JFL)
// SMK = (FQS, FJJ)
// QDV = (BDX, LJF)
// GMK = (TSJ, SVF)
// GDP = (MML, MML)
// GRG = (PVF, CKG)
// CXF = (MNJ, TBZ)
// LKM = (HJH, LHR)
// GHS = (BCP, SLC)
// XBH = (BDS, NDQ)
// NLL = (NJT, QCJ)
// MXJ = (BDQ, SFX)
// FCF = (QQQ, QQQ)
// SXG = (LFQ, TTZ)
// PLP = (MJL, FPL)
// FSV = (SBB, JFC)
// NLH = (TDS, DRK)
// QDM = (GHX, GGM)
// JJB = (MSQ, MMK)
// TRS = (BXN, RLM)
// DMP = (RTP, CHG)
// XGG = (PCC, XKH)
// MCT = (NLK, DTM)
// DLC = (JTQ, BLF)
// VBJ = (GGT, BRQ)
// XQD = (NTN, XRC)
// FKM = (QKK, JBQ)
// PNN = (RGN, KTC)
// LCM = (DTG, GHC)
// LKJ = (LFV, RNG)
// HRR = (JND, JRB)
// BDN = (SNQ, NVC)
// RSH = (PJS, LHG)
// CTP = (DJM, NHF)
// XMV = (CFJ, MDV)
// HXM = (PTP, XVQ)
// CKG = (QCV, QRG)
// GKK = (CRG, MPJ)
// LNS = (VSB, GNQ)
// RVP = (JJB, LCN)
// DVH = (QLD, QGV)
// CPH = (PMN, QSC)
// BXQ = (CPH, DSQ)
// SDM = (DSB, CNV)
// RNN = (SHM, LSL)
// VQC = (GKH, DMP)
// KXV = (GKN, PTC)
// TNK = (NMK, PKR)
// TSL = (MTV, LBQ)
// VSD = (LGH, HNM)
// QRQ = (QXH, GRQ)
// NKS = (NSL, HPN)
// TQC = (JQK, TXF)
// THF = (TVM, KKF)
// VSL = (PLN, GDS)
// SSN = (FTB, NXF)
// NHF = (BFG, XTZ)
// HSP = (QRQ, DFC)
// JQM = (BNP, PMD)
// GDV = (RVK, MQF)
// MTK = (TGD, CHV)
// FFX = (DSN, XXJ)
// HKG = (THT, KNJ)
// RCN = (DCB, XFN)
// HCD = (TDF, BQM)
// TKJ = (JPV, GRR)
// RVK = (HXX, PRL)
// HDN = (TRT, VXL)
// KHQ = (DQQ, DTS)
// MPJ = (PLP, KBG)
// SFX = (KTT, NTG)
// NMJ = (BGV, NLH)
// LXK = (CRB, GXD)
// KBG = (FPL, MJL)
// GNQ = (LKB, CCX)
// MRV = (RVK, MQF)
// PKH = (NPN, MHQ)
// NLK = (LTJ, RXP)
// LBH = (VTP, SGG)
// NTG = (VCX, XPS)
// CCD = (GVF, SSJ)
// BBB = (SSR, JXV)
// NSL = (CQD, CQD)
// BNK = (SGS, JQD)
// TTB = (KVK, GMG)
// FDR = (RBS, TXD)
// PJG = (RTV, JQS)
// LGV = (LSB, NPF)
// XVQ = (MCL, BDN)
// BMJ = (KRT, XXN)
// XCM = (LXK, VKJ)
// CCF = (SDR, PTQ)
// GSS = (PJR, BHB)
// CJL = (QKK, JBQ)
// FBT = (VJF, SGL)
// DSB = (QKQ, RBK)
// SGS = (MLQ, PXT)
// PKX = (KPF, CNQ)
// JND = (SDG, SND)
// DJM = (BFG, BFG)
// LHK = (SBB, JFC)
// QLD = (SGX, KDP)
// NPF = (VDC, KHQ)
// BRQ = (XQK, TQQ)
// NGQ = (JNB, NFK)
// NFH = (MPN, VPJ)
// KHF = (LKG, GLD)
// XKC = (XTX, XTX)
// DJG = (XGL, BTF)
// LGN = (RNG, LFV)
// HQV = (CJL, FKM)
// JPV = (SVD, XJN)
// TSJ = (NMD, MGG)
// QRG = (HBD, CST)
// FXL = (PFX, HVV)
// TNG = (VGB, SGP)
// HXX = (GCQ, TCG)
// RTP = (CDD, QJR)
// RXN = (LFQ, LFQ)
// MVK = (BVD, RHD)
// PLR = (FVP, DHP)
// GRR = (XJN, SVD)
// DHJ = (VRN, DTR)
// HSF = (TSS, JSQ)
// TXN = (FGF, NMV)
// CBJ = (CKG, PVF)
// GHT = (RCN, NTR)
// SMH = (FJG, LQD)
// CVN = (PLR, DDF)
// SJK = (TTF, SLQ)
// LMN = (XHT, CFF)
// KLQ = (GMG, KVK)
// KXC = (CHP, NLL)
// KNM = (LKJ, LGN)
// QHK = (LNV, GKK)
// BTH = (KVR, FNQ)
// QFV = (PRK, LTV)
// DBH = (HND, HFC)
// CRG = (KBG, PLP)
// TCG = (DVF, BXQ)
// SJQ = (KPR, QKP)
// JMJ = (TTB, KLQ)
// RFV = (XBH, CGX)
// AAA = (QDM, GMV)
// JTQ = (HRR, BDJ)
// MHQ = (HPQ, KXC)
// SDG = (HGR, RJN)
// PNS = (FMC, JKB)
// KHB = (DFV, GND)
// NXJ = (MLS, HLT)
// HND = (LVF, BBJ)
// FCZ = (RCD, XQT)
// NFP = (FVD, KPH)
// NTH = (FVH, DJG)
// GMV = (GHX, GGM)
// FKT = (CLC, BTH)
// LTV = (BKP, HVT)
// VLF = (DLX, FMB)
// NNP = (NFH, LDS)
// GQV = (RTR, NMJ)
// MCD = (PFK, HPC)
// XML = (RNR, GJF)
// TXD = (LGT, QSM)
// DKG = (RTV, JQS)
// MQF = (PRL, HXX)
// XJB = (HKV, FLR)
// SHS = (VVH, CHN)
// PMD = (NSV, BMQ)
// TLJ = (DMP, GKH)
// CMA = (TST, KHB)
// CRB = (KSF, BRK)
// XQT = (TXN, LNN)
// QHF = (XKH, PCC)
// FQM = (PKR, NMK)
// DHP = (NKS, RCB)
// KSM = (DKP, SDM)
// LKB = (RQV, BRF)
// BVL = (TRB, PNN)
// GJF = (NTH, JRX)
// HTC = (HRL, HXM)
// JGB = (QVX, GMR)
// VJV = (CJL, FKM)
// RGK = (QVX, GMR)
// KPF = (JCK, XDV)
// LNV = (CRG, MPJ)
// QNP = (LXK, VKJ)
// MFT = (NJK, VVL)
// PBT = (RCN, NTR)
// CKV = (XHT, CFF)
// RCD = (TXN, LNN)
// MBJ = (HLT, MLS)
// QDC = (NMJ, RTR)
// SVV = (FJC, MJR)
// STN = (LQC, HFR)
// QXB = (RPJ, MHL)
// VJN = (TVB, BBB)
// GKH = (RTP, CHG)
// XGL = (PMX, FFX)
// KNH = (FGB, KNM)
// TVN = (QKP, KPR)
// JFC = (BFK, JXL)
// LHG = (TFG, NCP)
// HFT = (HND, HFC)
// DKP = (DSB, CNV)
// LGH = (DCG, QPN)
// LGC = (VVL, NJK)
// HSC = (NTJ, QQL)
// CFF = (JMJ, GHL)
// PFH = (SGL, VJF)
// LGT = (GRG, CBJ)
// JSQ = (SFH, RVQ)
// VDM = (CLC, BTH)
// NTR = (DCB, XFN)
// KVH = (DKP, SDM)
// BVQ = (LSH, SDX)
// NRC = (QCH, TRS)
// DCB = (KBT, TSR)
// DGC = (FMC, JKB)
// VMQ = (LJR, LJR)
// MXG = (LSL, SHM)
// CPM = (TRS, QCH)
// DLX = (LQN, TJC)
// GDS = (BNK, CLF)
// JRK = (PGJ, NHD)
// JXV = (DRH, CVN)
// SVD = (CBN, NHR)
// LCN = (MSQ, MMK)
// MJL = (RQL, RGF)
// JLT = (QRQ, DFC)
// BGP = (DPV, VXC)
// PSQ = (PJR, BHB)
// NTJ = (KGM, VDB)
// SGX = (VFM, PXL)
// QBQ = (MCM, VNV)
// CHV = (QJN, CMG)
// DRK = (BKT, LBH)
// SVS = (NPV, HCH)
// BCP = (BKM, BCS)
// BXN = (PSQ, GSS)
// GQJ = (SMH, XHX)
// NPV = (RQJ, MRF)
// NMV = (HTC, DTX)
// LKR = (SPG, SJK)
// HLT = (XCQ, FCR)
// SKX = (HSC, CFR)
// SDR = (BLQ, FKV)
// FCN = (FKT, VDM)
// VPB = (CJR, FHK)
// MHL = (PFJ, TTC)
// XQK = (BBK, PBQ)
// MDV = (SCJ, BKF)
// VDC = (DQQ, DTS)
// RTV = (LDP, PCN)
// GRQ = (FDR, DHG)
// NDH = (JGX, SSN)
// NCG = (GNR, SRM)
// LQN = (BVL, KQM)
// NHR = (FQM, TNK)
// LJR = (GDP, GDP)
// JXL = (VKV, MJQ)
// QCH = (BXN, RLM)
// QGB = (MHL, RPJ)
// DDN = (GLT, DHJ)
// SHR = (BGP, FCX)
// DPV = (MVK, NDK)
// XHT = (GHL, JMJ)
// QKK = (LCX, LCX)
// TRT = (QFV, NHT)
// PBQ = (DPX, LNS)
// JHL = (HHQ, PDR)
// DCG = (JLX, VSL)
// SST = (NLK, DTM)
// QPN = (JLX, VSL)
// GXS = (FJP, DCM)
// VJX = (DKB, FCZ)
// XXJ = (HDN, LLB)
// JPM = (VNV, MCM)
// QGV = (SGX, KDP)
// QNA = (QGB, QXB)
// CQD = (DJM, DJM)
// TTF = (TVN, SJQ)
// CHP = (QCJ, NJT)
// BBJ = (LVT, TKJ)
// VKJ = (CRB, GXD)
// LJF = (FFL, KXV)
// TKD = (MML, ZZZ)
// QKP = (CKV, LMN)
// CQF = (STC, BSP)
// PHM = (FHK, CJR)
// BTF = (PMX, FFX)
// JRX = (FVH, DJG)
// PMN = (NBG, NCG)
// LKG = (RNN, MXG)
// NXB = (JLH, KNH)
// MLQ = (FBT, PFH)
// JML = (XKC, GLX)
// NHT = (PRK, LTV)
// BLQ = (SKX, HGL)
// BDX = (FFL, KXV)
// DVN = (SCR, JML)
// FPL = (RQL, RGF)
// MMS = (SVR, KSV)
// FLT = (PTK, MCD)
// PTQ = (BLQ, FKV)
// DHG = (RBS, TXD)
// QSC = (NCG, NBG)
// LFV = (NXP, GMF)
// XDS = (KQP, STN)
// PVB = (BBB, TVB)
// JGX = (NXF, FTB)
// CNB = (PRR, JRK)
// TQQ = (PBQ, BBK)
// GMF = (MKH, CRH)
// SDP = (KCQ, PKV)
// MHP = (HMR, LCM)
// RRS = (QGV, QLD)
// PKV = (XKG, HTH)
// JLX = (GDS, PLN)
// RJN = (VGD, RKX)
// NMK = (QQR, JGG)
// PFK = (SVS, MKX)
// NXF = (MLT, RFV)
// VVM = (HDM, NGQ)
// VSJ = (QDG, VKM)
// RBS = (QSM, LGT)
// KFN = (RRS, DVH)
// XXN = (XMM, SKM)
// TXF = (LKM, PPP)
// DFV = (VLF, GPC)
// RMP = (PJS, LHG)
// LVP = (QDG, VKM)
// DFC = (QXH, GRQ)
// GPC = (DLX, FMB)
// LJP = (CCD, FSM)
// MPN = (PFD, RSN)
// SGG = (RHV, SNN)
// BDF = (HVV, PFX)
// QQR = (GVH, QSB)
// RPJ = (TTC, PFJ)
// NDQ = (NXV, XQD)
// RGF = (BVQ, GMB)
// TXM = (DCM, FJP)
// VRN = (XFV, MFG)
// FCX = (VXC, DPV)
// RQJ = (HFT, DBH)
// MLT = (CGX, XBH)
// TSR = (QSS, NFP)
// BCD = (VQC, TLJ)
// JQK = (PPP, LKM)
// DSF = (CNQ, KPF)
// CVS = (LDS, NFH)
// VTP = (SNN, RHV)
// FTA = (MHG, CRF)
// RNR = (NTH, JRX)
// DRH = (PLR, DDF)
// KSV = (SMK, NHC)
// VKM = (HFV, LMG)
// DTR = (XFV, MFG)
// MML = (QDM, GMV)
// HPQ = (CHP, NLL)
// GKF = (QHK, TDM)
// TDF = (DHX, LPT)
// PXT = (FBT, PFH)
// BRK = (VQB, JXJ)
// VXT = (KSV, SVR)
// HNM = (QPN, DCG)
// HHQ = (HNG, HCD)
// MPG = (JJS, SMZ)
// CGS = (QDC, GQV)
// GMR = (GQJ, RMH)
// BKF = (CNB, NKP)
// VDB = (VPB, PHM)
// DSQ = (PMN, QSC)
// DTX = (HRL, HXM)
// QXH = (FDR, DHG)
// LPT = (QDV, LHL)
// DKB = (XQT, RCD)
// QJN = (VBJ, DBF)
// FVR = (JJB, LCN)
// MFG = (CPM, NRC)
// FMC = (MDK, MRJ)
// JLL = (RXN, SXG)
// NQK = (LCM, HMR)
// KBT = (QSS, NFP)
// DHX = (QDV, LHL)
// SKM = (JHL, KCX)
// FSM = (SSJ, GVF)
// NVC = (TNG, PQJ)
// SRM = (HSP, JLT)
// FCM = (TDM, QHK)
// NPN = (HPQ, KXC)
// JGG = (QSB, GVH)
// DCM = (DSF, PKX)
// BLF = (BDJ, HRR)
// JXJ = (JCC, LGV)
// PSX = (PBT, GHT)
// CRH = (NXX, BCD)
// SCS = (RSH, RMP)
// LTJ = (FSV, LHK)
// PSV = (PKV, KCQ)
// TVM = (FVR, RVP)
// LSH = (DDN, HNX)
// XTX = (RXN, RXN)
// RKG = (FLR, HKV)
// JNB = (BPJ, HKG)
// GKN = (NJG, FLT)
// RLM = (PSQ, GSS)
// CNQ = (XDV, JCK)
// HFR = (TQC, KLB)
// RQV = (SHR, CTK)
// DSN = (HDN, LLB)
// FFF = (KSR, KSR)
// FJJ = (FCF, KSS)
// KPH = (NXJ, MBJ)
// KCQ = (XKG, HTH)
// PPK = (BNP, PMD)
// TKB = (LKG, GLD)
// JQD = (MLQ, PXT)
// BPJ = (THT, KNJ)
// RBK = (FCN, MTB)
// PDK = (GHS, TTP)
// SDX = (DDN, HNX)
// BQM = (DHX, LPT)
// KNJ = (MFP, VSD)
// CLC = (FNQ, KVR)
// XPS = (NXB, SXK)
// CLF = (JQD, SGS)
// DQM = (KSR, LQK)
// XKG = (MRV, GDV)
// RHD = (TTH, SNV)
// RTR = (BGV, NLH)
// QSB = (TKB, KHF)
// BKP = (PJG, DKG)
// RMH = (XHX, SMH)
// PGR = (PNS, DGC)
// GND = (VLF, GPC)
// PCC = (QNP, XCM)
// KDP = (PXL, VFM)
// SPG = (TTF, SLQ)
// SXK = (KNH, JLH)
// PFX = (MFT, LGC)
// BKM = (PLK, PSX)
// TGD = (CMG, QJN)
// NXV = (NTN, XRC)
// MFP = (HNM, LGH)
// MQQ = (RSB, MPG)
// TBZ = (CRF, MHG)
// XDV = (TKR, PDK)
// DVF = (CPH, DSQ)
// SNV = (GXS, TXM)
// DCR = (HJD, VHF)
// QDG = (LMG, HFV)
// MHG = (FHT, BMJ)
// NKP = (PRR, JRK)
// XRC = (VNC, TDC)
// JFL = (RRS, DVH)
// KRT = (SKM, XMM)
// CDD = (DVN, PDM)
// NXP = (MKH, CRH)
// LVT = (GRR, JPV)
// NJT = (RLC, MTK)
// HVV = (MFT, LGC)
// RNG = (GMF, NXP)
// SVR = (SMK, NHC)
// QDJ = (SSN, JGX)
// RQL = (BVQ, GMB)
// HMR = (GHC, DTG)
// CGX = (BDS, NDQ)
// MJQ = (LVP, VSJ)
// XJC = (CHN, VVH)
// FFL = (GKN, PTC)
// XJS = (SJK, SPG)
// JQS = (PCN, LDP)
// SHM = (JFL, KFN)
// HPB = (LJR, RSS)
// JXG = (SVF, TSJ)
// STC = (QBQ, JPM)
// FHT = (XXN, KRT)
// LRD = (KQP, STN)
// VCX = (SXK, NXB)
// KSR = (TLF, TLF)
// KQM = (PNN, TRB)
// KTC = (TSL, XRG)
// VKV = (VSJ, LVP)
// XTB = (PPK, JQM)
// BFK = (MJQ, VKV)
// GLT = (VRN, DTR)
// VPJ = (PFD, RSN)
// BKT = (SGG, VTP)
// BMQ = (VVM, VQG)
// KVR = (QHF, XGG)
// LNH = (QDC, GQV)
// SLQ = (SJQ, TVN)
// CJR = (RDP, MLK)
// JCK = (TKR, PDK)
// GVF = (XXH, NCV)
// LQC = (TQC, KLB)
// TSS = (SFH, RVQ)
// HRL = (XVQ, PTP)
// TDM = (GKK, LNV)
// BNP = (BMQ, NSV)
// BFG = (RNQ, PKH)
// CFJ = (BKF, SCJ)
// QQQ = (JPX, JPX)
// MQV = (JSQ, TSS)
// XHX = (LQD, FJG)
// PMX = (XXJ, DSN)
// KGM = (VPB, PHM)
// GNR = (JLT, HSP)
// NLS = (PTQ, SDR)
// MSQ = (VJV, HQV)
// FMB = (TJC, LQN)
// XFV = (NRC, CPM)
// RSN = (JGB, RGK)
// PRK = (HVT, BKP)
// HFV = (XJC, SHS)
// SVF = (NMD, MGG)
// QVX = (GQJ, RMH)
// TCF = (BLF, JTQ)
// MLK = (HSF, MQV)
// RVQ = (FCM, GKF)
// GLX = (XTX, JLL)
// PDM = (SCR, JML)
// HGR = (RKX, VGD)
// JRB = (SND, SDG)
// FKV = (SKX, HGL)
// TDC = (LNH, CGS)
// FVH = (XGL, BTF)
// NHC = (FQS, FJJ)
// BBK = (LNS, DPX)
// VVH = (NNP, CVS)
// NJK = (DLC, TCF)
// SGL = (VJN, PVB)
// MTV = (NQK, MHP)
// PJS = (TFG, NCP)
// DTG = (SCS, DBK)
// TCJ = (SDP, PSV)
// VGB = (HVK, XMV)
// MCL = (SNQ, NVC)
// NXX = (TLJ, VQC)
// HVK = (MDV, CFJ)
// NMD = (MCT, SST)
// TTZ = (QXB, QGB)
// VNC = (LNH, CGS)
// GMB = (LSH, SDX)
// CHN = (NNP, CVS)
// FCV = (MJR, FJC)
// HNG = (TDF, BQM)
// SCR = (XKC, GLX)
// DDF = (DHP, FVP)
// CTK = (BGP, FCX)
// CHG = (QJR, CDD)
// VXL = (QFV, NHT)
// SSJ = (XXH, NCV)
// RNQ = (NPN, MHQ)
// FJC = (XJF, XML)
// XTZ = (PKH, RNQ)
// CBN = (TNK, FQM)
// RSB = (JJS, JJS)
// TTH = (GXS, TXM)
// HJH = (LKR, XJS)
// VQB = (JCC, LGV)
// HKV = (LJP, VQT)
// RGN = (XRG, TSL)
// MKX = (NPV, HCH)
// JJS = (TST, KHB)
// JPX = (MNJ, MNJ)
// HTH = (MRV, GDV)
// VQT = (CCD, FSM)
// PGJ = (DHF, TCJ)
// DHF = (SDP, PSV)
// XJF = (GJF, RNR)
// LQD = (CCF, NLS)
// MRF = (DBH, HFT)
// FNQ = (XGG, QHF)
// GGM = (JXG, GMK)
// BDS = (NXV, XQD)
// MCM = (PGR, LJH)
// LDP = (NDF, CQF)
// QCJ = (RLC, MTK)
// CCX = (RQV, BRF)
// HBD = (BDF, FXL)
// CBA = (RNQ, PKH)
// MJR = (XJF, XML)
// JCC = (LSB, NPF)
// VQG = (NGQ, HDM)
// RCB = (NSL, HPN)
// QCV = (HBD, CST)
// TDS = (LBH, BKT)
// CNV = (QKQ, RBK)
// KLB = (JQK, TXF)
// XKH = (QNP, XCM)
// SCJ = (CNB, NKP)
// HGL = (CFR, HSC)
// BDQ = (NTG, KTT)
// PRR = (PGJ, NHD)
// KPR = (CKV, LMN)
// HFC = (LVF, BBJ)
// TLF = (DKB, DKB)
// SND = (HGR, RJN)
// VNV = (PGR, LJH)
// PLQ = (KKF, TVM)
// LVF = (LVT, TKJ)
// QJR = (PDM, DVN)
// HVT = (DKG, PJG)
// CFR = (QQL, NTJ)
// DTM = (LTJ, RXP)
// HNX = (GLT, DHJ)
// QKQ = (FCN, MTB)
// PTK = (HPC, PFK)
// FQS = (FCF, KSS)
// JBQ = (LCX, MQQ)
// RXP = (LHK, FSV)
// SSR = (DRH, CVN)
// LSB = (VDC, KHQ)
// DPX = (GNQ, VSB)
// ZZZ = (GMV, QDM)
// XFN = (TSR, KBT)
// LNN = (NMV, FGF)
// KQP = (LQC, HFR)
// LHR = (XJS, LKR)
// GCQ = (DVF, BXQ)
// VVL = (TCF, DLC)
// MKH = (NXX, BCD)''';
