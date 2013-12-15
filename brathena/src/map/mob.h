/****************************************************************************!
*                _           _   _   _                                       *    
*               | |__  _ __ / \ | |_| |__   ___ _ __   __ _                  *  
*               | '_ \| '__/ _ \| __| '_ \ / _ \ '_ \ / _` |                 *   
*               | |_) | | / ___ \ |_| | | |  __/ | | | (_| |                 *    
*               |_.__/|_|/_/   \_\__|_| |_|\___|_| |_|\__,_|                 *    
*                                                                            *
*                                                                            *
* \file src/map/mob.h                                                        *
* Descri��o Prim�ria.                                                        *
* Descri��o mais elaborada sobre o arquivo.                                  *
* \author brAthena, Athena, eAthena                                          *
* \date ?                                                                    *
* \todo ?                                                                    *  
*****************************************************************************/

#ifndef _MOB_H_
#define _MOB_H_

#include "../common/mmo.h" // struct item
#include "guild.h" // struct guardian_data
#include "map.h" // struct status_data, struct view_data, struct mob_skill
#include "status.h" // struct status data, struct status_change
#include "unit.h" // unit_stop_walking(), unit_stop_attack()
#include "npc.h"

  //Dummy mob to be returned when a non-existant one is requested.

#define MAX_RANDOMMONSTER 5

// Change this to increase the table size in your mob_db to accomodate a larger mob database.
// Be sure to note that IDs 4001 to 4048 are reserved for advanced/baby/expanded classes.
// Notice that the last 1000 entries are used for player clones, so always set this to desired value +1000
#define MAX_MOB_DB 5000

//The number of drops all mobs have and the max drop-slot that the steal skill will attempt to steal from.
#define MAX_MOB_DROP 10
#define MAX_MVP_DROP 3
#define MAX_STEAL_DROP 7

//Min time between AI executions
#define MIN_MOBTHINKTIME 100
//Min time before mobs do a check to call nearby friends for help (or for slaves to support their master)
#define MIN_MOBLINKTIME 1000

//Distance that slaves should keep from their master.
#define MOB_SLAVEDISTANCE 2

// These define the range of available IDs for clones. [Valaris]
#define MOB_CLONE_START (MAX_MOB_DB-999)
#define MOB_CLONE_END MAX_MOB_DB

//Used to determine default enemy type of mobs (for use in eachinrange calls)
#define DEFAULT_ENEMY_TYPE(md) ((md)->special_state.ai?BL_CHAR:BL_MOB|BL_PC|BL_HOM|BL_MER)

//Externals for the status effects. [Epoque]
extern const int mob_manuk[8];
extern const int mob_splendide[5];

//Mob skill states.
enum MobSkillState {
	MSS_ANY = -1,
	MSS_IDLE,
	MSS_WALK,
	MSS_LOOT,
	MSS_DEAD,
	MSS_BERSERK, //Aggressive mob attacking
	MSS_ANGRY,   //Mob retaliating from being attacked.
	MSS_RUSH,    //Mob following a player after being attacked.
	MSS_FOLLOW,  //Mob following a player without being attacked.
	MSS_ANYTARGET,
};

enum MobDamageLogFlag
{
	MDLF_NORMAL = 0,
	MDLF_HOMUN,
	MDLF_PET,
};

enum size {
	SZ_MEDIUM = 0,
	SZ_SMALL,
	SZ_BIG,
};

enum ai {
	AI_NONE = 0,
	AI_ATTACK,
	AI_SPHERE,
	AI_FLORA,
	AI_ZANZOU,
};

struct mob_skill {
	enum MobSkillState state;
	uint16 skill_id,skill_lv;
	short permillage;
	int casttime,delay;
	short cancel;
	short cond1,cond2;
	short target;
	int val[5];
	short emotion;
	unsigned short msg_id;
};

struct mob_chat {
	unsigned short msg_id;
	unsigned long color;
	char msg[CHAT_SIZE_MAX];
};

struct spawn_info {
	unsigned short mapindex;
	unsigned short qty;
};

//Dynamic mob database, allows saving of memory when there's big gaps in the mob_db [Skotlex]
struct mob_db *mob_db_data[MAX_MOB_DB+1];
struct mob_db *mob_dummy;  

struct mob_db {
	char sprite[NAME_LENGTH],name[NAME_LENGTH],jname[NAME_LENGTH];
	unsigned int base_exp,job_exp;
	unsigned int mexp;
	short range2,range3;
	short race2;	// celest
	unsigned short lv;
	struct { int nameid,p; } dropitem[MAX_MOB_DROP];
	struct { int nameid,p; } mvpitem[MAX_MVP_DROP];
	struct status_data status;
	struct view_data vd;
	unsigned int option;
	int summonper[MAX_RANDOMMONSTER];
	int maxskill;
	struct mob_skill skill[MAX_MOBSKILL];
	struct spawn_info spawn[10];
};

struct mob_data {
	struct block_list bl;
	struct unit_data  ud;
	struct view_data *vd;
	struct status_data status, *base_status; //Second one is in case of leveling up mobs, or tiny/large mobs.
	struct status_change sc;
	struct mob_db *db;	//For quick data access (saves doing mob_db(md->class_) all the time) [Skotlex]
	char name[NAME_LENGTH];
	struct {
		unsigned int size : 2; //Small/Big monsters.
		unsigned int ai : 4; //Special ai for summoned monsters.
							//0: Normal mob.
							//1: Standard summon, attacks mobs.
							//2: Alchemist Marine Sphere
							//3: Alchemist Summon Flora
							//4: Summon Zanzou
							//5: Summon Legion
		unsigned int clone : 1;/* is clone? 1:0 */
	} special_state; //Special mob information that does not needs to be zero'ed on mob respawn.
	struct {
		unsigned int aggressive : 1; //Signals whether the mob AI is in aggressive mode or reactive mode. [Skotlex]
		unsigned int steal_coin_flag : 1;
		unsigned int soul_change_flag : 1; // Celest
		unsigned int alchemist: 1;
		unsigned int spotted: 1;
		unsigned int npc_killmonster: 1; //for new killmonster behavior
		unsigned int rebirth: 1; // NPC_Rebirth used
		unsigned int boss : 1;
		enum MobSkillState skillstate;
		unsigned char steal_flag; //number of steal tries (to prevent steal exploit on mobs with few items) [Lupus]
		unsigned char attacked_count; //For rude attacked.
		int provoke_flag; // Celest
	} state;
	struct guardian_data* guardian_data;
	struct {
		int id;
		unsigned int dmg;
		unsigned int flag : 2; //0: Normal. 1: Homunc exp. 2: Pet exp
	} dmglog[DAMAGELOG_SIZE];
	struct spawn_data *spawn; //Spawn data.
	int spawn_timer; //Required for Convex Mirror
	struct item *lootitem;
	short class_;
	unsigned int tdmg; //Stores total damage given to the mob, for exp calculations. [Skotlex]
	int level;
	int target_id,attacked_id;
	int areanpc_id; //Required in OnTouchNPC (to avoid multiple area touchs)
	unsigned int bg_id; // BattleGround System

	int64 next_walktime,last_thinktime,last_linktime,last_pcneartime,dmgtick;
	short move_fail_count;
	short lootitem_count;
	short min_chase;

	int deletetimer;
	int master_id,master_dist;

	int8 skill_idx;// key of array
	int64 skilldelay[MAX_MOBSKILL];
	char npc_event[EVENT_NAME_LENGTH];
	/**
	 * Did this monster summon something?
	 * Used to flag summon deletions, saves a worth amount of memory
	 **/
	bool can_summon;
	/**
	 * MvP Tombstone NPC ID
	 **/
	int tomb_nid;
};



enum {
	MST_TARGET	=	0,
	MST_RANDOM,	//Random Target!
	MST_SELF,
	MST_FRIEND,
	MST_MASTER,
	MST_AROUND5,
	MST_AROUND6,
	MST_AROUND7,
	MST_AROUND8,
	MST_AROUND1,
	MST_AROUND2,
	MST_AROUND3,
	MST_AROUND4,
	MST_AROUND	=	MST_AROUND4,

	MSC_ALWAYS	=	0x0000,
	MSC_MYHPLTMAXRATE,
	MSC_MYHPINRATE,
	MSC_FRIENDHPLTMAXRATE,
	MSC_FRIENDHPINRATE,
	MSC_MYSTATUSON,
	MSC_MYSTATUSOFF,
	MSC_FRIENDSTATUSON,
	MSC_FRIENDSTATUSOFF,
	MSC_ATTACKPCGT,
	MSC_ATTACKPCGE,
	MSC_SLAVELT,
	MSC_SLAVELE,
	MSC_CLOSEDATTACKED,
	MSC_LONGRANGEATTACKED,
	MSC_AFTERSKILL,
	MSC_SKILLUSED,
	MSC_CASTTARGETED,
	MSC_RUDEATTACKED,
	MSC_MASTERHPLTMAXRATE,
	MSC_MASTERATTACKED,
	MSC_ALCHEMIST,
	MSC_SPAWN,
};

// The data structures for storing delayed item drops
struct item_drop {
	struct item item_data;
	struct item_drop* next;
};
struct item_drop_list {
	int16 m, x, y;                       // coordinates
	int first_charid, second_charid, third_charid; // charid's of players with higher pickup priority
	struct item_drop* item;            // linked list of drops
};

struct mob_db* mob_db(int class_);
int mobdb_searchname(const char *str);
int mobdb_searchname_array(struct mob_db** data, int size, const char *str, int flag);
int mobdb_checkid(const int id);
struct view_data* mob_get_viewdata(int class_);

struct mob_data *mob_once_spawn_sub(struct block_list *bl, int16 m,
	short x, short y, const char *mobname, int class_, const char *event, unsigned int size, unsigned int ai);

int mob_once_spawn(struct map_session_data* sd, int16 m, int16 x, int16 y,
	const char* mobname, int class_, int amount, const char* event, unsigned int size, unsigned int ai);

int mob_once_spawn_area(struct map_session_data* sd, int16 m,
	int16 x0, int16 y0, int16 x1, int16 y1, const char* mobname, int class_, int amount, const char* event, unsigned int size, unsigned int ai);

bool mob_ksprotected (struct block_list *src, struct block_list *target);

int mob_spawn_guardian(const char* mapname, int16 x, int16 y, const char* mobname, int class_, const char* event, int guardian, bool has_index);	// Spawning Guardians [Valaris]
int mob_spawn_bg(const char* mapname, int16 x, int16 y, const char* mobname, int class_, const char* event, unsigned int bg_id);
int mob_guardian_guildchange(struct mob_data *md); //Change Guardian's ownership. [Skotlex]

int mob_randomwalk(struct mob_data *md,int64 tick);
int mob_warpchase(struct mob_data *md, struct block_list *target);
int mob_target(struct mob_data *md,struct block_list *bl,int dist);
int mob_unlocktarget(struct mob_data *md, int64 tick);
struct mob_data* mob_spawn_dataset(struct spawn_data *data);
int mob_spawn(struct mob_data *md);
int mob_delayspawn(int tid, int64 tick, int id, intptr_t data);
int mob_setdelayspawn(struct mob_data *md);
int mob_parse_dataset(struct spawn_data *data);
void mob_log_damage(struct mob_data *md, struct block_list *src, int damage);
void mob_damage(struct mob_data *md, struct block_list *src, int damage);
int mob_dead(struct mob_data *md, struct block_list *src, int type);
void mob_revive(struct mob_data *md, unsigned int hp);
void mob_heal(struct mob_data *md,unsigned int heal);

#define mob_stop_walking(md, type) (unit_stop_walking(&(md)->bl, (type)))
#define mob_stop_attack(md)        (unit_stop_attack(&(md)->bl))

#define mob_is_battleground(md) (map[(md)->bl.m].flag.battleground && ((md)->class_ == MOBID_BARRICADE2 || ((md)->class_ >= MOBID_FOOD_STOR && (md)->class_ <= MOBID_PINK_CRYST)) )
#define mob_is_gvg(md) (map[(md)->bl.m].flag.gvg_castle && ( (md)->class_ == MOBID_EMPERIUM || (md)->class_ == MOBID_BARRICADE1 || (md)->class_ == MOBID_GUARIDAN_STONE1 || (md)->class_ == MOBID_GUARIDAN_STONE2) )
#define mob_is_treasure(md) (((md)->class_ >= MOBID_TREAS01 && (md)->class_ <= MOBID_TREAS40) || ((md)->class_ >= MOBID_TREAS41 && (md)->class_ <= MOBID_TREAS49))

void mob_clear_spawninfo();
int do_init_mob(void);
int do_final_mob(void);

int mob_timer_delete(int tid, int64 tick, int id, intptr_t data);
int mob_deleteslave(struct mob_data *md);

int mob_random_class (int *value, size_t count);
int mob_get_random_id(int type, int flag, int lv);
int mob_class_change(struct mob_data *md,int class_);
int mob_warpslave(struct block_list *bl, int range);
int mob_linksearch(struct block_list *bl,va_list ap);

int mobskill_use(struct mob_data *md,int64 tick,int event);
int mobskill_event(struct mob_data *md,struct block_list *src,int64 tick, int flag);
int mobskill_castend_id( int tid, int64 tick, int id,int data );
int mobskill_castend_pos( int tid, int64 tick, int id,int data );
int mob_summonslave(struct mob_data *md2,int *value,int amount,uint16 skill_id);
int mob_countslave(struct block_list *bl);
int mob_count_sub(struct block_list *bl, va_list ap);

int mob_makedummymobdb(int);
int mob_spawn_guardian_sub(int tid, int64 tick, int id, intptr_t data);
int mob_skill_id2skill_idx(int class_,uint16 skill_id);

int mob_is_clone(int class_);

void mob_name_constants(void);

int mob_clone_spawn(struct map_session_data *sd, int16 m, int16 x, int16 y, const char *event, int master_id, int mode, int flag, unsigned int duration);
int mob_clone_delete(struct mob_data *md);

void mob_reload(void);

// MvP Tomb System
void mvptomb_create(struct mob_data *md, char *killer, time_t time);
void mvptomb_destroy(struct mob_data *md);

#endif /* _MOB_H_ */
