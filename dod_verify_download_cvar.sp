#include <sourcemod>
#include <sdktools>

#define PLUGIN_VERSION "1.0"

public Plugin:myinfo =
{
	name = "dod verify download ok",
	author = "Bensib, vintage",
	description = "Verify if cvar download is OK for players or kick them with a message",
	version = PLUGIN_VERSION,
	url = "http://www.dodsplugins.com/"
}

public OnPluginStart()
{
	CreateConVar("dod_download_check", PLUGIN_VERSION, "dod Download Check Version", FCVAR_PROTECTED|FCVAR_PLUGIN|FCVAR_SPONLY|FCVAR_REPLICATED|FCVAR_NOTIFY)
}

public OnClientPutInServer(client)
{
		QueryClientConVar(client, "cl_allowdownload", ConVarQueryFinished:nodl);
		QueryClientConVar(client, "cl_downloadfilter", ConVarQueryFinished:dlfilter);
}
public nodl(QueryCookie:cookie, client, ConVarQueryResult:result, const String:cvarName1[], const String:cvarValue1[])
{
	if(IsClientConnected(client))
	{
		if(strcmp(cvarValue1, "0", true) == 0)
		{
			KickClient(client, "Veuillez autoriser le téléchargement! A de suite !n/Please allow download and come back soon !");
		}
		else
		{
	    return Plugin_Handled;
		}

	}
}

public dlfilter(QueryCookie:cookie, client, ConVarQueryResult:result, const String:cvarName2[], const String:cvarValue2[])
{
		if(strcmp(cvarValue2, "all", false) == 0);
		{
			KickClient(client, "Veuillez autoriser le téléchargement! A de suite !n/Please allow download and come back soon !");
		}
		else
		{
		    return Plugin_Handled;
		}
}
