program powerWIN;

uses 
   SysUtils, Process;

(* BANNER *)
function banner() :string;
   begin
      writeln('');
      writeln(' -------------------- powerWIN ---------------------');
      writeln('|                                                   |');
      writeln('|    example : powerwin.exe [OPTIONS.....]          |');
      writeln('|    OPTIONS :                                      |');
      writeln('|    [ -h | --help ] .......... about this tool     |');
      writeln('|    [ -slp | --sleep ] ....... sleep option        |');
      writeln('|    [ -rst | --restart ] ..... restart option      |');
      writeln('|    [ -shd | --shutdown ] .... shutdown option     |');
      writeln('|                                                   |');
      writeln(' --------------------------------------------------- ');
      banner:='';
   end;

(* SLEEP *)
function sleep() :string;
   begin
      ExecuteProcess('cmd','/c rundll32.exe powrprof.dll, SetSuspendState Sleep');
      sleep:='';
   end;

(* RESTART *)
function restart() :string;
   begin
      ExecuteProcess('cmd','/c shutdown /r');
      restart:='';
   end;

(* SHUTDOWN *)
function shutdown() :string;
   begin
      ExecuteProcess('cmd','/c shutdown /s');
      shutdown:='';
   end;

var
   OPTION           :string;

begin

   OPTION           := ParamStr(1);
   
   (* OPTIONS *)

   if ( OPTION = '-h' ) or ( OPTION = '--help' ) then
      begin
         banner();
      end
   else if ( OPTION = '-slp' ) or ( OPTION = '--sleep' ) then
      begin
         sleep();
      end
   else if ( OPTION = '-rst' ) or ( OPTION = '--restart' ) then
      begin
         restart();
      end
   else if ( OPTION = '-shd' ) or ( OPTION = '--shutdown' ) then
      begin
         shutdown();
      end
   else
      begin
         banner();
      end;

end.
