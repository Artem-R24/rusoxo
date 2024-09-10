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
dyn_uint VAL_FROMUNPACK;
dyn_dyn_bool VAL_TOUNPACK;


dyn_string DPL_TOPACK;
dyn_dyn_string DPL_FROMPACK;
dyn_bit32 VAL_TOPACK;
dyn_dyn_bool VAL_FROMPACK;


main()
{
  InitDyns();
  InitDynVals();
  //CheckDyns();
  PackBits();
  UnpackBits();
}

InitDyns()
{
  int bit, word;

  for(int i=0; i<70; ++i)
  {
    DPL_FROMUNPACK[i+1]="byte"+i+".";
  }

////////////////////////////////////////////////////////////////////////////////////

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
  for(int i=1; i<=4; ++i)
  {
    DPL_TOUNPACK[4][i]="G"+i+"_2.SimOn";
    DPL_TOUNPACK[14][i]="G"+i+"_2.SimValue";
    DPL_TOUNPACK[24][i]="G"+i+"_2.ProgUse";
    DPL_TOUNPACK[34][i]="G"+i+"_2.In";
  }
  DPL_TOUNPACK[4][5]="ALARM_BTN_SimOn.";
  DPL_TOUNPACK[14][5]="ALARM_BTN_SimValue.";
  DPL_TOUNPACK[24][5]="ALARM_BTN_ProgUse.";
  DPL_TOUNPACK[34][5]="ALARM_BTN_in.";

  bit=1; word=41;
  for(int i=1; i<=4; ++i)
  {

    DPL_TOUNPACK[word][bit++]="pit40110"+i+"a.Alms.hi_alm";
    DPL_TOUNPACK[word][bit++]="pit40110"+i+"a.Alms.low_alm";
    DPL_TOUNPACK[word][bit++]="pit40110"+i+"b.Alms.hi_alm";
    DPL_TOUNPACK[word][bit++]="pit40110"+i+"b.Alms.low_alm";
  }

  bit=1; word=42;
  for(int i=5;i<=20;++i)
  {
    if(i==13||i==17) continue;

    if(bit==17) {++word; bit=1;}
    DPL_TOUNPACK[word][bit++]="pit4011"+(i<10 ? "0" : "")+i+".Alms.hi_alm";
    DPL_TOUNPACK[word][bit++]="pit4011"+(i<10 ? "0" : "")+i+".Alms.low_alm";

  }
  DPL_TOUNPACK[word][bit++]="tt401112.Alms.hi_alm";
  DPL_TOUNPACK[word][bit++]="tt401112.Alms.low_alm";

  for(int i=1;i<=10;++i)
  {
    if(bit==17) {++word; bit=1;}
    DPL_TOUNPACK[word][bit++]="te4011"+(i<10 ? "0" : "")+i+".Alms.hi_alm";
    DPL_TOUNPACK[word][bit++]="te4011"+(i<10 ? "0" : "")+i+".Alms.low_alm";
  }
  InitDynAlms(46,"break");
  InitDynAlms(49,"disable");
  InitDynAlms(52,"error");
  InitDynAlms(55,"short");
  InitDynAlms(58,"SimOn");

  bit=1; word=6;
  for(int i=1; i<=28; ++i)
  {
    if(bit==17) {++word; bit=1;}
    DPL_TOUNPACK[word][bit++]="xy_4011"+(i<10 ? "0" : "")+i+".SimOn";
  }
  bit=1; word=16;
  for(int i=1; i<=28; ++i)
  {
    if(bit==17) {++word; bit=1;}
    DPL_TOUNPACK[word][bit++]="xy_4011"+(i<10 ? "0" : "")+i+".SimValue";
  }
  bit=1; word=26;
  for(int i=1; i<=28; ++i)
  {
    if(bit==17) {++word; bit=1;}
    DPL_TOUNPACK[word][bit++]="xy_4011"+(i<10 ? "0" : "")+i+".ProgUse";
  }
  bit=1; word=36;
  for(int i=1; i<=28; ++i)
  {
    if(bit==17) {++word; bit=1;}
    DPL_TOUNPACK[word][bit++]="xy_4011"+(i<10 ? "0" : "")+i+".Out";
  }
  for(int i=1; i<=10; ++i)
  {
    DPL_TOUNPACK[8][i]="es4011"+(i<10 ? "0" : "")+i+".SimOn";
    DPL_TOUNPACK[18][i]="es4011"+(i<10 ? "0" : "")+i+".SimValue";
    DPL_TOUNPACK[28][i]="es4011"+(i<10 ? "0" : "")+i+".ProgUse";
    DPL_TOUNPACK[38][i]="es4011"+(i<10 ? "0" : "")+i+".Out";
  }
  DPL_TOUNPACK[61][1]="BUF_START.";
  DPL_TOUNPACK[61][2]="BUF_STOP.";
  DPL_TOUNPACK[61][3]="BUF_ACK.";
  for(int i=4; i<=13; ++i)
  {
    DPL_TOUNPACK[61][i]="STOP_GD"+(i<13 ? "0" : "")+(i-3)+".";
  }
  DPL_TOUNPACK[61][14]="STOP_LOCK.";
  DPL_TOUNPACK[61][15]="NOT_MOVE_ACK.";
  for(int i=1; i<=16; ++i)
  {
    DPL_TOUNPACK[62][i]="valve_not_move_cl_4011"+(i<10 ? "0" : "")+i+".";
    DPL_TOUNPACK[65][i]="valve_not_move_op_4011"+(i<10 ? "0" : "")+i+".";

    if (i>8) continue;

    DPL_TOUNPACK[64][i]="valve_not_move_cl_4011"+(i+16 > 20 ? i+20 : i+16)+".";
    DPL_TOUNPACK[66][i]="valve_not_move_op_4011"+(i+16 > 20 ? i+20 : i+16)+".";
  }
  for(int i=1; i<=16; ++i)
  {
    DPL_TOUNPACK[67][i]= (i<11) ? "hh_4011"+(i<10 ? "0" : "")+i+".Firing" : "CRASH_PSE_40110" + (i-10) + ".";
  }
  for(int i=1; i<=4; ++i)
  {
    DPL_TOUNPACK[68][i]="CHECK_pit40110"+i+"ab.";
  }
  DPL_TOUNPACK[68][5]="BUF_START.";
  DPL_TOUNPACK[68][6]="BUF_STOP.";
  DPL_TOUNPACK[68][7]="STOP_LOCK.";
  DPL_TOUNPACK[68][8]="SL_USE.";
  for(int i=1; i<=10; ++i)
  {
    DPL_TOUNPACK[69][i]="ignition_fall_"+(i<10 ? "0" : "")+i+".";
    DPL_TOUNPACK[70][i]="flame_out_"+(i<10 ? "0" : "")+i+".";
  }

////////////////////////////////////////////////////////////////////////////////////

  for(int i=0; i<70; ++i)
  {
    DPL_TOPACK[i+1]="cmd_byte"+i+".";
  }

  for(int i=1; i<=8; ++i)
  {
    DPL_FROMPACK[1][2*i-1]="zx_40110"+i+".OP.SimSet.SetSimOn";
    DPL_FROMPACK[1][2*i]="zx_40110"+i+".CL.SimSet.SetSimOn";

    DPL_FROMPACK[2][2*i-1]="zx_4011"+(i+8<10 ? "0" : "")+(i+8)+".OP.SimSet.SetSimOn";
    DPL_FROMPACK[2][2*i]="zx_4011"+(i+8<10 ? "0" : "")+(i+8)+".CL.SimSet.SetSimOn";

    DPL_FROMPACK[3][2*i-1]="zx_4011"+(i+16>20 ? i+20 : i+16)+".OP.SimSet.SetSimOn";
    DPL_FROMPACK[3][2*i]="zx_4011"+(i+16>20 ? i+20 : i+16)+".CL.SimSet.SetSimOn";
  }
  for(int i=1; i<=8; ++i)
  {
    DPL_FROMPACK[11][2*i-1]="zx_40110"+i+".OP.SimSet.SetSimValue";
    DPL_FROMPACK[11][2*i]="zx_40110"+i+".CL.SimSet.SetSimValue";

    DPL_FROMPACK[12][2*i-1]="zx_4011"+(i+8<10 ? "0" : "")+(i+8)+".OP.SimSet.SetSimValue";
    DPL_FROMPACK[12][2*i]="zx_4011"+(i+8<10 ? "0" : "")+(i+8)+".CL.SimSet.SetSimValue";

    DPL_FROMPACK[13][2*i-1]="zx_4011"+(i+16>20 ? i+20 : i+16)+".OP.SimSet.SetSimValue";
    DPL_FROMPACK[13][2*i]="zx_4011"+(i+16>20 ? i+20 : i+16)+".CL.SimSet.SetSimValue";
  }

  bit=1; word=6;
  for(int i=1; i<=28; ++i)
  {
    if(bit==17) {++word; bit=1;}
    DPL_FROMPACK[word][bit++]="xy_4011"+(i<10 ? "0" : "")+i+".SimSet.SetSimOn";
  }
  bit=1; word=16;
  for(int i=1; i<=28; ++i)
  {
    if(bit==17) {++word; bit=1;}
    DPL_FROMPACK[word][bit++]="xy_4011"+(i<10 ? "0" : "")+i+".SimSet.SetSimValue";
  }
  bit=1; word=26;
  for(int i=1; i<=28; ++i)
  {
    if(bit==17) {++word; bit=1;}
    DPL_FROMPACK[word][bit++]="xy_4011"+(i<10 ? "0" : "")+i+".SetProgUse";
  }
  for(int i=1; i<=10; ++i)
  {
    DPL_FROMPACK[8][i]="es4011"+(i<10 ? "0" : "")+i+".SimSet.SetSimOn";
    DPL_FROMPACK[18][i]="es4011"+(i<10 ? "0" : "")+i+".SimSet.SetSimValue";
    DPL_FROMPACK[28][i]="es4011"+(i<10 ? "0" : "")+i+".SetProgUse";
  }

  bit=1; word=58;
  for(int i=1; i<=4; ++i)
  {
    DPL_FROMPACK[word][bit++]="pit40110"+i+"a.Alms.SetSimOn";
    DPL_FROMPACK[word][bit++]="pit40110"+i+"b.Alms.SetSimOn";
  }
  for(int i=5;i<=20;++i)
  {
    if(i==13||i==17) continue;

    if(bit==17) {++word; bit=1;}
    DPL_FROMPACK[word][bit++]="pit4011"+(i<10 ? "0" : "")+i+".Alms.SetSimOn";
  }
  DPL_FROMPACK[word][bit++]="tt401112.Alms.SetSimOn";
  for(int i=1;i<=10;++i)
  {
    if(bit==17) {++word; bit=1;}
    DPL_FROMPACK[word][bit++]="te4011"+(i<10 ? "0" : "")+i+".Alms.SetSimOn";
  }

  DPL_FROMPACK[61][1]="CMD_START.";
  DPL_FROMPACK[61][2]="CMD_STOP.";
  DPL_FROMPACK[61][3]="CMD_ACK.";
  for(int i=4;i<=13;++i)
  {
    DPL_FROMPACK[61][i]="CMD_STOP_GD"+(i<13 ? "0" : "")+(i-3)+".";
  }
  DPL_FROMPACK[61][14]="CMD_STOP_LOCK.";
  DPL_FROMPACK[61][15]="CMD_NOT_MOVE_ACK.";

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

InitDynVals()
{
  for(int i=1; i<=dynlen(DPL_FROMUNPACK); ++i)
  {
    dpGet(DPL_FROMUNPACK[i],VAL_FROMUNPACK[i]);
    VAL_FROMUNPACK[i]=~(VAL_FROMUNPACK[i]);
  }

  for(int i=1; i<=dynlen(DPL_TOUNPACK); ++i)
    for(int j=1; j<=dynlen(DPL_TOUNPACK[i]); ++j)
      dpGet(DPL_TOUNPACK[i][j], VAL_TOUNPACK[i][j]);

  for(int i=1; i<=dynlen(DPL_TOPACK); ++i)
  {
    dpGet(DPL_TOPACK[i],VAL_TOPACK[i]);
  }

  for(int i=1; i<=dynlen(DPL_FROMPACK); ++i)
    for(int j=1; j<=dynlen(DPL_FROMPACK[i]); ++j)
      dpGet(DPL_FROMPACK[i][j], VAL_FROMPACK[i][j]);

}

CheckDyns()
{
  for(int i=1;i<=dynlen(DPL_FROMUNPACK);++i)
    DebugN(DPL_FROMUNPACK[i]);
}

PackBits()
{
  for(int i=1; i<=dynlen(DPL_FROMPACK); ++i)
  {
    for(int j=1; j<=dynlen(DPL_FROMPACK[i]); ++j)
      dpConnect("PackBits_CB",DPL_FROMPACK[i][j]);
  }
}

PackBits_CB(string dp, bool bVal)
{
  time t1, t2;
  int word, bit;
  for(int i=1; i<=dynlen(DPL_FROMPACK); ++i)
  {
    if(dynContains(DPL_FROMPACK[i], dpSubStr(dp, DPSUB_DP_EL))>0)
    {
      word=i;
      bit=dynContains(DPL_FROMPACK[i], dpSubStr(dp, DPSUB_DP_EL));
      break;
    }
  }
  t1=getCurrentTime();
  for(ulong count=0; count<1; ++count)
  {
    if(VAL_FROMPACK[word][bit]!=bVal)
    {
      setBit(VAL_TOPACK[word], bit-1, bVal);
      //VAL_TOPACK[word] = (bVal) ? VAL_TOPACK[word] | 1<<(bit-1) : VAL_TOPACK[word] & ~(1<<(bit-1));
      VAL_FROMPACK[word][bit] = bVal;
    }
  }
  t2=getCurrentTime();
  //DebugN(t2-t1);
  dpSetWait(DPL_TOPACK[word],VAL_TOPACK[word]);
}

UnpackBits()
{
//   for(int i=0;i<=56;++i)
//   {
//     if(dynlen(DPL_TOUNPACK[i+1])==0)
//       continue;
//     dpConnect("UnpackBits_CB",false,"byte"+i+".");
//   }
//   for(int i=1;i<=9;i++)
//   {
//     dpConnect("UnpackBits_CB","gd"+i+".packed_bits");
//     if(i<=7) dpConnect("UnpackBits_CB","stage"+i+".packed_bits");
//   }
//   dpConnect("UnpackBits_CB","adddata1.");
//   for(int i=1;i<=12;++i)
//   {
//     dpConnect("UnpackBits_CB","mb_status"+i+".");
//   }
  for(int i=1;i<=dynlen(DPL_FROMUNPACK);++i)
  {
    dpConnect("UnpackBits_CB",DPL_FROMUNPACK[i]);
  }
}

UnpackBits_CB(string dp, uint nVal)
{
  time start, end;
  int index;
  int res;
  //DebugN(dpSubStr(dp,DPSUB_DP_EL));
  index=dynContains(DPL_FROMUNPACK,dpSubStr(dp,DPSUB_DP_EL));
  if(index<1)
  {
    DebugN("Error, element not found!");
    return;
  }
  res = nVal ^ VAL_FROMUNPACK[index];
  if(res==0) return;
  //DebugN(DPL_TOUNPACK[index]);
  start=getCurrentTime();
  for(ulong count=0; count<1;count++)
  {
    for(int i=1; i<=dynlen(DPL_TOUNPACK[index]); ++i)
    {
      if(DPL_TOUNPACK[index][i]!="")
      {
        if(getBit(res,i-1))
          dpSetWait(DPL_TOUNPACK[index][i],getBit(nVal,i-1));
      }
    }
  }
  VAL_FROMUNPACK[index]=nVal;
  end=getCurrentTime();
  //DebugN((end-start));
}
