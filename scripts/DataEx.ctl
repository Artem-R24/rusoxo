// $License: NOLICENSE
//--------------------------------------------------------------------------------
/**
  @file $relPath
  @copyright $copyright
  @author Lych
*/

//--------------------------------------------------------------------------------
// used libraries (#uses)

//--------------------------------------------------------------------------------
// variables and constants

//--------------------------------------------------------------------------------
/**
*/
main()
{
  SetFlameStatus();
  PackCommands();
  UnpackBits();
}

void  SetFlameStatus()
{
    for (int i = 2; i<=6;i++) //
   {
    dpConnect("SetFlameStatus2_6CB",
           "Stage" + i +".PIT.Status:_online.._value","Stage" + i + ".SV_Nitro.State:_online.._value", "GD" + (string)(i-1) + ".Flame:_online.._value");
  }
    dpConnect("SetFlameStatus7CB",
           "Stage7.PIT.Status:_online.._value","Stage7.SV_Nitro.State:_online.._value", "GD6.Flame:_online.._value","GD7.Flame:_online.._value");
    dpConnect("SetFlameStatus1CB",
           "PIT0250A.Status:_online.._value", "PIT0250B.Status:_online.._value","Stage1.SV_Nitro.State:_online.._value", "GD1.Flame:_online.._value");
    dpConnect("SetFlameStatusAcidCB",
           "SV0276.State:_online.._value", "GD8.Flame:_online.._value","GD9.Flame:_online.._value");
}


void SetFlameStatus2_6CB(string DP1, int PIT_Status, string DP2, bool  Nitro_ON, string DP3, bool FlameGD)
{
 bool Flame, FlowNitro;
 string DPname;
 DPname =  substr(DP1 ,strpos(DP1,"Stage") ,6);
 if ((PIT_Status & 16) != 16)
 {
   Flame = false;
   FlowNitro = false;
 }
 else
   if (Nitro_ON)
       {
         Flame = false;
         FlowNitro = true;
       }
       else
         if (FlameGD)
         {
           Flame = true;
           FlowNitro = false;
         }

 dpSet(DPname + ".Flame:_original.._value", Flame, DPname + ".FlowNitro:_original.._value", FlowNitro );
}

void SetFlameStatus7CB(string DP1, int PIT_Status, string DP2, bool  Nitro_ON, string DP3, bool FlameGD1, string DP4, bool FlameGD2)
{
 bool Flame, FlowNitro;
 if ((PIT_Status & 16) != 16)
 {
   Flame = false;
   FlowNitro = false;
 }
 else
   if (Nitro_ON)
       {
         Flame = false;
         FlowNitro = true;
       }
       else
         if (FlameGD1 || FlameGD2)
         {
           Flame = true;
           FlowNitro = false;
         }

 dpSet("Stage7.Flame:_original.._value", Flame, "Stage7.FlowNitro:_original.._value", FlowNitro );
}

void SetFlameStatus1CB(string DP1, int PITA_Status, string DP2, int PITB_Status,string DP3, bool  Nitro_ON, string DP4, bool FlameGD)
{
 bool Flame, FlowNitro, PITA_ON, PITB_ON;
 PITA_ON = (PITA_Status & 263) == 0;
 PITB_ON = (PITB_Status & 263) == 0;
 if (Nitro_ON)
 {
  Flame = false;
  FlowNitro = true;
  }
  else if ((PITA_Status & 271 )==0 || (PITB_Status & 271) ==0)
      {
       Flame = FlameGD;
       FlowNitro = false;
      }
       else
           {
             Flame = false;
             FlowNitro = false;
           }
 dpSet("Stage1.Flame:_original.._value", Flame, "Stage1.FlowNitro:_original.._value", FlowNitro );
}

void SetFlameStatusAcidCB(string DP2, bool  SV_ON, string DP3, bool FlameGD1, string DP4, bool FlameGD2)
{
 bool Flame;
   if (SV_ON)
       {
         Flame = FlameGD1 || FlameGD2;
       }
       else
         {
           Flame = false;
         }

 dpSet("StageAcid.Flame:_original.._value", Flame);
}

void  PackCommands()
{

  dyn_string DPL1,DPL2,DPL3,DPL4,DPL5,DPL6;

  DPL1[1]= "Stage2.SV.CMD.Open:_online.._value";
  DPL1[2]="Stage3.SV.CMD.Open:_online.._value";
  DPL1[3]="Stage4.SV.CMD.Open:_online.._value";
  DPL1[4]="Stage5.SV.CMD.Open:_online.._value";
  DPL1[5]="Stage6.SV.CMD.Open:_online.._value";
  DPL1[6]= "Stage7.SV.CMD.Open:_online.._value";
  DPL1[7]= "Stage1.SV_Nitro.CMD.Open:_online.._value";
  DPL1[8]= "Stage2.SV_Nitro.CMD.Open:_online.._value";
  DPL1[9]= "Stage3.SV_Nitro.CMD.Open:_online.._value";
  DPL1[10]= "Stage4.SV_Nitro.CMD.Open:_online.._value";
  DPL1[11]= "Stage5.SV_Nitro.CMD.Open:_online.._value";
  DPL1[12]= "Stage6.SV_Nitro.CMD.Open:_online.._value";
  DPL1[13]="Stage7.SV_Nitro.CMD.Open:_online.._value";
  DPL1[14]= "GD1.SV.CMD.Open:_online.._value";
  DPL1[15]= "GD2.SV.CMD.Open:_online.._value";
  DPL1[16]="GD3.SV.CMD.Open:_online.._value";
  dpConnectUserData("PackCommandsCB","ButtonsON_1.:_original.._value", DPL1);

  DPL2[1]= "GD4.SV.CMD.Open:_online.._value";
  DPL2[2]= "GD5.SV.CMD.Open:_online.._value";
  DPL2[3]= "GD6.SV.CMD.Open:_online.._value";
  DPL2[4]= "GD7.SV.CMD.Open:_online.._value";
  DPL2[5]= "GD8.SV.CMD.Open:_online.._value";
  DPL2[6]= "GD9.SV.CMD.Open:_online.._value";
  DPL2[7]= "SV0273.CMD.Open:_online.._value";
  DPL2[8]= "SV0276.CMD.Open:_online.._value";
  DPL2[9]= "GD1.CMD.TurnOnIgnition:_online.._value";
  DPL2[10]= "GD2.CMD.TurnOnIgnition:_online.._value";
  DPL2[11]= "GD3.CMD.TurnOnIgnition:_online.._value";
  DPL2[12]= "GD4.CMD.TurnOnIgnition:_online.._value";
  DPL2[13]= "GD5.CMD.TurnOnIgnition:_online.._value";
  DPL2[14]= "GD6.CMD.TurnOnIgnition:_online.._value";
  DPL2[15]= "GD7.CMD.TurnOnIgnition:_online.._value";
  DPL2[16]= "GD8.CMD.TurnOnIgnition:_online.._value";
  dpConnectUserData("PackCommandsCB","ButtonsON_2.:_original.._value", DPL2);

  DPL3[1]= "GD9.CMD.TurnOnIgnition:_online.._value";
  DPL3[2]= "GD1.CMD.Start:_online.._value";
  DPL3[3]= "GD2.CMD.Start:_online.._value";
  DPL3[4]= "GD3.CMD.Start:_online.._value";
  DPL3[5]= "GD4.CMD.Start:_online.._value";
  DPL3[6]= "GD5.CMD.Start:_online.._value";
  DPL3[7]= "GD6.CMD.Start:_online.._value";
  DPL3[8]= "GD7.CMD.Start:_online.._value";
  DPL3[9]= "GD8.CMD.Start:_online.._value";
  DPL3[10]= "GD9.CMD.Start:_online.._value";
  DPL3[11]= "CMD_START.:_online.._value";
  DPL3[12]= "CMD_SERVICE_MODE.:_online.._value";
  DPL3[13]= "CMD_RESET.:_online.._value";
  DPL3[14]= "CMD_STEP_IGN.:_online.._value";
  dpConnectUserData("PackCommandsCB","ButtonsON_3.:_original.._value", DPL3);

  DPL4[1]= "Stage2.SV.CMD.Close:_online.._value";
  DPL4[2]="Stage3.SV.CMD.Close:_online.._value";
  DPL4[3]="Stage4.SV.CMD.Close:_online.._value";
  DPL4[4]="Stage5.SV.CMD.Close:_online.._value";
  DPL4[5]="Stage6.SV.CMD.Close:_online.._value";
  DPL4[6]= "Stage7.SV.CMD.Close:_online.._value";
  DPL4[7]= "Stage1.SV_Nitro.CMD.Close:_online.._value";
  DPL4[8]= "Stage2.SV_Nitro.CMD.Close:_online.._value";
  DPL4[9]= "Stage3.SV_Nitro.CMD.Close:_online.._value";
  DPL4[10]= "Stage4.SV_Nitro.CMD.Close:_online.._value";
  DPL4[11]= "Stage5.SV_Nitro.CMD.Close:_online.._value";
  DPL4[12]= "Stage6.SV_Nitro.CMD.Close:_online.._value";
  DPL4[13]="Stage7.SV_Nitro.CMD.Close:_online.._value";
  DPL4[14]= "GD1.SV.CMD.Close:_online.._value";
  DPL4[15]= "GD2.SV.CMD.Close:_online.._value";
  DPL4[16]="GD3.SV.CMD.Close:_online.._value";
  dpConnectUserData("PackCommandsCB","Buttons_OFF1.:_original.._value", DPL4);

  DPL5[1]= "GD4.SV.CMD.Close:_online.._value";
  DPL5[2]= "GD5.SV.CMD.Close:_online.._value";
  DPL5[3]= "GD6.SV.CMD.Close:_online.._value";
  DPL5[4]= "GD7.SV.CMD.Close:_online.._value";
  DPL5[5]= "GD8.SV.CMD.Close:_online.._value";
  DPL5[6]= "GD9.SV.CMD.Close:_online.._value";
  DPL5[7]= "SV0273.CMD.Close:_online.._value";
  DPL5[8]= "SV0276.CMD.Close:_online.._value";
  dpConnectUserData("PackCommandsCB","Buttons_OFF2.:_original.._value", DPL5);

  DPL6[1]= "CMD_EMPTY.:_online.._value";
  DPL6[2]= "GD1.CMD.Stop:_online.._value";
  DPL6[3]= "GD2.CMD.Stop:_online.._value";
  DPL6[4]= "GD3.CMD.Stop:_online.._value";
  DPL6[5]= "GD4.CMD.Stop:_online.._value";
  DPL6[6]= "GD5.CMD.Stop:_online.._value";
  DPL6[7]= "GD6.CMD.Stop:_online.._value";
  DPL6[8]= "GD7.CMD.Stop:_online.._value";
  DPL6[9]= "GD8.CMD.Stop:_online.._value";
  DPL6[10]= "GD9.CMD.Stop:_online.._value";
  DPL6[11]= "CMD_STOP.:_online.._value";
  DPL6[12]= "CMD_SERVICE_OFF.:_online.._value";
  dpConnectUserData("PackCommandsCB","Buttons_OFF3.:_original.._value", DPL6);

}


void  PackCommandsCB(
                      string DP_CMD,
                      dyn_string DPL, dyn_bool cmd)
{
  int packed = 0;
  for (int i =1; i <= dynlen(DPL); i++)
  {
   if (cmd[i]) packed+= 1 << (i-1);
  };
 dpSetWait(DP_CMD,packed);
 delay(0,500);
  for (int i =1; i <= dynlen(DPL); i++)
  {
   strreplace(DPL[i], "online.._value", "original.._value");
   if (cmd[i]) dpSetWait(DPL[i],false);
  };
}

void UnpackBits()
{
  for (int i=1; i<=9; i++)
  {
    dpConnectUserData("UnpackBitsGD_CB",i,"PackedBitsGD" + i + ".:_online.._value");
  };
  for (int i=1; i<=7; i++)
  {
    dpConnectUserData("UnpackBitsStage_CB",i,"PackedBitsStage" + i + ".:_online.._value");
  };

  dpConnect("UnpackBitsAddData_CB","PackedBitsAddData1.:_online.._value");

}

void UnpackBitsGD_CB( int num,string DP, int value)
{
  dyn_string DPL;
  dyn_bool bVal;
  DPL[1]= "GD" + num + ".SV.Control:_original.._value";
  DPL[2]= "GD" + num + ".SV.State:_original.._value";
  DPL[3]= "GD" + num + ".SV.Alarm:_original.._value";
  DPL[4]= "GD" + num + ".Flame:_original.._value";
  DPL[5]= "GD" + num + ".AlarmNOFlame:_original.._value";
  DPL[6]= "GD" + num + ".IgnitionStart:_original.._value";
  DPL[7]= "GD" + num + ".IgnitionON:_original.._value";
  DPL[8]= "GD" + num + ".AlarmIgnitionFail:_original.._value";
  DPL[9]= "GD" + num + ".AlarmCheckTE:_original.._value";
  DPL[10]= "GD" + num + ".AlarmCheckBT:_original.._value";
  DPL[11]= "GD" + num + ".TE_Flame:_original.._value";
  DPL[12]= "GD" + num + ".BT_Flame:_original.._value";
  DPL[13]= "GD" + num + ".AlarmBTError:_original.._value";
  DPL[14]= "GD" + num + ".Work:_original.._value";
  for (int i = 1; i<=14;i++) bVal[i] = value & (1 << (i-1));
  dpSet(DPL,bVal);
}

void UnpackBitsStage_CB( int num,string DP, int value)
{
  dyn_string DPL;
  dyn_bool bVal;
  string sNum;
  DPL[1]= "Stage" + num + ".SV.Control:_original.._value";
  DPL[2]= "Stage" + num + ".SV.State:_original.._value";
  DPL[3]= "Stage" + num + ".SV.Alarm:_original.._value";
  DPL[4]= "Stage" + num + ".SV_Nitro.Control:_original.._value";
  DPL[5]= "Stage" + num + ".SV_Nitro.State:_original.._value";
  DPL[6]= "Stage" + num + ".SV_Nitro.Alarm:_original.._value";
  DPL[7]= "Stage" + num + ".UV.Open:_original.._value";
  DPL[8]= "Stage" + num + ".UV.Close:_original.._value";
  DPL[9]= "Stage" + num + ".UV.Alarm:_original.._value";
  DPL[10]= "Stage" + num + ".Break:_original.._value";
  for (int i = 1; i<=10;i++) bVal[i] = value & (1 << (i-1));
  dpSet(DPL,bVal);
}

void UnpackBitsAddData_CB( string DP, int value)
{
  dyn_string DPL;
  dyn_bool bVal;
  DPL[1]= "SV0273.Control:_original.._value";
  DPL[2]= "SV0273.State:_original.._value";
  DPL[3]= "SV0273.Alarm:_original.._value";
  DPL[4]= "SV0276.Control:_original.._value";
  DPL[5]= "SV0276.State:_original.._value";
  DPL[6]= "SV0276.Alarm:_original.._value";
  DPL[7]= "CHECK_PIT250.:_original.._value";
  DPL[8]= "SMOKE_TEMP.:_original.._value";
  DPL[9]= "WALL_TEMP.:_original.._value";
  DPL[10]= "SERVICE_MODE.:_original.._value";
  DPL[11]= "STEP_IGNITION.:_original.._value";
  for (int i = 1; i<=11;i++) bVal[i] = value & (1 << (i-1));
  dpSet(DPL,bVal);

}
