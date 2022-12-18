/// @description Save settings
ini_open(file_save)
ini_write_real("UFOGX", "hs", global.HiScore);
ini_write_real("UFOGX", "col", Palette);
ini_close();