
//CentCom Accesses
/// CentCom Naval Admirals access
#define ACCESS_CENT_ADMIRAL "cent_admiral"
/// CentCom Naval Fleet Admiral access
#define ACCESS_CENT_FLEET_ADMIRAL "cent_fleet_admiral"
/// Special Blackops+ Access
#define ACCESS_CENT_BLACKOPS "cent_blackops"
/// Special Operations officer Access
#define ACCESS_CENT_SECURITY "cent_security"
/// Special Ops Commander / blackops access(WIP)
#define ACCESS_CENT_SPECOPS_LEADER "cent_specops_leader"
/// Special Operations officer Access
#define ACCESS_CENT_SPECOPS_OFFICER "cent_specops_officer"
/// CentCom Official access
#define ACCESS_CENT_OFFICIAL "cent_official"
/// CentCom Cargo office access
#define ACCESS_CENT_SUPPLY "cent_supply"


//fleet admiral access and region
#define CENTCOM_NAVAL_ACCESS list( \
	ACCESS_CENT_ADMIRAL, \
	ACCESS_CENT_FLEET_ADMIRAL, \
)
/// Name for the NanoTrasen Naval region.
#define REGION_CENTCOM_NAVAL "Nanotrasen Naval"
/// Used to seed the accesses_by_region list in SSid_access. A list of all CENTCOM_NAVAL_ACCESS regional accesses.
#define REGION_ACCESS_CENTCOM_NAVAL CENTCOM_NAVAL_ACCESS

//nri
#define ACCESS_NRI "nri"
#define ACCESS_NRI_POLICE "nri_police"
