#===================================================================
# Author : 
# Date : 
# See also :
#===================================================================

use Win32::OLE;
use Win32::OLE::Variant qw(:DEFAULT nothing);
#use Switch;
$Win32::OLE::Warn = 3;
#===================================================================
#
#===================================================================

## number of Resets 
my $reset_num = 10;
## time between resets 
my $sleep_time = 150;

my $TraceString = "i1= 1"; # The Debug Trace string that we expect as a reaction to the callback
my $TimeOut = 5000; # The Timeout for the reaction


main();
exit (0);
#===================================================================
#
#===================================================================
sub main
{

   my $TraceClient;
   my $Result;
   my $LogLine = Variant(VT_VARIANT|VT_BYREF, 0);
   my $str = Variant(VT_VARIANT|VT_BYREF, "empty");

   print "Connect to TraceClient\n";
   Win32::OLE::CreateObject('TraceScript.HBTraceCmd', $TraceClient) ||
         die "can't connnect to TraceClient: $!\n";

   # disable all Processes in Traceclient
   $TraceClient->EnableAllProcesses( 0 );

   print "load url ";
   
   my $url_test = "http://www.infotiker.mobi/test1/";
   print "$url_test \n";
   $TraceClient->SetActiveProcess ("OnlineServices");
   $TraceClient->CallBack("callbacks_CBrowser_LoadURL", 0, $url_test);

   sleep(6);



   $TraceClient = nothing;
}
