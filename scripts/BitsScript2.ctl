// $License: NOLICENSE
//--------------------------------------------------------------------------------
/**
  @file $relPath
  @copyright $copyright
  @author user
*/

//--------------------------------------------------------------------------------
// Libraries used (#uses)

//--------------------------------------------------------------------------------
// Variables and Constants

//--------------------------------------------------------------------------------
/**
*/
dyn_string DPL_FROMUNPACK;
dyn_dyn_string DPL_TOUNPACK;


main()
{
  InitDyns();
  CheckDyns();
  //PackBits();
  //UnpackBits();
}

InitDyns()
{
  int bit, word;

  for(int i=0; i<63; ++i)
  {
    DPL_FROMUNPACK[i+1]="byte"+i+".";
  }
  for(int i=1; i<=8; ++i)
  {
    DPL_TOUNPACK[1][2*i-1]="zx_40110"+i+".OP.SimOn";
    DPL_TOUNPACK[1][2*i]="zx_40110"+i+".CL.SimOn";

    DPL_TOUNPACK[2][2*i-1]="zx_4011"+(i+8<10 ? "0" : "")+(i+8)+".OP.SimOn";
    DPL_TOUNPACK[2][2*i]="zx_4011"+(i+8<10 ? "0" : "")+(i+8)+".CL.SimOn";

    DPL_TOUNPACK[3][2*i-1]="zx_4011"+(i+16>20 ? i+20 : i+16)+".OP.SimOn";
    DPL_TOUNPACK[3][2*i]="zx_4011"+(i+16>20 ? i+20 : i+16)+".CL.SimOn";
  }
  for(int i=1; i<=8; ++i)
  {
    DPL_TOUNPACK[11][2*i-1]="zx_40110"+i+".OP.SimValue";
    DPL_TOUNPACK[11][2*i]="zx_40110"+i+".CL.SimValue";

    DPL_TOUNPACK[12][2*i-1]="zx_4011"+(i+8<10 ? "0" : "")+(i+8)+".OP.SimValue";
    DPL_TOUNPACK[12][2*i]="zx_4011"+(i+8<10 ? "0" : "")+(i+8)+".CL.SimValue";

    DPL_TOUNPACK[13][2*i-1]="zx_4011"+(i+16>20 ? i+20 : i+16)+".OP.SimValue";
    DPL_TOUNPACK[13][2*i]="zx_4011"+(i+16>20 ? i+20 : i+16)+".CL.SimValue";
  }
  for(int i=1; i<=8; ++i)
  {
    DPL_TOUNPACK[21][2*i-1]="zx_40110"+i+".OP.ProgUse";
    DPL_TOUNPACK[21][2*i]="zx_40110"+i+".CL.ProgUse";

    DPL_TOUNPACK[22][2*i-1]="zx_4011"+(i+8<10 ? "0" : "")+(i+8)+".OP.ProgUse";
    DPL_TOUNPACK[22][2*i]="zx_4011"+(i+8<10 ? "0" : "")+(i+8)+".CL.ProgUse";

    DPL_TOUNPACK[23][2*i-1]="zx_4011"+(i+16>20 ? i+20 : i+16)+".OP.ProgUse";
    DPL_TOUNPACK[23][2*i]="zx_4011"+(i+16>20 ? i+20 : i+16)+".CL.ProgUse";
  }
  for(int i=1; i<=8; ++i)
  {
    DPL_TOUNPACK[31][2*i-1]="zx_40110"+i+".OP.In";
    DPL_TOUNPACK[31][2*i]="zx_40110"+i+".CL.In";

    DPL_TOUNPACK[32][2*i-1]="zx_4011"+(i+8<10 ? "0" : "")+(i+8)+".OP.In";
    DPL_TOUNPACK[32][2*i]="zx_4011"+(i+8<10 ? "0" : "")+(i+8)+".CL.In";

    DPL_TOUNPACK[33][2*i-1]="zx_4011"+(i+16>20 ? i+20 : i+16)+".OP.In";
    DPL_TOUNPACK[33][2*i]="zx_4011"+(i+16>20 ? i+20 : i+16)+".CL.In";
  }

  bit=1; word=41;
  for(int i=1; i<=4; ++i)
  {

    DPL_TOUNPACK[word][bit++]="pit40110"+i+"a.Alms.hi_alm";
    DPL_TOUNPACK[word][bit++]="pit40110"+i+"b.Alms.hi_alm";

    DPL_TOUNPACK[word][bit++]="pit40110"+i+"a.Alms.lo_alm";
    DPL_TOUNPACK[word][bit++]="pit40110"+i+"b.Alms.lo_alm";
  }

  bit=1; word=42;
  for(int i=5;i<=20;++i)
  {
    if(i==13||i==17) continue;

    if(bit==17) {++word; bit=1;}
    DPL_TOUNPACK[word][bit++]="pit4011"+(i<10 ? "0" : "")+i+".Alms.hi_alm";
    DPL_TOUNPACK[word][bit++]="pit4011"+(i<10 ? "0" : "")+i+".Alms.lo_alm";

  }
  DPL_TOUNPACK[word][bit++]="tt401112.Alms.hi_alm";
  DPL_TOUNPACK[word][bit++]="tt401112.Alms.hi_alm";

  for(int i=1;i<=10;++i)
  {
    if(bit==17) {++word; bit=1;}
    DPL_TOUNPACK[word][bit++]="te4011"+(i<10 ? "0" : "")+i+".Alms.hi_alm";
    DPL_TOUNPACK[word][bit++]="te4011"+(i<10 ? "0" : "")+i+".Alms.lo_alm";
  }
  InitDynAlms(46,"break");
  InitDynAlms(49,"disable");
  InitDynAlms(52,"error");
  InitDynAlms(55,"short");

  bit=1; word=6;
  for(int i=1; i<=28; ++i)
  {
    if(bit==17) {++word; bit=1;}
    DPL_TOUNPACK[word][bit++]="xy4011"+(i<10 ? "0" : "")+i+".SimOn";
  }
  bit=1; word=16;
  for(int i=1; i<=28; ++i)
  {
    if(bit==17) {++word; bit=1;}
    DPL_TOUNPACK[word][bit++]="xy4011"+(i<10 ? "0" : "")+i+".SimValue";
  }
  bit=1; word=26;
  for(int i=1; i<=28; ++i)
  {
    if(bit==17) {++word; bit=1;}
    DPL_TOUNPACK[word][bit++]="xy4011"+(i<10 ? "0" : "")+i+".ProgUse";
  }
  bit=1; word=36;
  for(int i=1; i<=28; ++i)
  {
    if(bit==17) {++word; bit=1;}
    DPL_TOUNPACK[word][bit++]="xy4011"+(i<10 ? "0" : "")+i+".Out";
  }
}

InitDynAlms(int word, string alm)
{
  int bit=1;
  for(int i=1; i<=4; ++i)
  {
    DPL_TOUNPACK[word][bit++]="pit40110"+i+"a.Alms."+alm;
    DPL_TOUNPACK[word][bit++]="pit40110"+i+"b.Alms."+alm;
  }
  for(int i=5;i<=20;++i)
  {
    if(i==13||i==17) continue;

    if(bit==17) {++word; bit=1;}
    DPL_TOUNPACK[word][bit++]="pit4011"+(i<10 ? "0" : "")+i+".Alms."+alm;
  }
  DPL_TOUNPACK[word][bit++]="tt401112.Alms."+alm;
  for(int i=1;i<=10;++i)
  {
    if(bit==17) {++word; bit=1;}
    DPL_TOUNPACK[word][bit++]="te4011"+(i<10 ? "0" : "")+i+".Alms."+alm;
  }
}

CheckDyns()
{
  for(int i=1;i<=dynlen(DPL_TOUNPACK);++i)
  {
    for(int j=1;j<=dynlen(DPL_TOUNPACK[i]);++j)
      Debug(DPL_TOUNPACK[i][j]);
    DebugN("");
  }
}

PackBits()
{
  dpConnectUserData("PackBits_CB", "buttons_off_pnl1",makeDynString(/**/));
  dpConnectUserData("PackBits_CB", "buttons_off_pnl2",makeDynString(/**/));
  dpConnectUserData("PackBits_CB", "buttons_off_pnl3",makeDynString(/**/));
  dpConnectUserData("PackBits_CB", "buttons_on_pnl1",makeDynString(/**/));
  dpConnectUserData("PackBits_CB", "buttons_on_pnl2",makeDynString(/**/));
  dpConnectUserData("PackBits_CB", "buttons_on_pnl3",makeDynString(/**/));
}

PackBits_CB(string dp_cmd, dyn_string dpl, dyn_bool cmd)
{
  int packed = 0;
  for (int i =1; i <= dynlen(dpl); i++)
  {
    packed = packed | (cmd[i] << (i-1));
  }
  dpSetWait(dp_cmd,packed);
}

//bVal[i] = nVal & (1 << (i-1));

UnpackBits()
{
  dpConnectUserData("UnpackBits_CB", makeDynString(/**/), "byte0.");
}

UnpackBits_CB(dyn_string dpl, string dp, uint nVal)
{
  dyn_bool bVal;
  for (int i = 1; i<=16;i++)
    bVal[i] = getBit(nVal,i-1);
  dpSet(dpl,bVal);
}
