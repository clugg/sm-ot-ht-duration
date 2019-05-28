#include <sourcemod>
#include <cstrike>

#pragma semicolon 1
#pragma newdecls required

public Plugin myinfo = {
    name = "Overtime Halftime Duration",
    author = "clug",
    description = "Allows different durations for regulation and overtime halftime intermissions.",
    version = "1.0.0",
    url = "https://github.com/clugg"
};

/* custom convars */
ConVar g_cvEnabled;
ConVar g_cvRegulationHTDuration;
ConVar g_cvOvertimeHTDuration;

/* existing convars */
ConVar g_cvHTDuration;
ConVar g_cvMaxRounds;

public void OnPluginStart()
{
    g_cvEnabled = CreateConVar("sm_halftime_duration_enabled", "1", "Should the plugin modify halftime duration?", 0, true, 0.0, true, 1.0);
    g_cvRegulationHTDuration = CreateConVar("sm_halftime_duration_regulation", "15", "Duration of halftime pauses during regulation.", 0, true, 0.0, true, 120.0);
    g_cvOvertimeHTDuration = CreateConVar("sm_halftime_duration_overtime", "15", "Duration of halftime pauses during overtime.", 0, true, 0.0, true, 120.0);

    g_cvHTDuration = FindConVar("mp_halftime_duration");
    g_cvMaxRounds = FindConVar("mp_maxrounds");

    HookEventEx("round_end", Event_RoundEnd, EventHookMode_PostNoCopy);
}

public Action Event_RoundEnd(Event event, const char[] name, bool dontBroadcast)
{
    if (!g_cvEnabled.BoolValue) {
        return Plugin_Continue;
    }

    int iTotalScore = CS_GetTeamScore(CS_TEAM_T) + CS_GetTeamScore(CS_TEAM_CT);
    g_cvHTDuration.FloatValue = (iTotalScore <= g_cvMaxRounds.FloatValue) ? g_cvRegulationHTDuration.FloatValue : g_cvOvertimeHTDuration.FloatValue;

    return Plugin_Continue;
}
