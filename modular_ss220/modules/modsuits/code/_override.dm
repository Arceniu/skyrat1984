
// overriding var/allow_ai and var/can_pai_move_suit(remove this of offs make pai app)

/obj/item/mod/control
	allow_ai = TRUE
	can_pai_move_suit = TRUE

/obj/machinery/rnd/production/techfab/awaypro
	name = "awayprot fabricator"
	allowed_buildtypes = PROTOLATHE | AWAY_LATHE

/obj/machinery/rnd/production/techfab/awayimp
	name = "awayimpr fabricator"
	allowed_buildtypes = IMPRINTER | AWAY_IMPRINTER

/obj/machinery/rnd/production/techfab/awaymega
	name = "awaymega fabricator"
	allowed_buildtypes = PROTOLATHE | IMPRINTER | AWAY_IMPRINTER | AWAY_LATHE
