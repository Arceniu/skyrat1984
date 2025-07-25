/// Defines for what loadout slot a corresponding item belongs to.
#define LOADOUT_ITEM_BELT "belt"
#define LOADOUT_ITEM_EARS "ears"
#define LOADOUT_ITEM_GLASSES "glasses"
#define LOADOUT_ITEM_GLOVES "gloves"
#define LOADOUT_ITEM_HEAD "head"
#define LOADOUT_ITEM_MASK "mask"
#define LOADOUT_ITEM_NECK "neck"
#define LOADOUT_ITEM_SHOES "shoes"
#define LOADOUT_ITEM_SUIT "suit"
#define LOADOUT_ITEM_UNIFORM "under"
#define LOADOUT_ITEM_ACCESSORY "accessory"
#define LOADOUT_ITEM_INHAND "inhand_items"
#define LOADOUT_ITEM_MISC "pocket_items"
#define LOADOUT_ITEM_TOYS "toys"

/// Used to set custom descriptions.
#define INFO_DESCRIBED "description"

/// Max amonut of misc / backpack items that are allowed.
#define MAX_ALLOWED_MISC_ITEMS 3
/// SS1984 REMOVAL OF ERP ITEMS

/// Defines for extra info blurbs, for loadout items.
#define TOOLTIP_NO_ARMOR "Armorless"
#define TOOLTIP_NO_DAMAGE "CEREMONIAL - This item has very low force and is cosmetic."
#define TOOLTIP_RANDOM_COLOR "Random Color"
#define TOOLTIP_GREYSCALE "GREYSCALED - This item can be customized via the greyscale modification UI."
#define TOOLTIP_RENAMABLE "RENAMABLE - This item can be given a custom name."

#define LOADOUT_OVERRIDE_JOB "Delete job items"
#define LOADOUT_OVERRIDE_BACKPACK "Move job to backpack"
#define LOADOUT_OVERRIDE_CASE "Place all in case"

// NOTE TO FUTURE CODERS: If you increase this to a huge number, please restrict the overall **amount** of items players can take,
// if item count restrictions have been significantly increased. You will end up with massively bloated save sizes otherwise.
#define LOADOUT_MAX_PRESETS 12
#define LOADOUT_MAX_NAME_LENGTH 24
