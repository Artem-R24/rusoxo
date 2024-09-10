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
main()
{
  SetFlameStatus();
}

SetFlameStatus()
{
    for (int i = 2; i<=6;i++)
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

SetFlameStatus2_6CB(string DP1, int PIT_Status, string DP2, bool  Nitro_ON, string DP3, bool FlameGD)
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
