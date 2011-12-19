(*----------------------------------------------------------------------------*)
(* Copyright (c) 1997 by the POW! team                                        *)
(*                    e-Mail: pow@fim.uni-linz.ac.at                          *)
(*----------------------------------------------------------------------------*)
(*  09-01-1997 rel. 32/1.0 LEI                                                *)
(**---------------------------------------------------------------------------  
  This is an internal module of the Win32 OPAL implementation.

  This module must not be linked into a DLL. It has to be part of the library
  linked to the application program.
  ----------------------------------------------------------------------------*)

MODULE StartHlp;

IMPORT I:=IOManage,SYSTEM,WD:=WinDef,StartHlpInt,Param;


PROCEDURE [_APICALL] WinMain*(hInstance: WD.HANDLE; (* current instance      *)
                              lpCmdLine: WD.LPSTR;  (* command line          *)
                              nCmdShow: LONGINT     (* show-window type      *)
                             ): WD.LRESULT;              
TYPE
  P=POINTER TO ARRAY 200 OF CHAR;
VAR
  p:P;
BEGIN
  I.CreateApp;
  p:=SYSTEM.VAL(P,lpCmdLine);
  Param.Parse(p^); 
  IF I.RunApp(hInstance,lpCmdLine,nCmdShow) THEN
    StartHlpInt.ProgMain;
    RETURN I.EndApp();
  ELSE
    RETURN 0;
  END;
END WinMain;

END StartHlp.
